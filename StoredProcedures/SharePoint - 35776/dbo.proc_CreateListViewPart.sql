/****** Object:  StoredProcedure [dbo].[proc_CreateListViewPart]    Script Date: 5/15/2018 12:11:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CreateListViewPart(
    @SiteId uniqueidentifier,
    @bAllUser bit,
    @UserId int,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint OUTPUT,
    @WebPartID uniqueidentifier,
    @WebPartTypeID uniqueidentifier,
    @IsIncluded bit,
    @FrameState tinyint,
    @ZoneID nvarchar(64),
    @PartOrder int,
    @ListId uniqueidentifier,
    @BaseViewId tinyint,
    @Flags int,
    @ContentTypeId tContentTypeId,
    @AllUsersProperties image,
    @PerUserProperties image,
    @View ntext = NULL,
    @DisplayName nvarchar(255) = '')
AS
    SET NOCOUNT ON
    DECLARE @DocID uniqueidentifier
    DECLARE @cbDelta bigint
    DECLARE @Ret int
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
    DECLARE @IsCurrentVersion bit
    DECLARE @IsForceCheckout bit
    DECLARE @EnableMinorVersions bit
    DECLARE @IsModerate bit
    DECLARE @WebId uniqueidentifier
    DECLARE @ListIdLog uniqueidentifier
    DECLARE @ItemId int
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
        @WebId = WebId,
        @ListIdLog = ListId,
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
    IF (@IsForceCheckout = 1
        AND @Level <> 255
        AND @bAllUser = 1)
        RETURN 158
    IF @DocID IS NULL
    BEGIN
        RETURN 2
    END
    IF (@bAllUser = 0) AND (@Level = 255)
    BEGIN
        RETURN 12
    END
    IF (@bAllUser = 1) AND (@IsCurrentVersion = 0)
    BEGIN
        RETURN 33
    END
    BEGIN TRAN
    IF (@EnableMinorVersions = 1 OR @IsModerate = 1 ) AND
        @Level = 1 AND @bAllUser = 1 AND
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
                SET @Ret = 1
            GOTO cleanup
        END
        SET @Level = 2
    END
    SET @cbDelta = 116 + ISNULL(DATALENGTH(NULL), 0) + ISNULL(DATALENGTH(@AllUsersProperties), 0) + ISNULL(DATALENGTH(@PerUserProperties), 0) + ISNULL(DATALENGTH(NULL), 0) + ISNULL(DATALENGTH(NULL), 0)
    DECLARE @HasFGP bit
    DECLARE @ListsWebId uniqueidentifier
    SELECT
        @HasFGP = tp_HasFGP,
        @ListsWebId = tp_WebId
    FROM
        Lists
    WHERE
        tp_Id = @ListId
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
        @SiteId, @cbDelta, 0
    INSERT INTO WebPartLists(
        tp_SiteId,
        tp_ListId,
        tp_WebId,
        tp_PageUrlID,
        tp_WebPartID,
        tp_UserID,
        tp_Level)
    VALUES (
        @SiteId,
        @ListId,
        @ListsWebId,
        @DocID,
        @WebPartID,
        CASE WHEN @bAllUser = 1 THEN NULL ELSE @UserId END,
        @Level)
    IF @bAllUser = 1
    BEGIN
        INSERT INTO dbo.WebParts (
            tp_SiteId,
            tp_Id,
            tp_ListId,
            tp_Type,
            tp_Flags,
            tp_baseviewid,
            tp_DisplayName,
            tp_ContentTypeId,
            tp_Version,
            tp_PageUrlId,
            tp_ZoneId,
            tp_PartOrder,
            tp_IsIncluded,
            tp_FrameState,
            tp_View,
            tp_WebPartTypeId,
            tp_AllUsersProperties,
            tp_PerUserProperties,
            tp_Cache,
            tp_Size,
            tp_Level,
            tp_HasFGP)
        VALUES (
            @SiteId,
            @WebPartID,
            @ListId,
            1,
            @Flags,
            @BaseViewId,
            @DisplayName,
            CASE
                WHEN @ContentTypeId IS NULL
                    THEN 0x
                ELSE @ContentTypeId
            END,
            1,
            @DocID,
            @ZoneID,
            @PartOrder,
            @IsIncluded,
            @FrameState,
            @View,
            @WebPartTypeID,
            @AllUsersProperties,
            @PerUserProperties,
            NULL,
            @cbDelta,
            @Level,
            @HasFGP)
    END
    ELSE
    BEGIN
        INSERT INTO dbo.WebParts (
            tp_SiteId,
            tp_Id,
            tp_ListId,
            tp_Type,
            tp_Flags,
            tp_baseviewid,
            tp_DisplayName,
            tp_ContentTypeId,
            tp_Version,
            tp_PageUrlId,
            tp_ZoneId,
            tp_PartOrder,
            tp_IsIncluded,
            tp_FrameState,
            tp_View,
            tp_WebPartTypeId,
            tp_AllUsersProperties,
            tp_PerUserProperties,
            tp_Cache,
            tp_UserId,
            tp_Size,
            tp_Level,
            tp_HasFGP)
        VALUES (
            @SiteId,
            @WebPartID,
            @ListId,
            1,
            @Flags,
            @BaseViewId,
            @DisplayName,
            CASE
                WHEN @ContentTypeId IS NULL
                    THEN 0x
                ELSE @ContentTypeId
            END,
            1,
            @DocID,
            @ZoneID,
            @PartOrder,
            @IsIncluded,
            @FrameState,
            @View,
            @WebPartTypeID,
            @AllUsersProperties,
            @PerUserProperties,
            NULL,
            @UserId,
            @cbDelta,
            @Level,
            @HasFGP)
    END
    IF (@@ERROR <> 0 OR @Ret <> 0)
    BEGIN
        IF (@Ret = 0)
            SET @Ret = 1
        GOTO cleanup
    END
cleanup:
    IF (@Ret = 0)
    BEGIN
        IF (@ItemId IS NOT NULL)
        BEGIN
            EXEC proc_LogChange @SiteId, @WebId, @ListIdLog, @ItemId, @DocId,
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
