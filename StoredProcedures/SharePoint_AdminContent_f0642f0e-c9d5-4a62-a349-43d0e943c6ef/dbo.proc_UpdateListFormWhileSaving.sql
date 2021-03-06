/****** Object:  StoredProcedure [dbo].[proc_UpdateListFormWhileSaving]    Script Date: 5/15/2018 12:13:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateListFormWhileSaving(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @ViewId uniqueidentifier,
    @Flags int,
    @Type tinyint,
    @PageUrlID uniqueidentifier,
    @Level tinyint)
AS
    SET NOCOUNT ON
    DECLARE @ListWebId uniqueidentifier
    IF @ListId IS NOT NULL
    BEGIN
        SELECT
            @ListWebId = tp_WebId
        FROM
            AllLists WITH (NOLOCK)
        WHERE
            tp_ID = @ListId
    END
    IF EXISTS (
        SELECT 
            *
        FROM
            WebParts
        WHERE
            tp_ID = @ViewId AND
            tp_Level = @Level)
    BEGIN
        IF @ListId IS NOT NULL
        BEGIN
            INSERT INTO WebPartLists(
                tp_SiteId,
                tp_WebPartID,
                tp_ListId,
                tp_WebId,
                tp_PageUrlID,
                tp_Level)
            SELECT
                WebParts.tp_SiteId,
                WebParts.tp_ID,
                @ListId,
                @ListWebId,
                WebParts.tp_PageUrlId,
                WebParts.tp_Level
            FROM
                WebParts WITH (NOLOCK) LEFT OUTER JOIN WebPartLists
            ON
                WebParts.tp_SiteId = WebPartLists.tp_SiteId AND
                WebParts.tp_PageUrlID = WebPartLists.tp_PageUrlID AND
                WebParts.tp_Level = WebPartLists.tp_Level AND
                WebParts.tp_UserId = WebPartLists.tp_UserId AND
                WebParts.tp_ID = WebPartLists.tp_WebPartID AND
                WebParts.tp_ListId = WebPartLists.tp_ListId
            WHERE
                WebParts.tp_ID = @ViewId AND
                WebParts.tp_Level = @Level AND
                WebPartLists.tp_ListId IS NULL
        END
        UPDATE
            WebPartLists
        SET
            WebPartLists.tp_PageUrlID = CASE WHEN @PageUrlID IS NULL THEN
                WebPartLists.tp_PageUrlID ELSE @PageUrlID END,
            WebPartLists.tp_ListId = CASE WHEN @ListId IS NULL THEN
                WebPartLists.tp_ListId ELSE @ListId END
        FROM
            WebParts WITH (NOLOCK) INNER JOIN WebPartLists
        ON
            WebParts.tp_SiteId = WebPartLists.tp_SiteId AND
            WebParts.tp_PageUrlID = WebPartLists.tp_PageUrlID AND
            WebParts.tp_Level = WebPartLists.tp_Level AND
            WebParts.tp_UserId = WebPartLists.tp_UserId AND
            WebParts.tp_ID = WebPartLists.tp_WebPartID AND
            WebParts.tp_ListId = WebPartLists.tp_ListId
        WHERE
            WebParts.tp_ID = @ViewId AND
            WebParts.tp_Level = @Level
        IF (0 <> @@ERROR)
            GOTO cleanup
        UPDATE
            WebParts
        SET
            tp_Type = CASE WHEN @Type IS NULL THEN
                tp_Type ELSE @Type END,
            tp_ListId = CASE WHEN @ListId IS NULL THEN
                tp_ListId ELSE @ListId END
        WHERE
            tp_ID = @ViewId AND
            tp_Level = @Level
        IF (0 <> @@ERROR)
            GOTO cleanup
        IF (@PageUrlID IS NOT NULL)
        BEGIN
            UPDATE
                WebParts
            SET
                tp_PageUrlID = @PageUrlID
            WHERE
                tp_ID = @ViewId AND
                tp_Level = @Level
        END
    END
    ELSE
    BEGIN
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
            tp_PageUrlID,
            tp_Size,
            tp_Level)
        VALUES (
            @SiteId,
            @ViewId,
            @ListId,
            @Type,
            ISNULL(@Flags,0),
            @PageUrlID,
            0,
            @Level)
    END
cleanup:
    IF (0 <> @@ERROR)
    BEGIN
        RETURN 1
    END
    RETURN 0

GO
