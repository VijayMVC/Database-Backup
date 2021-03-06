/****** Object:  StoredProcedure [dbo].[proc_GetDocComments]    Script Date: 5/15/2018 12:12:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetDocComments(
    @DocSiteId uniqueidentifier,
    @DocFullUrl nvarchar(260))
AS
    SET NOCOUNT ON
        DECLARE @DirName nvarchar(256)
        DECLARE @LeafName nvarchar(128)
        EXEC proc_SplitUrl @DocFullUrl, @DirName OUTPUT, @LeafName OUTPUT
        SELECT
            ComMd.Id,
            CASE WHEN ComMd2.Id IS NULL THEN 0 ELSE ComMd2.Id END AS Parent,
            ComMd.CommentId,
            ComMd.Bookmark,
            ComMd.Author,
            UserInfo.tp_Login,
            ComMd.Subject,
            ComMd.Created,
            ComMd.Status,
            ComMd.Comment
        FROM
            ComMd INNER JOIN Docs
        ON
            ComMd.SiteId = Docs.SiteId AND
            ComMd.DocId = Docs.Id
            INNER JOIN UserInfo
        ON
            ComMd.SiteId = UserInfo.tp_SiteID AND
            ComMd.UserId = UserInfo.tp_ID
            LEFT OUTER JOIN ComMd ComMd2
        ON
            ComMd2.SiteId = Docs.SiteId AND
            ComMd2.DocId = Docs.Id AND
            ComMd2.Id = ComMd.ParentId
        WHERE
            Docs.SiteId = @DocSiteId AND
            Docs.DirName = @DirName AND
            Docs.LeafName = @LeafName
        ORDER BY
            Parent,
            ComMd.Id

GO
