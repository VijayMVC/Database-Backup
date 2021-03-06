/****** Object:  StoredProcedure [dbo].[proc_ApproveCheckinForWebPart]    Script Date: 5/15/2018 12:12:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ApproveCheckinForWebPart
(
    @SiteID          uniqueidentifier,
    @DocID           uniqueidentifier,
    @Level           tinyint,
    @CheckinLevel    tinyint,
    @bDiscardCheckin bit
)
AS
   SET NOCOUNT ON
   DECLARE @Ret int
   SET @Ret = 0
   IF (@bDiscardCheckin = 1)
   BEGIN
       DELETE
           WebPartLists
       WHERE
           WebPartLists.tp_SiteId = @SiteID AND
           WebPartLists.tp_PageUrlID = @DocID AND
           WebPartLists.tp_Level = 255
       DELETE
           WebParts
       WHERE
           WebParts.tp_SiteId = @SiteID AND
           WebParts.tp_PageUrlID = @DocID AND
           WebParts.tp_Level = 255
   END
   ELSE
   BEGIN
        EXEC proc_DeleteWebPartForDoc @SiteId,
             @DocId, @CheckinLevel, @Level
        UPDATE
            WebPartLists
        SET
            tp_Level = @CheckinLevel
        WHERE
            WebPartLists.tp_SiteId = @SiteID AND
            WebPartLists.tp_PageUrlID = @DocID AND
            WebPartLists.tp_Level = @Level
        UPDATE
            WebParts
        SET
            tp_Level = @CheckinLevel
        WHERE
            WebParts.tp_SiteId = @SiteID AND
            WebParts.tp_PageUrlID = @DocID AND
            WebParts.tp_Level = @Level
        IF (@CheckinLevel = 1)
        BEGIN
            DECLARE @cbDelta bigint
            SELECT
               @cbDelta = -((SUM(CAST((DATALENGTH(Personalization.tp_Cache)) AS BIGINT))))
            FROM
                Personalization
            WHERE
                Personalization.tp_SiteId = @SiteID AND
                Personalization.tp_PageUrlID = @DocID AND
                Personalization.tp_Cache IS NOT NULL
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
                    Personalization.tp_Cache = null,
                    Personalization.tp_Size = Personalization.tp_Size - DATALENGTH(Personalization.tp_Cache)
                WHERE
                    Personalization.tp_SiteID=@SiteId AND
                    Personalization.tp_PageUrlID = @DocID AND
                    Personalization.tp_Cache IS NOT NULL
                IF (@@ERROR <> 0)
                BEGIN
                    SET @Ret = -2147467259
                    GOTO cleanup
                END
            END
        END
   END
cleanup:
    RETURN @Ret

GO
