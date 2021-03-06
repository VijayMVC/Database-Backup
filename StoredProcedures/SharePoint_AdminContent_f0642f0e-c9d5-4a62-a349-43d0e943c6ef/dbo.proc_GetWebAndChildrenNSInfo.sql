/****** Object:  StoredProcedure [dbo].[proc_GetWebAndChildrenNSInfo]    Script Date: 5/15/2018 12:12:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebAndChildrenNSInfo(
    @SiteId uniqueidentifier,
    @WebId  uniqueidentifier,
    @GetThisWeb bit = 0,
    @GetSubwebs bit = 0,
    @GetDocLibs bit = 0,
    @GetLists bit = 0)
AS
SET NOCOUNT ON
DECLARE @WebDirName nvarchar(256)
DECLARE @WebLeafName nvarchar(128)
DECLARE @WebUrl nvarchar(260)
SELECT 
    @WebUrl = FullUrl
FROM
    Webs
WHERE 
    Id = @WebId
EXEC proc_SplitUrl @WebUrl, @WebDirName OUTPUT, @WebLeafName OUTPUT
IF @GetThisWeb = 1
BEGIN
    SELECT
        w1.Title,
        w1.Id,
        w1.FullUrl,
        w1.WebTemplate,
        w1.ProvisionConfig,
        w1.MeetingCount,
        p1.Acl,
        p1.AnonymousPermMask
    FROM
        Docs AS d1
        INNER JOIN 
        Webs AS w1
        ON
        d1.SiteId = @SiteId AND
        d1.DirName = @WebDirName AND
        d1.LeafName = @WebLeafName AND    
        d1.WebId = w1.Id
        INNER JOIN
        Perms as p1
        ON
        p1.SiteId = @SiteId AND
        p1.ScopeId = d1.ScopeId
    WHERE
        d1.Type = 2 
END
IF @GetSubwebs = 1
BEGIN
    SELECT
        w1.Title,
        w1.Id,
        w1.FullUrl,
        w1.WebTemplate,
        w1.ProvisionConfig,
        w1.MeetingCount,
        p1.Acl,
        p1.AnonymousPermMask
    FROM
        Docs AS d1
        INNER JOIN 
        Webs AS w1
        ON
        d1.SiteId = w1.SiteId AND
        d1.DirName = dbo.fn_GetDirName(w1.FullUrl, -1) AND
        d1.LeafName = dbo.fn_GetLeafName(w1.FullUrl, -1)
        INNER JOIN
        Perms as p1
        ON
        p1.SiteId = @SiteId AND
        p1.ScopeId = d1.ScopeId AND
        p1.SiteId = d1.SiteId
    WHERE
        d1.SiteId = @SiteId AND
        w1.ParentWebId = @WebId AND
        d1.Type = 2 
    ORDER BY
        w1.Title
END
IF @GetLists = 1 OR @GetDocLibs = 1
BEGIN
    SELECT
        l1.tp_Title,
        l1.tp_ID,
        dbo.fn_GetFullUrl(d1.DirName,d1.LeafName),
        l1.tp_RootFolder,
        l1.tp_ImageUrl,
        l1.tp_BaseType,
        l1.tp_ServerTemplate,
        d1.FolderChildCount,
        p1.Acl,
        p1.AnonymousPermMask
    FROM
        Docs as d1 INNER JOIN
        Lists as l1 ON
        d1.SiteId = @SiteId AND
        l1.tp_WebId = @WebId AND
        l1.tp_RootFolder = d1.Id
        INNER JOIN 
        Perms as p1 ON
        p1.SiteId = @SiteId AND
        p1.SiteId = d1.SiteId AND
        p1.ScopeId = d1.ScopeId
    WHERE
        d1.SiteId = @SiteId AND
        d1.Type=1 AND
        l1.tp_Flags & 256 = 0 AND
        ((@GetDocLibs = 1 AND l1.tp_BaseType = 1) OR
            (@GetLists = 1 AND l1.tp_BaseType <> 1))
    ORDER BY
    CASE l1.tp_ServerTemplate
        WHEN 101 THEN 0
        WHEN 115 THEN 0
        WHEN 130 THEN 0
        WHEN 109 THEN 1
        WHEN 108 THEN 3
        WHEN 188 THEN 3
        WHEN 102 THEN 4
        ELSE 2 END,
    l1.tp_Title
END
    RETURN 0

GO
