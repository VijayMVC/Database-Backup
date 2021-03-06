/****** Object:  StoredProcedure [dbo].[proc_GetAllWebPartsOnPage]    Script Date: 5/15/2018 12:12:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetAllWebPartsOnPage(
    @SiteId uniqueidentifier,
    @CurrentWebId uniqueidentifier,
    @AllUsers bit,
    @SystemID tSystemID,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint,
    @PrefetchListScope bit,
    @GetViewBodies bit)
AS
    SET NOCOUNT ON
    DECLARE @DocId uniqueidentifier
    DECLARE @ListId uniqueidentifier
    DECLARE @WebId uniqueidentifier
    DECLARE @UserId int
    SET @UserId = dbo.fn_UserIDFromSid(@SiteId, @SystemID)
    IF (@Level IS NULL OR @Level = 0)
    BEGIN
        EXEC proc_GetLevel  @SiteId,
            @DirName,
            @LeafName,
            @UserId,
            1,
            @Level OUTPUT
    END
    SELECT
        @DocId = Id,
        @ListId = ListId,
        @WebId = WebId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        Level = @Level
    IF ((@DocId IS NULL) OR
        (@CurrentWebId <> @WebId))
    BEGIN
        RETURN 2    
    END
    DECLARE @ret int
    EXEC @ret = proc_GetAllWebPartsInternal @SiteId, @AllUsers, @UserID,
        @DocId, @ListId, @WebID, NULL, @Level, @PrefetchListScope,
        @GetViewBodies
    IF (@@ERROR <> 0 OR @Ret <> 0)
    BEGIN
        IF (@Ret = 0)
            SET @Ret = -2147467259
    END
    RETURN @ret

GO
