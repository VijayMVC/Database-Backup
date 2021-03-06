/****** Object:  StoredProcedure [dbo].[proc_UpdateWorkItem]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateWorkItem (
        @WorkItemId            uniqueidentifier,
        @SiteId                uniqueidentifier,
        @DeliveryDate          datetime,
        @BinaryPayload         image,
        @TextPayload           ntext,
        @ProcessingId          uniqueidentifier,
        @ForceUpdate           bit=0
        )
AS
    SET NOCOUNT ON
    DECLARE @iRet int
    SET @iRet = 0
    DECLARE @oldTranCount int
    SET @oldTranCount = @@TRANCOUNT
    DECLARE @DeliveryDateChanged int
    BEGIN TRAN
    UPDATE
        dbo.ScheduledWorkItems
    SET
        @DeliveryDateChanged = CASE WHEN (@DeliveryDate <> DeliveryDate) THEN (1) ELSE (0) END,
        DeliveryDate = CASE WHEN (@DeliveryDate IS NULL) THEN DeliveryDate ELSE @DeliveryDate END,
        BinaryPayload = CASE WHEN (@BinaryPayload IS NULL) THEN BinaryPayload ELSE @BinaryPayload END,
        TextPayload = CASE WHEN (@TextPayload IS NULL) THEN TextPayload ELSE @TextPayload END,
        ProcessingId = CASE WHEN (@DeliveryDateChanged = 1) THEN (NULL) ELSE (ProcessingId) END,
        InternalState = CASE WHEN (@DeliveryDateChanged = 1) THEN (InternalState & ~1 & ~16) ELSE InternalState END
    WHERE    
        SiteId = @SiteId AND
        Id = @WorkItemId AND
        ((@ForceUpdate = 1) OR ((InternalState & ((1 | 2))) = 0) OR (ProcessingId = @ProcessingId))
    IF (@@ROWCOUNT = 0 OR @@ERROR <> 0)
    BEGIN
        SET @iRet = 5
        GOTO CLEANUP
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
