/****** Object:  StoredProcedure [dbo].[proc_UpdateListViewFormWebPartSource]    Script Date: 5/15/2018 12:12:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateListViewFormWebPartSource(
    @SiteId uniqueidentifier,
    @WebPartId uniqueidentifier,
    @Source ntext)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    DECLARE @cbOriginalSize int
    DECLARE @cbDelta int
    DECLARE @quotaOrLockStatus int
    SELECT  @quotaOrLockStatus = dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
    IF (@quotaOrLockStatus = 1)
    BEGIN
        RETURN 1816
    END
    ELSE IF (@quotaOrLockStatus > 1)
    BEGIN
        RETURN 212
    END
    SELECT
        @cbOriginalSize = tp_Size
    FROM
        WebParts
    WHERE
        tp_SiteId = @SiteId AND
        tp_ID = @WebPartID
    IF @@ROWCOUNT <> 1
    BEGIN
        RETURN 13
    END
    SET @Ret = 0
    SET @cbDelta = ISNULL(DATALENGTH(@Source),0)
    BEGIN TRAN
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbDelta, 0
    UPDATE
        WebParts
    SET
        tp_Source = @Source,
        tp_Size = @cbDelta + @cbOriginalSize
    WHERE
        tp_SiteId = @SiteId AND
        tp_ID = @WebPartID AND
        tp_Source IS NULL
   IF (@@ERROR <> 0 OR @Ret <> 0)
    BEGIN
        IF (@Ret = 0)
            SET @Ret = 1
    END
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
