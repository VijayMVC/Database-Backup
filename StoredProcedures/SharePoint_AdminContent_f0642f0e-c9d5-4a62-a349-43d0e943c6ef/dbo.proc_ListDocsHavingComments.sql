/****** Object:  StoredProcedure [dbo].[proc_ListDocsHavingComments]    Script Date: 5/15/2018 12:12:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ListDocsHavingComments(
       @SiteId uniqueidentifier,
       @WebUrl nvarchar(256),
       @DocDir nvarchar(256),
       @Collation nvarchar(32))
AS
       SET NOCOUNT ON
       DECLARE @WebId uniqueidentifier
       EXEC proc_GetWebId @SiteId, @WebUrl, @WebId OUTPUT
       IF @WebId IS NULL
       BEGIN
            RETURN 3
       END
       IF (@Collation = N'Latin1_General_CI_AS')
       BEGIN 
       SELECT 
            Docs.Id, Docs.DirName, Docs.LeafName, COUNT(ComMd.Id)
       FROM
            Docs INNER JOIN ComMd
       ON
            Docs.Id = ComMd.DocId
       WHERE
            Docs.SiteId = @SiteId AND
            (@DocDir IS NULL OR Docs.DirName = @DocDir) AND
            ComMd.SiteId = @SiteId AND
            ComMd.Status <> 1 AND
            Docs.WebId = @WebId
       GROUP BY Docs.DirName, Docs.LeafName, Docs.Id
            ORDER BY Docs.DirName, Docs.LeafName COLLATE  Latin1_General_CI_AS
       END
       ELSE IF (@Collation = N'Japanese_CI_AS')
       BEGIN 
       SELECT 
            Docs.Id, Docs.DirName, Docs.LeafName, COUNT(ComMd.Id)
       FROM
            Docs INNER JOIN ComMd
       ON
            Docs.Id = ComMd.DocId
       WHERE
            Docs.SiteId = @SiteId AND
            (@DocDir IS NULL OR Docs.DirName = @DocDir) AND
            ComMd.SiteId = @SiteId AND
            ComMd.Status <> 1 AND
            Docs.WebId = @WebId
       GROUP BY Docs.DirName, Docs.LeafName, Docs.Id
            ORDER BY Docs.DirName, Docs.LeafName COLLATE  Japanese_CI_AS
       END
       ELSE IF (@Collation = N'Modern_Spanish_CI_AS')
       BEGIN 
       SELECT 
            Docs.Id, Docs.DirName, Docs.LeafName, COUNT(ComMd.Id)
       FROM
            Docs INNER JOIN ComMd
       ON
            Docs.Id = ComMd.DocId
       WHERE
            Docs.SiteId = @SiteId AND
            (@DocDir IS NULL OR Docs.DirName = @DocDir) AND
            ComMd.SiteId = @SiteId AND
            ComMd.Status <> 1 AND
            Docs.WebId = @WebId
       GROUP BY Docs.DirName, Docs.LeafName, Docs.Id
            ORDER BY Docs.DirName, Docs.LeafName COLLATE  Modern_Spanish_CI_AS
       END
       ELSE IF (@Collation = N'French_CI_AS')
       BEGIN 
       SELECT 
            Docs.Id, Docs.DirName, Docs.LeafName, COUNT(ComMd.Id)
       FROM
            Docs INNER JOIN ComMd
       ON
            Docs.Id = ComMd.DocId
       WHERE
            Docs.SiteId = @SiteId AND
            (@DocDir IS NULL OR Docs.DirName = @DocDir) AND
            ComMd.SiteId = @SiteId AND
            ComMd.Status <> 1 AND
            Docs.WebId = @WebId
       GROUP BY Docs.DirName, Docs.LeafName, Docs.Id
            ORDER BY Docs.DirName, Docs.LeafName COLLATE  French_CI_AS
       END 
       ELSE
       BEGIN
       DECLARE @param1 nvarchar(40)
       SET @param1 = CASE WHEN @SiteId IS NULL THEN N'NULL' ELSE N'''' + CAST(@SiteId AS nvarchar(40)) + N'''' END
       DECLARE @param2 nvarchar(40)
       SET @param2 = CASE WHEN @WebId IS NULL THEN N'NULL' ELSE N'''' + CAST(@WebId AS nvarchar(40)) + N'''' END
       DECLARE @param3 nvarchar(256)
       SET @param3 = CASE WHEN @DocDir IS NULL THEN N'NULL' ELSE N'N''' + REPLACE(CAST(@DocDir AS nvarchar(256)), N'''', N'''''') + N'''' END
       EXEC(N'
       DECLARE @SiteId uniqueidentifier
       DECLARE @WebId uniqueidentifier
       DECLARE @DocDir nvarchar(256)
       SET @SiteId = ' + @param1 + N'
       SET @WebId  = ' + @param2 + N'
       SET @DocDir  = ' + @param3 + N'
       SELECT 
            Docs.Id, Docs.DirName, Docs.LeafName, COUNT(ComMd.Id)
       FROM
            Docs INNER JOIN ComMd
       ON
            Docs.Id = ComMd.DocId
       WHERE
            Docs.SiteId = @SiteId AND
            (@DocDir IS NULL OR Docs.DirName = @DocDir) AND
            ComMd.SiteId = @SiteId AND
            ComMd.Status <> 1 AND
            Docs.WebId = @WebId
       GROUP BY Docs.DirName, Docs.LeafName, Docs.Id
            ORDER BY Docs.DirName, Docs.LeafName COLLATE  ' + @Collation)
       END
    RETURN 0

GO
