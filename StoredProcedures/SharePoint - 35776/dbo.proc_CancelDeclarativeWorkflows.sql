/****** Object:  StoredProcedure [dbo].[proc_CancelDeclarativeWorkflows]    Script Date: 5/15/2018 12:11:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CancelDeclarativeWorkflows (
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @WorkflowInstanceId uniqueidentifier
    DECLARE @Workflow CURSOR
    SET @Workflow = CURSOR LOCAL FAST_FORWARD FOR
    (
        SELECT dbo.Workflow.Id
        FROM
            dbo.Workflow INNER JOIN dbo.WorkflowAssociation
        ON
            dbo.Workflow.TemplateId = dbo.WorkflowAssociation.Id
        WHERE
            dbo.Workflow.SiteId = @SiteId AND
            (dbo.Workflow.InternalState & 2) <> 0 AND
            (dbo.WorkflowAssociation.Configuration & 64) <> 0
    )
    OPEN @Workflow
    IF @@CURSOR_ROWS <> 0
    BEGIN
        FETCH NEXT FROM @Workflow INTO @WorkflowInstanceId
        WHILE @@FETCH_STATUS = 0
        BEGIN
            EXEC proc_CancelWorkflow @SiteId, @WorkflowInstanceId
            FETCH NEXT FROM @Workflow INTO @WorkflowInstanceId
        END
        EXEC proc_UpdateDiskUsed @SiteId
    END
    CLOSE @Workflow
    DEALLOCATE @Workflow

GO
