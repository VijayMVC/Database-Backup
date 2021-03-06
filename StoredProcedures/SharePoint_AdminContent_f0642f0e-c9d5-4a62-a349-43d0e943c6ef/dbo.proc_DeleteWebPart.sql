/****** Object:  StoredProcedure [dbo].[proc_DeleteWebPart]    Script Date: 5/15/2018 12:12:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteWebPart(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint OUTPUT,
    @UserId int,
    @WebPartID uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @DocId uniqueidentifier
    DECLARE @PartDocId uniqueidentifier
    DECLARE @Ret int
    DECLARE @IsCurrentVersion bit
    DECLARE @IsPersonalWebPart bit
    DECLARE @IsForceCheckout bit
    DECLARE @EnableMinorVersions bit
    DECLARE @IsModerate bit
    DECLARE @WebId uniqueidentifier
    DECLARE @ListId uniqueidentifier
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
        @PartDocId=tp_PageUrlID,
        @IsPersonalWebPart =
            CASE
            WHEN
                WebParts.tp_UserId IS NOT NULL AND
                WebParts.tp_UserId = @UserId
            THEN
                1
            ELSE
                0
            END
    FROM
        WebParts
    WHERE
        tp_SiteID = @SiteId AND
        tp_ID = @WebPartID AND
        tp_Level = @Level
    IF (@IsCurrentVersion = 0) AND (@IsPersonalWebPart = 0)
    BEGIN
        RETURN 33
    END
    IF (@IsForceCheckout = 1 AND
        @Level <> 255 AND
        @IsPersonalWebPart = 0 )
    BEGIN
        RETURN 158
    END
    IF (@IsPersonalWebPart = 1) AND (@Level = 255)
    BEGIN
        RETURN 12
    END
    IF (@DocId <> @PartDocId)
    BEGIN
        RETURN 5
    END
    BEGIN TRAN
    IF (@EnableMinorVersions = 1 OR @IsModerate = 1 ) AND
        @ItemId IS NOT NULL AND
        @Level = 1 AND @IsPersonalWebPart = 0
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
    DELETE
        dbo.Links
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        (Level = @Level OR
        @IsPersonalWebPart = 1) AND
        FieldId IS NULL AND
        WebPartId = @WebPartID
    IF (@@ERROR <> 0)
    BEGIN
        SET @Ret = 1
        GOTO cleanup
    END
    DELETE
        WebPartLists
    WHERE
        tp_SiteId = @SiteId AND
        tp_PageUrlID = @PartDocId AND
        tp_WebPartID = @WebPartID AND
        (tp_Level = @Level OR
         @IsPersonalWebPart = 1)
    IF (@@ERROR <> 0)
    BEGIN
        SET @Ret = 1
        GOTO cleanup
    END
    DELETE
        WebParts
    WHERE
        tp_SiteId = @SiteId AND
        tp_ID = @WebPartID AND
        (tp_Level = @Level OR
         @IsPersonalWebPart = 1)
    IF (@@ERROR <> 0)
    BEGIN
        SET @Ret = 1
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
