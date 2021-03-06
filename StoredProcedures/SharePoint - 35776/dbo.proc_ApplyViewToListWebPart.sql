/****** Object:  StoredProcedure [dbo].[proc_ApplyViewToListWebPart]    Script Date: 5/15/2018 12:11:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ApplyViewToListWebPart(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint OUTPUT,
    @WebPartID uniqueidentifier,
    @ViewId uniqueidentifier,
    @UserId int,
    @ViewEditPerms int,
    @ViewBody ntext,
    @ViewFlags int OUTPUT 
)
AS
    SET NOCOUNT ON
    DECLARE @ViewSize bigint
    DECLARE @Ret int
    DECLARE @@NewSize bigint
    DECLARE @DocId uniqueidentifier
    DECLARE @PartDocId uniqueidentifier
    DECLARE @PartUserId int
    DECLARE @IsPersonalView bit
    DECLARE @IsSmartPageView bit
    DECLARE @CanEditPersonalListView bit
    DECLARE @CanEditPersonalSmartPageView bit
    DECLARE @CanEditSharedListView bit
    DECLARE @CanEditSharedSmartPageView bit
    DECLARE @IsCurrentVersion bit
    DECLARE @IsForceCheckout bit
    DECLARE @EnableMinorVersions bit
    DECLARE @IsModerate bit
    DECLARE @ItemId int
    SET @CanEditPersonalListView = @ViewEditPerms &
        16
    SET @CanEditPersonalSmartPageView = @ViewEditPerms &
        32
    SET @CanEditSharedListView = @ViewEditPerms &
        64
    SET @CanEditSharedSmartPageView = @ViewEditPerms &
        128
    SET @Ret = 0
    SELECT
        @IsForceCheckout = CASE WHEN Lists.tp_Flags & 0x40000 <>0
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
        @DocID = Id,
        @IsCurrentVersion = IsCurrentVersion,
        @ItemId = DoclibRowId
    FROM
        Docs
    LEFT OUTER JOIN Lists WITH (NOLOCK)
    ON
        Lists.tp_ID = Docs.ListId AND
        Lists.tp_WebId = Docs.WebId AND
        Docs.DoclibRowId IS NOT NULL
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
        @PartDocId = WebParts.tp_PageUrlID,
        @PartUserId = WebParts.tp_UserID,
        @IsPersonalView =
            CASE
            WHEN
                WebParts.tp_UserId IS NOT NULL AND
                WebParts.tp_UserId = @UserId
            THEN
                1
            ELSE
                0
            END,
        @IsSmartPageView =
            CASE
            WHEN
                WebParts.tp_Flags & 8 <> 0
            THEN
                1
            ELSE
                0
            END
    FROM
        WebParts INNER JOIN Docs
    ON
        WebParts.tp_SiteId = Docs.SiteId AND
        WebParts.tp_PageUrlID = Docs.Id
    WHERE
        tp_SiteID = @SiteId AND
        tp_ID = @WebPartID AND
        tp_Level = @Level
    IF (@DocId <> @PartDocId OR
        (@PartUserId IS NOT NULL AND @PartUserId <> @UserId))
    BEGIN
        RETURN 5
    END
    IF @IsPersonalView = 1
    BEGIN
        IF @Level = 255
        BEGIN
            RETURN 12
        END
        IF @IsSmartPageView = 1
        BEGIN
            IF @CanEditPersonalSmartPageView <> 1
            BEGIN
                RETURN 5
            END
        END
        ELSE
        BEGIN
            IF @CanEditPersonalListView <> 1
            BEGIN
                RETURN 5
            END
        END
    END
    ELSE
    BEGIN
        IF @IsCurrentVersion = 0
        BEGIN
            RETURN 33
        END
        IF (@IsForceCheckout = 1 AND @Level <> 255)
            RETURN 158
        IF @IsSmartPageView = 1
        BEGIN
            IF @CanEditSharedSmartPageView <> 1
            BEGIN
                RETURN 5
            END
        END
        ELSE
        BEGIN
            IF @CanEditSharedListView <> 1
            BEGIN
                RETURN 5
            END
        END
    END
    BEGIN TRAN
    IF (@EnableMinorVersions = 1 OR @IsModerate = 1 ) AND
        @Level = 1 AND @IsPersonalView = 0 AND
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
    SET @ViewSize = ISNULL(DATALENGTH(@ViewBody), 0)
    EXEC @Ret = proc_OnUpdateWebParts
        @SiteId,
        @WebPartID,
        @Level,
        @ViewSize,
        NULL,    
        NULL,    
        0,       
        NULL,    
        NULL,
        @@NewSize OUTPUT
    IF (@@ERROR <> 0 OR 0 <> @Ret)
    BEGIN
        SET @Ret = 1
        GOTO cleanup
    END
    IF (@ViewID IS NULL)
    BEGIN
        UPDATE
            dbo.WebParts
        SET
            tp_Type = 1,
            tp_BaseviewID = 0,
            tp_DisplayName = '',
            tp_Version = 1,
            tp_View = CASE WHEN @ViewSize = 0 THEN NULL ELSE @ViewBody END,
            tp_Flags = CASE
                WHEN
                    tp_UserId IS NULL
                THEN
                    (8 | @ViewFlags) &
                    (~262144)
                ELSE
                    (8 | 262144) |
                    @ViewFlags
                    END,
            tp_Cache = NULL,
            tp_Size = @@NewSize
        WHERE
            tp_SiteID = @SiteId AND
            tp_ID = @WebPartID AND
            tp_Level = @Level
    END
    ELSE
    BEGIN
        UPDATE
            dbo.WebParts
        SET
            tp_BaseViewID = ViewData.tp_BaseViewID,
            tp_View = CASE WHEN @ViewSize = 0 THEN NULL ELSE @ViewBody END,
            tp_ContentTypeId = ViewData.tp_ContentTypeId,
            tp_Flags = CASE
                WHEN
                    dbo.WebParts.tp_UserId IS NULL
                THEN
                    (ViewData.tp_Flags | 8) &
                       ( ~262144)
                ELSE
                    (8 | 262144 |
                        ViewData.tp_Flags)
                END,
            tp_Cache = NULL,
            tp_Size = @@NewSize
        FROM (SELECT
            tp_BaseViewID,
            tp_View,
            tp_ContentTypeId,
            tp_Flags
            FROM
                dbo.WebParts
            WHERE
                tp_SiteID = @SiteId AND
                tp_ID = @ViewID) AS ViewData
        WHERE
            tp_SiteID = @SiteId AND
            tp_ID = @WebPartID  AND
            tp_Level = @Level
    END
    IF (0 <> @@ERROR)
    BEGIN
        SET @Ret = 2
        GOTO cleanup
    END
    SELECT
        @ViewFlags = tp_Flags
    FROM
        WebParts
    WHERE
        tp_SiteID = @SiteId AND
        tp_ID = @WebPartID
    IF @@ROWCOUNT = 0
    BEGIN
        SET @Ret = 2
    END
cleanup:
    IF (@Ret <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @Ret

GO
