/****** Object:  StoredProcedure [dbo].[proc_GetListSizes]    Script Date: 5/15/2018 12:12:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetListSizes(@SiteId uniqueidentifier) AS 
    SET NOCOUNT ON
SELECT 
(ISNULL(DocSizes,0) + ISNULL(UserDataSize,0)) As TotalSize, 
nLists.tp_ID,
nLists.tp_WebID,
nLists.tp_Modified,
nLists.tp_ServerTemplate,
nLists.DirName,
nLists.LeafName,
nLists.tp_ImageUrl,
nLists.tp_Title,
nLists.tp_ItemCount,
Webs.WebTemplate,
Webs.Language,
Webs.FullUrl
FROM
Webs
INNER JOIN
    (SELECT 
    Lists.tp_ItemCount, 
    Lists.tp_Title, 
    Lists.tp_Id, 
    Lists.tp_WebID, 
    Lists.tp_Modified, 
    Lists.tp_ServerTemplate, 
    Docs.DirName, 
    Docs.LeafName, 
    Lists.tp_ImageUrl
    FROM 
    Lists 
    INNER JOIN 
    Docs 
    ON 
    Lists.tp_RootFolder = Docs.Id AND 
    Lists.tp_WebId = Docs.WebId 
    WHERE tp_BaseType <> 1 AND
        SiteId = @SiteId) As nLists
    ON
    Webs.Id = nLists.tp_WebId
    LEFT OUTER JOIN
        (SELECT 
        (SUM(CAST((ISNULL(Docs.Size,0)) AS BIGINT))) As DocSizes, 
        Docs.ListId,
        Docs.SiteId
        FROM 
        Docs 
        WHERE Docs.Type = 0 AND SiteId = @SiteId
        GROUP BY Docs.ListId,Docs.SiteId) As DocsInList
        ON
        DocsInList.ListId = nLists.tp_ID
        LEFT OUTER JOIN
            (SELECT 
            (SUM(CAST((ISNULL(tp_Size,0)) AS BIGINT))) As UserDataSize, 
            tp_ListId 
            FROM
            UserData 
            GROUP BY 
            UserData.tp_ListId) AS UserDataInList
            ON
            UserDataInList.tp_ListId = DocsInList.ListId

GO
