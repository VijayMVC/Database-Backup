/****** Object:  StoredProcedure [dbo].[proc_UpdateWebPartCache]    Script Date: 5/15/2018 12:13:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateWebPartCache(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint OUTPUT,
    @bAllUser bit,
    @SystemID tSystemID,
    @WebPartID uniqueidentifier,
    @Cache image)
AS
    SET NOCOUNT ON
    DECLARE @cbDelta bigint
    DECLARE @DocId uniqueidentifier
    DECLARE @PartDocId uniqueidentifier
    DECLARE @UserID int
    DECLARE @CurrentUserId int
    DECLARE @Ret int
    DECLARE @CacheSize int
    DECLARE @@NewSize bigint
    DECLARE @IsCurrentVersion bit
    DECLARE @IsForceCheckout bit
    DECLARE @EnableMinorVersions bit
    DECLARE @IsModerate bit
    SET @CurrentUserId = dbo.fn_UserIDFromSid(@SiteId, @SystemID)
    SET @Ret = 0
    SELECT
        @DocId = Id
    FROM
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND
        Docs.Level = @Level
    IF @DocId IS NULL
    BEGIN
        RETURN 2
    END
    SELECT
        @PartDocId=tp_PageUrlID,
        @UserID = tp_UserID
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
    IF (@bAllUser = 1 OR @UserID IS NOT NULL)
    BEGIN
        SET @CacheSize = ISNULL(DATALENGTH(@Cache), 0)
        EXEC @Ret = proc_OnUpdateWebParts
            @SiteId,
            @WebPartID,
            @Level,
            NULL,    
            NULL,    
            NULL,    
            @CacheSize,
            NULL,    
            NULL,
            @@NewSize OUTPUT
        IF (@@ERROR <> 0 OR @Ret <> 0)
        BEGIN
            IF (@Ret = 0)
                SET @Ret = -2147467259
            GOTO cleanup
        END
        UPDATE
            dbo.WebParts
        SET
            tp_Cache = @Cache,
            tp_Size = @@NewSize
        WHERE
            tp_SiteID = @SiteId AND
            tp_ID = @WebPartID AND
            tp_Level = @Level
        IF (@@ERROR <> 0)
        BEGIN
            SET @Ret = -2147467259
            GOTO cleanup
        END
    END
    ELSE
    BEGIN
        SET @UserID = dbo.fn_UserIDFromSid(@SiteId, @SystemID)
        IF ((@Level = 1) AND
            EXISTS (
            SELECT
                *
            FROM
                dbo.Personalization
            WHERE
                tp_SiteID = @SiteId AND
                tp_PageUrlID = @DocId AND
                tp_UserID = @UserID AND
                tp_WebPartID = @WebPartID))
        BEGIN
            SET @CacheSize = ISNULL(DATALENGTH(@Cache), 0)
            EXEC @Ret = proc_OnUpdatePersonalization
                @SiteId,
                @DocId,
                @UserID,
                @WebPartID,
                NULL,    
                @CacheSize,
                @@NewSize OUTPUT
            IF (@@ERROR <> 0 OR @Ret <> 0)
            BEGIN
                IF (@Ret = 0)
                    SET @Ret = -2147467259
                GOTO cleanup
            END
            UPDATE
                dbo.Personalization
            SET
                tp_Cache = @Cache,
                tp_Size = @@NewSize
            WHERE
                tp_SiteID = @SiteId AND
                tp_PageUrlID = @DocId AND
                tp_UserID = @UserID AND
                tp_WebPartID = @WebPartID
            IF (@@ERROR <> 0)
            BEGIN
                SET @Ret = -2147467259
                GOTO cleanup
            END
        END
    END
    IF NOT EXISTS(
        SELECT
            *
            FROM
                WebParts
        WHERE
            tp_SiteID = @SiteId AND
            tp_ID = @WebPartID AND
            tp_Level = @Level)
    BEGIN
        SET @Ret = 2  
        GOTO cleanup
    END
cleanup:
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
