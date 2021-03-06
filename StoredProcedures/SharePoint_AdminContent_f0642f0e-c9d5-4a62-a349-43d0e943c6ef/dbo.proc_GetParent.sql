/****** Object:  StoredProcedure [dbo].[proc_GetParent]    Script Date: 5/15/2018 12:12:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetParent
(
    @ItemType           tinyint,
    @SiteId             uniqueidentifier,
    @DirName            nvarchar(256),
    @LeafName           nvarchar(128),
    @NewItemType        tinyint OUTPUT,
    @NewDirName         nvarchar(256) OUTPUT,
    @NewLeafName        nvarchar(128) OUTPUT
)
AS
    SET NOCOUNT ON
    DECLARE @Id uniqueidentifier
    SET @NewDirName = @DirName
    SET @NewLeafName = @LeafName
    IF (@ItemType = 1) OR 
        (@ItemType = 3) OR 
        (@ItemType = 5)
    BEGIN
        SELECT TOP 1
            @Id = ListId
        FROM 
            Docs
        WHERE
            @SiteId = SiteId AND
            @DirName = DirName AND
            @LeafName = LeafName
        IF (@Id IS NULL) SET @NewItemType = 6
        ELSE SET @NewItemType = 4
    END
    ELSE IF (@ItemType = 4)
        SET @NewItemType = 6
    ELSE IF (@ItemType = 6)
        BEGIN
            SELECT TOP 1
                @Id = Webs.ParentWebId
            FROM 
                Docs
            INNER JOIN
                Webs WITH (NOLOCK)
            ON
                Webs.SiteId = Docs.SiteId AND        
                Webs.Id = Docs.WebId 
            WHERE
                @SiteId = Docs.SiteId AND
                @DirName = Docs.DirName AND
                @LeafName = Docs.LeafName
            IF (@Id IS NOT NULL)
                BEGIN
                    SELECT TOP 1
                        @NewDirName = Docs.DirName,
                        @NewLeafName = Docs.LeafName
                    FROM 
                        Docs
                    INNER JOIN
                        Webs WITH (NOLOCK)
                    ON
                        Docs.SiteId = @SiteId AND        
                        Docs.WebId = Webs.Id
                    WHERE
                        @SiteId = Docs.SiteId
                    SET @NewItemType = 6
                END
            ELSE
                SET @NewItemType = 7 
        END
    IF (0 = @@ROWCOUNT)
        RETURN 2
    ELSE
        RETURN 0

GO
