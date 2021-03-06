/****** Object:  StoredProcedure [dbo].[proc_UpdateView]    Script Date: 5/15/2018 12:13:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateView(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @ViewId uniqueidentifier,
    @UserId int,
    @IsPersonalView bit,
    @View ntext,
    @DisplayName nvarchar(255),
    @ContentTypeId tContentTypeId,
    @ViewFlags int,
    @ViewMask int,
    @Level tinyint,
    @BypassCheck bit = 0, 
    @bUpdateAllPersonalViews bit = 0
    )
AS
    SET NOCOUNT ON
    DECLARE @ViewSize int
    DECLARE @@NewSize int
    DECLARE @Ret int
    DECLARE @IsCurrentVersion bit
    DECLARE @IsForceCheckout bit
    DECLARE @DeleteTransactionId varbinary(16)
    DECLARE @OldContentTypeId tContentTypeId
    DECLARE @WebId uniqueidentifier
    SET @Ret = 0
    SELECT
        @Level = Level,
        @IsCurrentVersion = IsCurrentVersion,
        @IsForceCheckout = CASE WHEN Lists.tp_Flags & 0x40000 <>0
            THEN 1
            ELSE 0
            END,
        @DeleteTransactionId = AllDocs.DeleteTransactionId,
        @OldContentTypeId = WebParts.tp_ContentTypeId,
        @WebId = AllDocs.WebId
    FROM 
        AllDocs
    INNER JOIN 
        WebParts 
    ON
        WebParts.tp_ListId = @ListId AND
        WebParts.tp_ID = @ViewId AND
        WebParts.tp_Level = AllDocs.Level AND
        WebParts.tp_PageUrlID = AllDocs.Id AND
        AllDocs.Level = @Level
    LEFT OUTER JOIN Lists WITH (NOLOCK)
    ON
        Lists.tp_ID = AllDocs.ListId AND
        Lists.tp_WebId = AllDocs.WebId AND
        AllDocs.DoclibRowId IS NOT NULL
    IF @Level IS NULL
        RETURN 3
    IF @BypassCheck = 0
    BEGIN
        IF @DeleteTransactionId <> 0x
            RETURN 3
        IF @IsCurrentVersion = 0 AND @IsPersonalView = 0
            RETURN 33
        IF (@IsForceCheckout = 1 AND @Level <> 255 AND
            @IsPersonalView = 0)
            RETURN 158
    END
    IF @View IS NOT NULL
    BEGIN
        SET @ViewSize = DATALENGTH(@View)
        EXEC @Ret = proc_OnUpdateWebParts
            @SiteId,
            @ViewId,
            @Level,
            @ViewSize,
            NULL,    
            NULL,    
            NULL,    
            NULL,    
            @DeleteTransactionId,
            @@NewSize OUTPUT
    END
    IF (0 <> @Ret)
        GOTO cleanup
    UPDATE
        WebParts
    SET
        tp_View =
            CASE
                WHEN @View IS NULL
                    THEN tp_View
                WHEN @ViewSize = 0
                    THEN NULL
                ELSE @View
            END,
        tp_DisplayName = CASE WHEN @DisplayName IS NULL THEN
            tp_DisplayName ELSE @DisplayName END,
        tp_ContentTypeId = ISNULL(@ContentTypeId, tp_ContentTypeId),
        tp_Flags = CASE WHEN @ViewFlags IS NULL THEN tp_Flags
            ELSE ((tp_Flags & ~@ViewMask) |
                (@ViewFlags & @ViewMask))
            END,
        tp_Size = CASE WHEN @View IS NULL THEN
            tp_Size ELSE ISNULL(@@NewSize, 0) END
    WHERE
        tp_ListId = @ListId AND
        tp_ID = @ViewId AND
        tp_Level = @Level AND
            ((@bUpdateAllPersonalViews = 1 OR
             (tp_UserId IS NOT NULL AND
                tp_UserId = @UserId) AND
                @IsPersonalView = 1) OR
                (tp_UserId IS NULL AND
                    @IsPersonalView = 0))
    IF @@ROWCOUNT = 1
    BEGIN
        SET @Ret = 0
    END
    ELSE
    BEGIN
        SET @Ret = 3
        GOTO cleanup
    END
    IF ((@ViewFlags & 16777216) <> 0)
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
    IF ((@ViewFlags & 268435456) <> 0)
    BEGIN
        SET @ContentTypeId = ISNULL(@ContentTypeId, @OldContentTypeId)
        EXEC @Ret = proc_MakeViewDefaultForContentType @ListId, @ViewId, @ContentTypeId
        IF @Ret <> 0
        BEGIN
            GOTO cleanup
        END
    END
cleanup:
    IF (0 <> @@ERROR OR 0 <> @Ret)
    BEGIN
        RETURN CASE WHEN (0 = @Ret) THEN 1 ELSE @Ret END
    END
    EXEC proc_LogChange @SiteId, @WebId, @ListId, NULL, NULL,
        @ViewId, NULL, NULL, 8192, 4096, NULL
    RETURN 0

GO
