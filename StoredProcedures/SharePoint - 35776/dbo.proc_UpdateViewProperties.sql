/****** Object:  StoredProcedure [dbo].[proc_UpdateViewProperties]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateViewProperties(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @UserID int,
    @ViewId uniqueidentifier,
    @DisplayName nvarchar(255),
    @ContentTypeId tContentTypeId,
    @Type tinyint,
    @Flags int,
    @BaseViewID tinyint)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    DECLARE @OldContentTypeId tContentTypeId
    SET @Ret = 0
    IF (@ContentTypeId IS NULL)
    BEGIN
        SELECT
            @OldContentTypeId = tp_ContentTypeId
        FROM WebParts
        INNER JOIN
            Docs
        ON
            WebParts.tp_Level = Docs.Level AND
            WebParts.tp_PageUrlID = Docs.Id       
        WHERE
            WebParts.tp_ListId = @ListId AND
            (WebParts.tp_UserID IS NULL OR WebParts.tp_UserID = @UserID) AND
            WebParts.tp_ID = @ViewId AND
            (Docs.Level = 255 AND 
                Docs.LTCheckoutUserId = @UserID OR
            ((Docs.Level = 1 AND 
            Docs.DraftOwnerId IS NULL OR 
            Docs.Level = 2)  AND
            (Docs.LTCheckoutUserId IS NULL OR 
                Docs.LTCheckoutUserId <> @UserID)))
    END
    UPDATE
        WebParts
    SET
        tp_DisplayName = CASE WHEN @DisplayName IS NULL THEN
            tp_DisplayName ELSE @DisplayName END,
        tp_ContentTypeId = ISNULL(@ContentTypeId, tp_ContentTypeId),
        tp_Type = CASE WHEN @Type IS NULL THEN
            tp_Type ELSE @Type END,
        tp_BaseViewID = CASE WHEN @BaseViewID IS NULL THEN
            tp_BaseViewID ELSE @BaseViewID END,
        tp_Flags = CASE WHEN @Flags IS NULL THEN
            tp_Flags ELSE @Flags END
    FROM WebParts
    INNER JOIN
        Docs
    ON
        WebParts.tp_Level = Docs.Level AND
        WebParts.tp_PageUrlID = Docs.Id       
    WHERE
        WebParts.tp_ListId = @ListId AND
        (WebParts.tp_UserID IS NULL OR WebParts.tp_UserID = @UserID) AND
        WebParts.tp_ID = @ViewId AND
        (Docs.Level = 255 AND 
            Docs.LTCheckoutUserId = @UserID OR
        ((Docs.Level = 1 AND 
          Docs.DraftOwnerId IS NULL OR 
          Docs.Level = 2)  AND
        (Docs.LTCheckoutUserId IS NULL OR 
            Docs.LTCheckoutUserId <> @UserID)))
    IF (0 <> @@ERROR OR @@ROWCOUNT <> 1)
    BEGIN
        SET @Ret = 3
        GOTO cleanup
    END
    IF ((@Flags & 16777216) <> 0)
    BEGIN
        EXEC @Ret = proc_MakeViewMobileDefaultForList @ListId, @ViewId
        IF @Ret <> 0
        BEGIN
            GOTO cleanup
        END
    END
    ELSE
    BEGIN
        EXEC @Ret = proc_EnsureMobileDefaultViewForList @ListId
        IF @Ret <> 0
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
