/****** Object:  StoredProcedure [dbo].[proc_AutoQuickDropWorkflows]    Script Date: 5/15/2018 12:11:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AutoQuickDropWorkflows (
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @ListItemId int)
AS
    SET NOCOUNT ON
    DECLARE @iRet int
    SET @iRet = 0
    DECLARE @oldTranCount int
    SET @oldTranCount = @@TRANCOUNT
    DECLARE @ProcessingId uniqueidentifier
    DECLARE @cbDelta bigint
    DECLARE @Now    datetime
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    DECLARE @NULL_GUID uniqueidentifier
    SET @NULL_GUID = CONVERT(uniqueidentifier, '00000000-0000-0000-0000-000000000000')
    DECLARE @CleanupWorkItemType uniqueidentifier
    SET @CleanupWorkItemType = CONVERT(uniqueidentifier, 'BDEADF18-C265-11d0-BCED-00A0C90AB50F')
    BEGIN TRAN
    SELECT
        @cbDelta = SUM(CASE WHEN @ProcessingId IS NULL THEN ISNULL(-InstanceDataSize,0) ELSE ISNULL(-HistorySize,0) END)
    FROM
        dbo.Workflow with (UPDLOCK)
    WHERE    
        SiteId = @SiteId AND
        ListId = @ListId AND
        ItemId = @ListItemId
    IF (@@ROWCOUNT > 0)
    BEGIN        
        EXEC proc_AppendSiteQuota @SiteId, @cbDelta, 1
        UPDATE
            dbo.Workflow
        SET
            HistorySize = 0,
            LockMachineId = NULL,
            InstanceData = NULL,
            InstanceDataSize = 0,
            Modifications = NULL,
            InternalState = InternalState | 8,
            Modified = @Now
        WHERE    
            SiteId = @SiteId AND
            ListId = @ListId AND
            ItemId = @ListItemId
        EXEC @iRet = proc_AddWorkItem NULL ,
                              @Now ,
                              @CleanupWorkItemType ,
                              @NULL_GUID,
                              @SiteId ,
                              @ListId ,
                              @ListItemId ,
                              NULL ,
                              NULL ,
                              NULL ,
                              0 ,
                              NULL ,
                              NULL ,
                              NULL 
    END
CLEANUP:
    IF @iRet <> 0
    BEGIN
        IF @@TRANCOUNT = @oldTranCount + 1
        BEGIN
            ROLLBACK TRAN
        END
    END
    ELSE
    BEGIN
        COMMIT TRAN
    END

GO
