/****** Object:  StoredProcedure [dbo].[proc_AutoCleanupWorkflows]    Script Date: 5/15/2018 12:12:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AutoCleanupWorkflows
AS
    SET NOCOUNT ON
    DECLARE @TemplateId uniqueidentifier
    DECLARE @AutoCleanupDays int
    DECLARE @SiteId uniqueidentifier
    DECLARE @WebId uniqueidentifier
    DECLARE @ListId uniqueidentifier
    DECLARE @Configuration int
    DECLARE @CleanupDate datetime
    DECLARE @Now datetime
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    DECLARE @Association CURSOR
    SET @Association = CURSOR LOCAL FAST_FORWARD FOR
    (
        SELECT Id, AutoCleanupDays, SiteId, WebId, ListId, Configuration
        FROM dbo.WorkflowAssociation
        WHERE ((AutoCleanupDays >= 0 AND AutoCleanupDays < 0x7FFFFFFF) OR ((Configuration & 512) <> 0))
    )
    OPEN @Association
    IF @@CURSOR_ROWS <> 0
    BEGIN
        FETCH NEXT FROM @Association INTO @TemplateId, @AutoCleanupDays, @SiteId, @WebId, @ListId, @Configuration
        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @CleanupDate = DATEADD(d, -(@AutoCleanupDays), @Now)
            IF (@Configuration & 512) <> 0
            BEGIN
                EXEC proc_DropWorkflowAssociation @SiteId, @TemplateId, 1 
            END
            ELSE IF @CleanupDate <= @Now
            BEGIN
                EXEC proc_AutoDropWorkflows @SiteId, NULL, @ListId, NULL, @TemplateId, @CleanupDate, 0 
            END
            FETCH NEXT FROM @Association INTO @TemplateId, @AutoCleanupDays, @SiteId, @WebId, @ListId, @Configuration
        END
    END
    CLOSE @Association
    DEALLOCATE @Association    

GO
