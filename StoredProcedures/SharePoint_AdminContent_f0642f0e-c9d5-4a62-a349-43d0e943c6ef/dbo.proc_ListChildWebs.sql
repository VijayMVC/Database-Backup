/****** Object:  StoredProcedure [dbo].[proc_ListChildWebs]    Script Date: 5/15/2018 12:12:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ListChildWebs(
       @SiteId uniqueidentifier,
       @WebUrl nvarchar(256),
       @Collation nvarchar(32) = '')
AS
BEGIN
       SET NOCOUNT ON
       DECLARE @DirName nvarchar(256)
       DECLARE @LeafName nvarchar(128)
       EXEC proc_SplitUrl @WebUrl, @DirName output, @LeafName output
       DECLARE @WebId uniqueidentifier
       SELECT
            @WebId = WebId
       FROM
            Docs
       WHERE
            SiteId = @SiteId AND
            DirName = @DirName AND
            LeafName = @LeafName AND
            (Type = 1 OR Type = 2)
       IF @WebId IS NULL
       BEGIN
            RETURN 3
       END
       IF (@Collation = N'Latin1_General_CI_AS')
       BEGIN 
            SELECT
                 Webs.FullUrl, 
                 Webs.Id,
                 Webs.Language,
                 ISNULL(Webs.Title, '')
            FROM
                 Webs
            WHERE
                 Webs.SiteId = @SiteId AND
                 Webs.ParentWebId = @WebId
            ORDER BY
                 Webs.Title COLLATE Latin1_General_CI_AS
       END
       ELSE IF (@Collation = N'Japanese_CI_AS')
       BEGIN 
            SELECT
                 Webs.FullUrl, 
                 Webs.Id,
                 Webs.Language,
                 ISNULL(Webs.Title, '')
            FROM
                 Webs
            WHERE
                 Webs.SiteId = @SiteId AND
                 Webs.ParentWebId = @WebId
            ORDER BY
                 Webs.Title COLLATE Japanese_CI_AS
       END
       ELSE IF (@Collation = N'Modern_Spanish_CI_AS')
       BEGIN 
            SELECT
                 Webs.FullUrl, 
                 Webs.Id,
                 Webs.Language,
                 ISNULL(Webs.Title, '')
            FROM
                 Webs
            WHERE
                 Webs.SiteId = @SiteId AND
                 Webs.ParentWebId = @WebId
            ORDER BY
                 Webs.Title COLLATE Modern_Spanish_CI_AS
       END
       ELSE IF (@Collation = N'French_CI_AS')
       BEGIN 
            SELECT
                 Webs.FullUrl, 
                 Webs.Id,
                 Webs.Language,
                 ISNULL(Webs.Title, '')
            FROM
                 Webs
            WHERE
                 Webs.SiteId = @SiteId AND
                 Webs.ParentWebId = @WebId
            ORDER BY
                 Webs.Title COLLATE French_CI_AS
       END 
       ELSE IF (@Collation <> '')
       BEGIN
       DECLARE @param1 nvarchar(40)
       SET @param1 = CASE WHEN @SiteId IS NULL THEN N'NULL' ELSE N'''' + CAST(@SiteId AS nvarchar(40)) + N'''' END
       DECLARE @param2 nvarchar(40)
       SET @param2 = CASE WHEN @WebId IS NULL THEN N'NULL' ELSE N'''' + CAST(@WebId AS nvarchar(40)) + N'''' END
       EXEC(N'
            DECLARE @SiteId uniqueidentifier
            DECLARE @WebId uniqueidentifier
            SET @SiteId = ' + @param1 + N'
            SET @WebId  = ' + @param2 + N'
            SELECT
                 Webs.FullUrl, 
                 Webs.Id,
                 Webs.Language,
                 ISNULL(Webs.Title, '''')
            FROM
                 Webs
            WHERE
                 Webs.SiteId = @SiteId AND
                 Webs.ParentWebId = @WebId       
            ORDER BY
                 Webs.Title COLLATE ' + @Collation)
       END
       ELSE
       BEGIN 
            SELECT
                 Webs.FullUrl, 
                 Webs.Id,
                 Webs.Language,
                 ISNULL(Webs.Title, '')
            FROM
                 Webs
            WHERE
                 Webs.SiteId = @SiteId AND
                 Webs.ParentWebId = @WebId
       END
    RETURN 0
END

GO
