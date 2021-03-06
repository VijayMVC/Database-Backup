/****** Object:  StoredProcedure [dbo].[proc_OnUpdatePersonalization]    Script Date: 5/15/2018 12:12:12 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_OnUpdatePersonalization(
    @SiteId uniqueidentifier,
    @DocId uniqueidentifier,
    @UserId int,
    @WebPartId uniqueidentifier,
    @NewSizePerUserProperties int,
    @NewSizeCache int,
    @@NewSize bigint OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @cbDelta bigint
    DECLARE @currentSize bigint
    DECLARE @existingSizeOfChangingColumns bigint
    DECLARE @NewSizeOfChangingColumns bigint
    DECLARE @Ret int
    SET @Ret = 0
    IF (COALESCE(
        @NewSizePerUserProperties,
        @NewSizeCache) IS NOT NULL)
    BEGIN
        SET @NewSizeOfChangingColumns =
            ISNULL(@NewSizePerUserProperties, 0)
            + ISNULL(@NewSizeCache, 0)
        SELECT
            @currentSize = tp_Size,
            @existingSizeOfChangingColumns =
                CASE WHEN (@NewSizePerUserProperties IS NULL)
                    THEN 0 ELSE ISNULL(DATALENGTH(tp_PerUserProperties), 0) END
                + CASE WHEN (@NewSizeCache IS NULL)
                    THEN 0 ELSE ISNULL(DATALENGTH(tp_Cache), 0) END
        FROM
            Personalization
        WHERE
            tp_SiteID = @SiteId AND
            tp_PageUrlID = @DocId AND
            tp_UserID = @UserId AND
            tp_WebPartID = @WebPartId
        SET @cbDelta = @NewSizeOfChangingColumns - @existingSizeOfChangingColumns
        IF (@cbDelta > 0)
        BEGIN
            DECLARE @quotaOrLockStatus int
            SELECT  @quotaOrLockStatus = dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
            IF (@quotaOrLockStatus = 1)
            BEGIN
                SET @Ret = 1816
                GOTO cleanup
            END
            ELSE IF (@quotaOrLockStatus > 1)
            BEGIN
                SET @Ret = 212
                GOTO cleanup
            END
        END
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbDelta, 0
        SET @@NewSize = @currentSize + @cbDelta
    END
cleanup:
    IF (0 <> @@ERROR OR 0 <> @Ret)
    BEGIN
        RETURN CASE WHEN (0 = @Ret) THEN -2147467259 ELSE @Ret END
    END
    RETURN 0

GO
