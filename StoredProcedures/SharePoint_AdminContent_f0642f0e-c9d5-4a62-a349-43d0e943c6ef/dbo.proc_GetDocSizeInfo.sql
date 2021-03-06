/****** Object:  StoredProcedure [dbo].[proc_GetDocSizeInfo]    Script Date: 5/15/2018 12:12:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetDocSizeInfo(@SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
SELECT ISNULL(Docs.Size,0) + ISNULL(PersonSizes,0) + ISNULL(WpSizes,0) + ISNULL(DocVersionsSize.Size,0) As TotalSize,
    Docs.TimeLastModified,
    Docs.Id,
    Docs.DirName,
    Docs.LeafName,
    Docs.Size,
    ISNULL(Docs.SetupPath,'') AS SetupPath,
    ISNULL(PersonSizes,0) + ISNULL(WpSizes,0),
    ISNULL(DocVersionsSize.Size,0),
    ISNULL(Docs.DoclibRowId,-1) AS DoclibRowId,
    Docs.WebId,
    ISNULL(Docs.ListId,'00000000-0000-0000-0000-000000000000'),
    Webs.FullUrl,
    Webs.Language,
    ISNULL(WpType1Size, 0)
FROM
dbo.Webs
INNER JOIN
    dbo.Docs
    ON
    Webs.Id = Docs.WebId
LEFT OUTER JOIN
    (SELECT
    (SUM(CAST((ISNULL(Personalization.tp_Size,0)) AS BIGINT))) As PersonSizes,
    (SUM(CAST((ISNULL(WebParts.tp_Size,0)) AS BIGINT))) As WpSizes,
    WebParts.tp_PageUrlId,
    (SUM(CAST((ISNULL(WebParts.tp_UserId, ISNULL(WebParts.tp_Size,0)) - ISNULL(WebParts.tp_UserId, 0)) AS BIGINT))) As WpType1Size
    FROM
    WebParts
    LEFT OUTER JOIN
    Personalization
    ON
        Personalization.tp_WebPartId = WebParts.tp_ID AND
        Personalization.tp_SiteId = @SiteId AND
        WebParts.tp_SiteId = @SiteId
    GROUP BY WebParts.tp_PageUrlId) As WebPartsInList
    ON
    WebPartsInList.tp_PageUrlId = Docs.Id
    LEFT OUTER JOIN
        (SELECT (SUM(CAST((ISNULL(DocVersions.Size,0)) AS BIGINT))) As Size,
        DocVersions.Id
        FROM
        DocVersions
        WHERE DocVersions.SiteId = @SiteId
        GROUP BY DocVersions.Id) As DocVersionsSize
        ON
        DocVersionsSize.Id = Docs.Id
        WHERE Docs.SiteId = @SiteId AND Type=0

GO
