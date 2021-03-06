/****** Object:  StoredProcedure [dbo].[proc_UpdateWebPartIsIncluded]    Script Date: 5/15/2018 12:13:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateWebPartIsIncluded(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint OUTPUT,
    @bAlluser bit,
    @UserID int,
    @WebPartID uniqueidentifier,
    @bCheckLock bit,
    @IsIncluded bit,
    @ZoneID nvarchar(64),
    @PartOrder int,
    @FrameState tinyint)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    DECLARE @DocId uniqueidentifier
    DECLARE @PartDocId uniqueidentifier
    DECLARE @IsCurrentVersion bit
    DECLARE @IsForceCheckout bit
    DECLARE @EnableMinorVersions bit
    DECLARE @IsModerate bit
    DECLARE @WebId uniqueidentifier
    DECLARE @ListId uniqueidentifier
    DECLARE @ItemId int
    SET @Ret = 0
    SELECT
       @IsForceCheckout =
            CASE WHEN Lists.tp_Flags & 0x40000 <>0
                 AND @bCheckLock = 1
            THEN 1
            ELSE 0
            END,
        @EnableMinorVersions = CASE WHEN Lists.tp_Flags & 0x80000 <>0
            THEN 1
            ELSE 0
            END,
        @IsModerate = CASE WHEN Lists.tp_Flags & 0x400 <>0
            THEN 1
            ELSE 0
            END,
        @DocId = Id,
        @IsCurrentVersion = IsCurrentVersion,
        @WebId = WebId,
        @ListId = ListId,
        @ItemId = DoclibRowId
    FROM
        Docs
    LEFT OUTER JOIN Lists WITH (NOLOCK)
    ON
        Lists.tp_ID = Docs.ListId AND
        Lists.tp_WebId = Docs.WebId
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND
        Docs.Level = @Level
    IF (@IsForceCheckout = 1
        AND @Level <> 255
        AND @bAllUser = 1)
        RETURN 158
    IF @DocId IS NULL
    BEGIN
        RETURN 2
    END
    IF @bCheckLock = 1
    BEGIN
        IF (@bAllUser = 0) AND (@Level = 255)
        BEGIN
            RETURN 12
        END
        IF (@bAllUser = 1) AND (@IsCurrentVersion = 0)
        BEGIN
            RETURN 33
        END
    END
    SELECT
        @PartDocId=tp_PageUrlID
    FROM
        WebParts
    WHERE
        tp_SiteID = @SiteId AND
        tp_ID = @WebPartID AND
        tp_Level = @Level
    IF (@DocId <> @PartDocId)
    BEGIN
        RETURN 5
    END
    BEGIN TRAN
    IF (@EnableMinorVersions = 1 OR @IsModerate = 1 ) AND
        @Level = 1 AND @bAllUser = 1 AND
        @bCheckLock = 1 AND
        @ItemId IS NOT NULL
    BEGIN
        EXEC @Ret = proc_CloneDoc  @SiteId,
                      @DirName,
                      @LeafName,
                      NULL,
                      NULL,
                      NULL,
                      @Level,
                      2,
                      @EnableMinorVersions,
                      @IsModerate,
                      @UserId,
                      NULL
        IF (@@ERROR <> 0 OR @Ret <> 0)
        BEGIN
            IF (@Ret = 0)
                SET @Ret = -2147467259
            GOTO cleanup
        END
        SET @Level = 2
    END
    IF (@bAllUser = 1 OR
        EXISTS (
            SELECT * FROM WebParts
            WHERE tp_SiteID = @SiteId AND tp_ID = @WebPartID AND
            tp_UserID = @UserID))
    BEGIN
        UPDATE
            WebParts
        SET
            tp_IsIncluded = @IsIncluded,
            tp_ZoneID = @ZoneID,
            tp_PartOrder = @PartOrder,
            tp_FrameState = @FrameState
        WHERE
            tp_SiteID = @SiteId AND
            tp_ID = @WebPartID AND
            (tp_Level = @Level OR
            @bAllUser = 0)
    END
    ELSE
    BEGIN
        IF EXISTS (
            SELECT
                *
            FROM
                Personalization
            WHERE
                tp_SiteID = @SiteId AND
                tp_PageUrlID = @DocId AND
                tp_UserID = @UserID AND
                tp_WebPartID = @WebPartID)
        BEGIN
            UPDATE
                Personalization
            SET
                tp_IsIncluded = @IsIncluded,
                tp_ZoneID = @ZoneID,
                tp_PartOrder = @PartOrder,
                tp_FrameState = @FrameState
            WHERE
                tp_SiteID = @SiteId AND
                tp_PageUrlID = @DocId AND
                tp_UserID = @UserID AND
                tp_WebPartID = @WebPartID
        END
        ELSE
        BEGIN
            DECLARE @quotaOrLockStatus int
            SELECT  @quotaOrLockStatus =
                dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
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
            DECLARE @cbDelta bigint
            SELECT
                @cbDelta = 66 + ISNULL(DATALENGTH(tp_PerUserProperties), 0) + ISNULL(DATALENGTH(NULL), 0)
            FROM
                WebParts
            WHERE
                tp_SiteID = @SiteId AND
                tp_ID = @WebPartID
            EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
                @SiteId, @cbDelta, 0
            INSERT INTO Personalization(
                tp_SiteId,
                tp_WebPartID,
                tp_PageUrlID,
                tp_UserID,
                tp_PerUserProperties,
                tp_ZoneID,
                tp_PartOrder,
                tp_IsIncluded,
                tp_FrameState,
                tp_Size)
                SELECT
                    @SiteId,
                    @WebPartID,
                    @DocId,
                    @UserID,
                    tp_PerUserProperties,
                    @ZoneID,
                    @PartOrder,
                    @IsIncluded,
                    @FrameState,
                    @cbDelta
                FROM
                    WebParts
                WHERE
                    tp_SiteID = @SiteId AND
                    tp_ID = @WebPartID AND
                    tp_Level = @Level
        END
    END
    IF (@@ERROR <> 0 OR @Ret <> 0)
    BEGIN
        IF (@Ret = 0)
            SET @Ret = -2147467259
        GOTO cleanup
    END
    IF NOT EXISTS(
        SELECT
            *
            FROM
                WebParts
        WHERE
            tp_SiteID = @SiteId AND
            tp_ID = @WebPartID)
    BEGIN
        SET @Ret = 2  
    END
    IF (@@ERROR <> 0 OR @Ret <> 0)
    BEGIN
        IF (@Ret = 0)
            SET @Ret = -2147467259
        GOTO cleanup
    END
cleanup:
    IF (0 = @Ret)
    BEGIN
        IF (@ItemId IS NOT NULL)
        BEGIN
            EXEC proc_LogChange @SiteId, @WebId, @ListId, @ItemId, @DocId,
                NULL, NULL, NULL, 8192, 1, NULL
        END
        ELSE
        BEGIN
            EXEC proc_LogChange @SiteId, @WebId, NULL, NULL, @DocId,
                NULL, NULL, NULL, 8192, 16, NULL
        END
    END
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
