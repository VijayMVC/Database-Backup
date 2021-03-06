/****** Object:  StoredProcedure [dbo].[proc_GetLevel]    Script Date: 5/15/2018 12:12:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetLevel(
    @DocSiteId   uniqueidentifier,
    @DocDirName  nvarchar(256),
    @DocLeafName nvarchar(128),
    @UserId      int,
    @MaxCheckinLevel tinyint,
    @Level       tinyint OUTPUT,
    @CheckinLevel tinyint = NULL OUTPUT,
    @WebId       uniqueidentifier = NULL OUTPUT)
AS
    SET NOCOUNT ON 
    DECLARE @CheckoutUserId int
    DECLARE @DraftOwnerId int
    DECLARE @Lists_Flags    bigint    
    SET @Level = NULL
    SET @CheckinLevel = NULL
    SELECT TOP 1    
        @CheckoutUserId = LTCheckoutUserId,
        @DraftOwnerId = DraftOwnerId,
        @Level = Level,
        @Lists_Flags = Lists.tp_Flags,
        @WebId = WebId
    FROM 
        Docs
    LEFT OUTER JOIN
        Lists WITH(NOLOCK) 
    ON
        Lists.tp_ID = Docs.ListId AND
        Lists.tp_WebId = Docs.WebId AND
        Docs.DocLibRowId IS NOT NULL
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName AND
        Docs.Level <> 255 AND
        Docs.Level <= @MaxCheckinLevel
    ORDER BY 
        Docs.Level DESC
    IF (@Level IS NULL  OR 
        @Lists_Flags IS NULL OR
        ((@Lists_Flags & 0x100000 = 0) AND 
         (@Lists_Flags & 0x200000 = 0)) OR
         (@DraftOwnerId IS NOT NULL AND 
         @DraftOwnerId = @UserId)) AND
       @MaxCheckinLevel = 1
    BEGIN
        SELECT   
            @CheckoutUserId = LTCheckoutUserId,
            @Level = Level,
            @WebId = WebId
        FROM 
            Docs
        WHERE
            Docs.SiteId = @DocSiteId AND
            Docs.DirName = @DocDirName AND
            Docs.LeafName = @DocLeafName AND
            Docs.Level = 2
    END
    SET @CheckinLevel = @Level
    IF (@UserId IS NOT NULL AND @UserId <> 0) AND
        (@Level IS NULL OR 
        (@CheckoutUserId IS NOT NULL AND 
        ((@CheckoutUserId = @UserId) OR (@UserId = -1))))
    BEGIN
        SELECT
            @Level = Level,
            @WebId = WebId
        FROM 
            Docs
        WHERE
            Docs.SiteId = @DocSiteId AND
            Docs.DirName = @DocDirName AND
            Docs.LeafName = @DocLeafName AND 
            Docs.Level = 255 AND
            ((CheckoutUserId = @UserId) OR (@UserId = -1))
    END

GO
