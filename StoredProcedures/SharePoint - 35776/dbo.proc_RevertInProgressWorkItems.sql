/****** Object:  StoredProcedure [dbo].[proc_RevertInProgressWorkItems]    Script Date: 5/15/2018 12:12:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RevertInProgressWorkItems (
        @ProcessingId          uniqueidentifier,
        @ProcessMachineId      uniqueidentifier,
        @SiteId                uniqueidentifier,
        @ParentId              uniqueidentifier,
        @WorkItemType          uniqueidentifier,
        @BatchId               uniqueidentifier,
        @AnyRemaining          int OUTPUT
        )
AS
    SET NOCOUNT ON
    DECLARE @iRet int
    SET @iRet = 0
    DECLARE @oldTranCount int
    SET @oldTranCount = @@TRANCOUNT
    SET @AnyRemaining = 0
    BEGIN TRAN    
    DECLARE @Now datetime
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    DECLARE @AutoDeleteDate datetime
    SET @AutoDeleteDate = DateAdd(Day, -10, @Now)
    DECLARE @RetryBackoff TABLE(
        Id int IDENTITY PRIMARY KEY,
        Minutes int)
    INSERT INTO @RetryBackoff VALUES (10) INSERT INTO @RetryBackoff VALUES (20) INSERT INTO @RetryBackoff VALUES (40) INSERT INTO @RetryBackoff VALUES (80) INSERT INTO @RetryBackoff VALUES (160) INSERT INTO @RetryBackoff VALUES (320) INSERT INTO @RetryBackoff VALUES (640) INSERT INTO @RetryBackoff VALUES (1280)
    IF @SiteId IS NULL
    BEGIN
      EXEC proc_RemoveFailOver @ProcessingId, NULL
    END
    ELSE
    BEGIN    
      EXEC proc_UpdateFailOver @ProcessingId, NULL, 20
    END
    DELETE
        dbo.ScheduledWorkItems
    WHERE
        Type = @WorkItemType AND
        DeliveryDate < @AutoDeleteDate AND
        ProcessingId = @ProcessingId AND
        (InternalState & (4)) != 0 AND
        (@SiteId IS NULL OR
             SiteId = @SiteId) AND
        (@ParentId IS NULL OR
            ParentId = @ParentId) AND
        (@BatchId IS NULL OR
            BatchId = @BatchId)
    UPDATE
        dbo.ScheduledWorkItems
    SET
        DeliveryDate = CASE WHEN ((InternalState & 8) = 0 OR ProcessMachinePID = 0) THEN DeliveryDate
    			       ELSE (select DateAdd(Minute, (Select top 1 Minutes from @RetryBackoff where Id = ProcessMachinePID OR Id = (8)), @Now)) END,
        InternalState = InternalState & ~1 & ~16,
        ProcessingId = NULL,
        ProcessMachinePID = ProcessMachinePID + 1
    WHERE
        Type = @WorkItemType AND
        DeliveryDate < @Now AND
        ProcessingId = @ProcessingId AND
        (@SiteId IS NULL OR
             SiteId = @SiteId) AND
        (@ParentId IS NULL OR
            ParentId = @ParentId) AND
        (@BatchId IS NULL OR
            BatchId = @BatchId)
    IF @@ROWCOUNT <> 0
    BEGIN
        SET @AnyRemaining = 1
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
    RETURN @iRet

GO
