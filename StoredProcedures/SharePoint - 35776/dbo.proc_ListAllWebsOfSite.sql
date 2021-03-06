/****** Object:  StoredProcedure [dbo].[proc_ListAllWebsOfSite]    Script Date: 5/15/2018 12:12:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ListAllWebsOfSite(
       @SiteId uniqueidentifier,
       @Collation nvarchar(32) = ''
)
AS
       SET NOCOUNT ON
       IF (@Collation = N'Latin1_General_CI_AS')
       BEGIN 
            SELECT
                 A.FullUrl, 
                 A.Id,
                 ISNULL(B.FullUrl, A.FullUrl), 
                 A.Language, 
                 ISNULL(A.Title, '')
            FROM
                 Webs A
            LEFT OUTER JOIN
                 Webs B
            ON
                 A.ParentWebId = B.Id
            WHERE
                 A.SiteId = @SiteId AND
                 (B.SiteId = @SiteId OR B.SiteId IS NULL) 
            ORDER BY 
                 A.FullUrl COLLATE Latin1_General_CI_AS
       END
       ELSE IF (@Collation = N'Japanese_CI_AS')
       BEGIN 
            SELECT
                 A.FullUrl, 
                 A.Id,
                 ISNULL(B.FullUrl, A.FullUrl), 
                 A.Language, 
                 ISNULL(A.Title, '')
            FROM
                 Webs A
            LEFT OUTER JOIN
                 Webs B
            ON
                 A.ParentWebId = B.Id
            WHERE
                 A.SiteId = @SiteId AND
                 (B.SiteId = @SiteId OR B.SiteId IS NULL) 
            ORDER BY 
                 A.FullUrl COLLATE Japanese_CI_AS
       END
       ELSE IF (@Collation = N'Modern_Spanish_CI_AS')
       BEGIN 
            SELECT
                 A.FullUrl, 
                 A.Id,
                 ISNULL(B.FullUrl, A.FullUrl), 
                 A.Language, 
                 ISNULL(A.Title, '')
            FROM
                 Webs A
            LEFT OUTER JOIN
                 Webs B
            ON
                 A.ParentWebId = B.Id
            WHERE
                 A.SiteId = @SiteId AND
                 (B.SiteId = @SiteId OR B.SiteId IS NULL) 
            ORDER BY 
                 A.FullUrl COLLATE Modern_Spanish_CI_AS
       END
       ELSE IF (@Collation = N'French_CI_AS')
       BEGIN 
            SELECT
                 A.FullUrl, 
                 A.Id,
                 ISNULL(B.FullUrl, A.FullUrl), 
                 A.Language, 
                 ISNULL(A.Title, '')
            FROM
                 Webs A
            LEFT OUTER JOIN
                 Webs B
            ON
                 A.ParentWebId = B.Id
            WHERE
                 A.SiteId = @SiteId AND
                 (B.SiteId = @SiteId OR B.SiteId IS NULL) 
            ORDER BY 
                 A.FullUrl COLLATE French_CI_AS
       END 
       ELSE IF (@Collation <> '')
       BEGIN
       DECLARE @param1 nvarchar(40)
       SET @param1 = CASE WHEN @SiteId IS NULL THEN N'NULL' ELSE N'''' + CAST(@SiteId AS nvarchar(40)) + N'''' END
       EXEC(N'
            DECLARE @SiteId uniqueidentifier
            SET @SiteId  = ' + @param1 + N'
            SELECT
                 A.FullUrl, 
                 A.Id,
                 ISNULL(B.FullUrl, A.FullUrl), 
                 A.Language, 
                 ISNULL(A.Title, '''')
            FROM
                 Webs A
            LEFT OUTER JOIN
                 Webs B
            ON
                 A.ParentWebId = B.Id
            WHERE
                 A.SiteId = @SiteId AND
                 (B.SiteId = @SiteId OR B.SiteId IS NULL) 
            ORDER BY 
                 A.FullUrl COLLATE ' + @Collation)
       END
       ELSE
       BEGIN 
            SELECT
                 A.FullUrl, 
                 A.Id,
                 ISNULL(B.FullUrl, A.FullUrl), 
                 A.Language, 
                 ISNULL(A.Title, '')
            FROM
                 Webs A
            LEFT OUTER JOIN
                 Webs B
            ON
                 A.ParentWebId = B.Id
            WHERE
                 A.SiteId = @SiteId AND
                 (B.SiteId = @SiteId OR B.SiteId IS NULL) 
       END
    RETURN 0

GO
