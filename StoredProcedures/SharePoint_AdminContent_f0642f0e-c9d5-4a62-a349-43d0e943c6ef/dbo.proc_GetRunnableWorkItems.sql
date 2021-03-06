/****** Object:  StoredProcedure [dbo].[proc_GetRunnableWorkItems]    Script Date: 5/15/2018 12:12:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetRunnableWorkItems (
        @ProcessingId          uniqueidentifier,
        @SiteId                uniqueidentifier,
        @WorkItemType          uniqueidentifier,
        @BatchId               uniqueidentifier,
        @MaxFetchSize          int = 1000,
        @ThrottleThreshold     int = 0
        )
AS
    SET NOCOUNT ON
    IF (dbo.fn_IsOverQuotaOrWriteLocked(@SiteId) >= 1)
    BEGIN
        RETURN 0
    END
    DECLARE @iRet int
    SET @iRet = 0
    DECLARE @oldTranCount int
    SET @oldTranCount = @@TRANCOUNT
    DECLARE @Now datetime
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    DECLARE @InProgressCount int
    DECLARE @ThrottledFetch int
    DECLARE @ReturnWorkItems bit
    SET @ReturnWorkItems = 0
    BEGIN TRAN
    SET @InProgressCount = 0
    SET @ThrottledFetch = 0
    SET @ThrottleThreshold = @ThrottleThreshold + 1
    IF @ThrottleThreshold > 1
    BEGIN
        SET ROWCOUNT @ThrottleThreshold
        SELECT 
            @InProgressCount = COUNT(DISTINCT BatchId)
        FROM
            dbo.ScheduledWorkItems WITH (NOLOCK)
        WHERE
            Type = @WorkItemType AND
            DeliveryDate <= @Now AND
            (InternalState & (1 | 16)) = (1 | 16)
    END
    IF @BatchId IS NOT NULL
    BEGIN
        SET @ThrottledFetch = 16
    END
    IF @InProgressCount < @ThrottleThreshold
    BEGIN
        SET ROWCOUNT @MaxFetchSize
        UPDATE
            dbo.ScheduledWorkItems
        SET
            InternalState = InternalState | 1 | @ThrottledFetch,
            ProcessingId = @ProcessingId
        WHERE
            Type = @WorkItemType AND
            DeliveryDate <= @Now AND
            (@SiteId IS NULL OR 
                SiteId = @SiteId) AND
            (@BatchId IS NULL OR
                BatchId = @BatchId) AND
            (InternalState & ((1 | 2))) = 0
        SET @InProgressCount = @@ROWCOUNT
        SET ROWCOUNT 0            
        IF @InProgressCount <> 0
        BEGIN
          EXEC @iRet = proc_AddFailOver @ProcessingId, NULL, NULL, 20, 0
        END
        SET @ReturnWorkItems = 1
    END
CLEANUP:
        SET ROWCOUNT 0
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
            IF @InProgressCount <> 0
               AND @InProgressCount <> @MaxFetchSize 
               AND @WorkItemType = 'BDEADF09-C265-11d0-BCED-00A0C90AB50F'
               AND @BatchId IS NOT NULL AND @SiteId IS NOT NULL
            BEGIN
                UPDATE
                    dbo.Workflow
                SET
                    InternalState = InternalState & ~(1024)
                WHERE
                    SiteId = @SiteId AND
                    Id = @BatchId    
            END            
            IF @ReturnWorkItems = 1
            BEGIN
                SELECT ALL
                    DeliveryDate, Type, ProcessMachineId as SubType, Id, SiteId, ParentId, ItemId, BatchId, ItemGuid, WebId, UserId, Created, BinaryPayload, TextPayload,
                    InternalState
                FROM
                    dbo.ScheduledWorkItems
                WHERE
                    Type = @WorkItemType AND
                    DeliveryDate <= @Now AND
                    ProcessingId = @ProcessingId
                ORDER BY
                    Created
                IF @@ROWCOUNT <> 0
                BEGIN
                    EXEC @iRet = proc_UpdateFailOver @ProcessingId, NULL, 20
                END
            END
        END
        RETURN @iRet

GO
