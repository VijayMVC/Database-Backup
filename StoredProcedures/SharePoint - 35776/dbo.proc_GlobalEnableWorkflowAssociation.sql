/****** Object:  StoredProcedure [dbo].[proc_GlobalEnableWorkflowAssociation]    Script Date: 5/15/2018 12:12:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GlobalEnableWorkflowAssociation (
    @SiteId uniqueidentifier,
    @BaseId uniqueidentifier,
    @Enabled int)
AS
    SET NOCOUNT ON
    UPDATE
        dbo.WorkflowAssociation
    SET
        Configuration = CASE WHEN (@Enabled = 1) THEN (Configuration & ~1024)ELSE (Configuration | 1024) END        
    WHERE    
        SiteId = @SiteId AND
        (@BaseId IS NULL OR
            BaseId = @BaseId)

GO
