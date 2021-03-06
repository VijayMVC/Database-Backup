/****** Object:  StoredProcedure [dbo].[proc_GetListAndChildrenNSInfo]    Script Date: 5/15/2018 12:12:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetListAndChildrenNSInfo(
    @SiteId uniqueidentifier,
    @WebId  uniqueidentifier,
    @ListId uniqueidentifier,
    @FolderId uniqueidentifier,
    @GetList bit = 0,
    @GetSubFolders bit = 0)
AS
SET NOCOUNT ON
IF @GetList = 1
BEGIN
    SELECT
        @FolderId = l1.tp_RootFolder
    FROM
        Lists as l1
    WHERE
        tp_WebId = @WebId AND
        tp_ID = @ListId
    SELECT
        l1.tp_Title,
        l1.tp_ID,
        dbo.fn_GetFullUrl(d1.DirName,d1.LeafName) as FullUrl,
        l1.tp_RootFolder,
        l1.tp_ImageUrl,
        l1.tp_BaseType,
        l1.tp_ServerTemplate,
        d1.FolderChildCount,
        p1.Acl,
        p1.AnonymousPermMask
    FROM
        Lists as l1 INNER JOIN
        Docs as d1 ON
        l1.tp_RootFolder = d1.Id AND
        l1.tp_webId = @WebId AND
        l1.tp_ID = @ListId
        INNER JOIN 
        Perms as p1 ON
        p1.SiteId = @SiteId AND
        p1.ScopeId = d1.ScopeId AND
        p1.SiteId = d1.SiteId
    WHERE
        d1.SiteId = @SiteId AND
        d1.Type=1 
    ORDER BY
        l1.tp_BaseType,
        l1.tp_Title
END
IF @GetSubFolders=1
BEGIN
DECLARE @ParentDirName nvarchar(256)
DECLARE @ParentLeafName nvarchar(128)
DECLARE @ParentFullUrl nvarchar(260)
SELECT
    @ParentDirName = DirName,
    @ParentLeafName = LeafName
FROM
    Docs as d1
WHERE
    d1.Id = @FolderId AND
    d1.Level = 1
    SET @ParentFullUrl = dbo.fn_GetFullUrl(@ParentDirName, @ParentLeafName)
    SELECT
        d1.LeafName,
        d1.Id,
        dbo.fn_GetFullUrl(d1.DirName, d1.LeafName),
        d1.FolderChildCount,
        d1.ListId,
        p1.Acl,
        p1.AnonymousPermMask
    FROM
        Docs as d1
        INNER JOIN
        Perms as p1 ON
        p1.SiteId = @SiteId AND
        p1.SiteId = d1.SiteId AND
        p1.ScopeId = d1.ScopeId
    WHERE
        d1.SiteId = @SiteId AND
        d1.DirName = @ParentFullUrl AND
        d1.Type = 1 AND d1.DocLibRowId IS NOT NULL AND
        d1.Level = 1
    ORDER BY
        d1.LeafName
END
    RETURN 0

GO
