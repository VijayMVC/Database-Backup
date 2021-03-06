/****** Object:  StoredProcedure [dbo].[proc_InvalidatePerUserWebPartCache]    Script Date: 5/15/2018 12:12:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_InvalidatePerUserWebPartCache(
    @SiteId uniqueidentifier,
    @WebPartID uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    DECLARE @cbDelta bigint
    SET @Ret = 0
    BEGIN TRAN
    SELECT
       @cbDelta = -((SUM(CAST((DATALENGTH(tp_Cache)) AS BIGINT))))
    FROM
        Personalization
    WHERE
        tp_SiteID=@SiteId AND
        tp_WebPartID=@WebPartID AND
        tp_Cache IS NOT NULL
    IF (@@ERROR <> 0)
    BEGIN
        SET @Ret = -2147467259
        GOTO cleanup
    END
    IF (ISNULL(@cbDelta,0) != 0)
    BEGIN
        EXEC @Ret = proc_QMChangeSiteDiskUsedAndContentTimestamp
            @SiteId, @cbDelta, 0
        IF (@@ERROR <> 0 OR @Ret <> 0)
        BEGIN
            IF (@Ret = 0)
                SET @Ret = -2147467259
            GOTO cleanup
        END
        UPDATE
            Personalization
        SET
            tp_Cache = null,
            tp_Size = tp_Size - DATALENGTH(tp_Cache)
        WHERE
            tp_SiteID=@SiteId AND
            tp_WebPartID=@WebPartID AND
            tp_Cache IS NOT NULL
        IF (@@ERROR <> 0)
        BEGIN
            SET @Ret = -2147467259
            GOTO cleanup
        END
    END
cleanup:
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
