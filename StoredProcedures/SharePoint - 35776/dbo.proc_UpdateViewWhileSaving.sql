/****** Object:  StoredProcedure [dbo].[proc_UpdateViewWhileSaving]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateViewWhileSaving(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @ViewId uniqueidentifier,
    @View ntext,
    @DisplayName nvarchar(255),
    @ContentTypeId tContentTypeId,
    @Type tinyint,
    @Flags int,
    @BaseViewID tinyint,
    @PageUrlID uniqueidentifier,
    @Level tinyint)
AS
    SET NOCOUNT ON
    DECLARE @ViewSize int
    DECLARE @@NewSize int
    DECLARE @Ret int
    DECLARE @Result int
    DECLARE @OldContentTypeId tContentTypeId
    SET @Ret = 0
    SET @ViewSize = DATALENGTH(@View)
    IF (@Type = 1)
    BEGIN
        IF NOT EXISTS (
            SELECT
                *
            FROM
                WebParts
            WHERE
                tp_ListId = @ListId AND
                tp_UserID IS NULL AND
                tp_Type = 0 AND
                tp_ID <> @ViewId)
            BEGIN
                SET @Type = 0
            END
    END
    IF EXISTS (
        SELECT 
            *
        FROM
            WebParts
        WHERE
            tp_ListId = @ListId AND
            tp_ID = @ViewId AND
            tp_Level = @Level)
    BEGIN
        IF @View IS NOT NULL
        BEGIN
            EXEC @Ret = proc_OnUpdateWebParts
                @SiteId,
                @ViewId,
                @Level,
                @ViewSize,
                NULL,  
                NULL,  
                NULL,  
                NULL,  
                NULL,
                @@NewSize OUTPUT
            END
            IF (0 <> @Ret)
                GOTO cleanup
            IF (@ContentTypeId IS NULL)
            BEGIN
                SELECT TOP 1
                    @OldContentTypeId = tp_ContentTypeId
                FROM
                    WebParts
                WHERE
                    tp_ListId = @ListId AND
                    tp_ID = @ViewId AND
                    tp_Level = @Level
            END
            UPDATE
                WebParts
            SET
                tp_View =
                    CASE
                        WHEN @View IS NULL THEN
                            tp_View
                        WHEN @ViewSize = 0 THEN
                            NULL
                        ELSE
                            @View
                    END,
                tp_DisplayName = CASE WHEN @DisplayName IS NULL THEN
                    tp_DisplayName ELSE @DisplayName END,
                tp_Type = CASE WHEN @Type IS NULL THEN
                    tp_Type ELSE @Type END,
                tp_BaseViewID = CASE WHEN @BaseViewID IS NULL THEN
                    tp_BaseViewID ELSE @BaseViewID END,
                tp_ContentTypeId = ISNULL(@ContentTypeId, tp_ContentTypeId),
                tp_Size = CASE WHEN @View IS NULL THEN
                    tp_Size ELSE ISNULL(@@NewSize, 0) END,
                tp_Flags = CASE WHEN @Flags IS NULL THEN
                    tp_Flags ELSE @Flags END
            WHERE
                tp_ListId = @ListId AND
                tp_ID = @ViewId AND
                tp_Level = @Level
            IF (0 <> @@ERROR)
                GOTO cleanup
            IF (@PageUrlID IS NOT NULL)
            BEGIN
                UPDATE
                    WebPartLists
                SET
                    WebPartLists.tp_PageUrlID = @PageUrlID
                FROM
                    WebParts WITH (NOLOCK) INNER JOIN WebPartLists
                ON
                    WebParts.tp_SiteId = WebPartLists.tp_SiteId AND
                    WebParts.tp_PageUrlID = WebPartLists.tp_PageUrlID AND
                    WebParts.tp_Level = WebPartLists.tp_Level AND
                    WebParts.tp_UserId = WebPartLists.tp_UserId
                WHERE
                    WebParts.tp_ListId = @ListId AND
                    WebParts.tp_ID = @ViewId AND
                    WebParts.tp_Level = @Level
                UPDATE
                    WebParts
                SET
                    tp_PageUrlID = @PageUrlID
                WHERE
                    tp_ListId = @ListId AND
                    tp_ID = @ViewId AND
                    tp_Level = @Level
            END
    END
    ELSE
    BEGIN
        DECLARE @quotaOrLockStatus int
        SELECT  @quotaOrLockStatus = dbo.fn_IsOverQuotaOrWriteLocked(
            @SiteId)
        IF (@quotaOrLockStatus = 1)
        BEGIN
            RETURN 1816
        END
        ELSE IF (@quotaOrLockStatus > 1)
        BEGIN
            RETURN 212
        END
        DECLARE @cbDelta bigint
        SET @cbDelta = 116 + ISNULL(DATALENGTH(@View), 0) + ISNULL(DATALENGTH(NULL), 0) + ISNULL(DATALENGTH(NULL), 0) + ISNULL(DATALENGTH(NULL), 0) + ISNULL(DATALENGTH(NULL), 0)
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
            @SiteId, @cbDelta, 0
        IF (0 <> @@ERROR)
            GOTO cleanup
        SET @ContentTypeId = ISNULL(@ContentTypeId, 0x)
        DECLARE @ListWebId uniqueidentifier
        SELECT
            @ListWebId = tp_WebId
        FROM
            AllLists WITH (NOLOCK)
        WHERE
            tp_ID = @ListId
        INSERT INTO WebPartLists(
            tp_SiteId,
            tp_WebPartID,
            tp_ListId,
            tp_WebId,
            tp_PageUrlID,
            tp_Level)
        VALUES (
            @SiteId,
            @ViewId,
            @ListId,
            @ListWebId,
            @PageUrlID,
            @Level)
        INSERT INTO WebParts(
            tp_SiteId,
            tp_ID,
            tp_ListId,
            tp_Type,
            tp_Flags,
            tp_BaseViewID,
            tp_DisplayName,
            tp_ContentTypeId,
            tp_PageUrlID,
            tp_View,
            tp_Size,
            tp_Level)
        VALUES (
            @SiteId,
            @ViewId,
            @ListId,
            @Type,
            @Flags,
            @BaseViewID,
            @DisplayName,
            @ContentTypeId,
            @PageUrlID,
            CASE
                WHEN @ViewSize = 0 THEN
                    NULL
                ELSE
                    @View
            END,
            @cbDelta,
            @Level)
    END
    IF (@Type = 0)
    BEGIN
        EXEC @Result = proc_MakeViewDefaultForList @ListId, @ViewId
        IF @Result <> 0
        BEGIN
            GOTO cleanup
        END
    END
    IF ((@Flags & 16777216) <> 0)
    BEGIN
        EXEC @Result = proc_MakeViewMobileDefaultForList @ListId, @ViewId
        IF @Result <> 0
        BEGIN
            GOTO cleanup
        END
    END
    ELSE
    BEGIN
        EXEC @Result = proc_EnsureMobileDefaultViewForList @ListId
        IF @Result <> 0
        BEGIN
            GOTO cleanup
        END
    END
    IF ((@Flags & 268435456) <> 0)
    BEGIN
        SET @ContentTypeId = ISNULL(@ContentTypeId, @OldContentTypeId)
        EXEC @Ret = proc_MakeViewDefaultForContentType @ListId, @ViewId, @ContentTypeId
        IF (0 <> @Ret)
            GOTO cleanup
    END
cleanup:
    IF (0 <> @@ERROR OR 0 <> @Ret)
    BEGIN
        RETURN CASE WHEN (0 = @Ret) THEN 1 ELSE @Ret END
    END
    RETURN 0

GO
