/****** Object:  StoredProcedure [dbo].[proc_DetectOrphans]    Script Date: 5/15/2018 12:12:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DetectOrphans
AS
    SET NOCOUNT ON
    SELECT
        Id
    FROM
        Sites
    WHERE
        NOT EXISTS (SELECT SiteId FROM Webs WHERE Webs.SiteId = Sites.Id)
    SELECT
        Webs.Id,
        Webs.Title,
        Webs.SiteId,
        Webs.FullUrl
    FROM
        Webs 
    LEFT OUTER JOIN
        Sites 
    ON
        Webs.SiteId = Sites.Id
    WHERE
        Sites.Id IS NULL 
    UNION
    SELECT 
        Webs.Id,
        Webs.Title,
        Webs.SiteId,
        Webs.FullUrl
    FROM
        Webs
    LEFT OUTER JOIN
        (SELECT WebId FROM Docs WHERE Type = 2) AS WebDocs
    ON Webs.Id = WebDocs.WebId
    WHERE
        WebDocs.WebId IS NULL
    ORDER BY
        Webs.FullUrl
    SELECT     
    	Subwebs.Id,
    	Subwebs.Title,
    	Subwebs.SiteId,
    	Subwebs.FullUrl
    FROM         
    	Webs Subwebs
    LEFT OUTER JOIN
        Webs ParentWebs 
    ON
        Subwebs.ParentWebId = ParentWebs.Id
    WHERE     
    	(Subwebs.ParentWebId IS NOT NULL) 
    	AND 
    	(ParentWebs.Id IS NULL) 
    ORDER BY
        Subwebs.FullUrl
    SELECT DISTINCT
        Docs.WebId,
        Docs.SiteId        
    FROM
        Docs LEFT OUTER JOIN Webs
        ON Docs.WebId = Webs.Id   
    WHERE
        Webs.Id IS NULL AND
        Docs.ListId IS NULL 
    ORDER BY
        Docs.SiteId, Docs.WebId
    SELECT     
    	Lists.tp_ID AS ListId,
    	Lists.tp_Title AS Title,
    	Lists.tp_WebId AS WebId,
    	NULL AS SiteId
    FROM         
    	Lists LEFT OUTER JOIN Webs 
    	ON Lists.tp_WebId = Webs.Id
    WHERE     
    	(Webs.Id IS NULL)  
    UNION
    SELECT DISTINCT
    	Docs.ListId,
    	NULL, 
    	NULL,
    	Docs.SiteId
    FROM   
    	Docs LEFT OUTER JOIN Lists 
    	ON Docs.ListId = Lists.tp_ID
    WHERE     
    	(Lists.tp_ID IS NULL) 
    	AND 
    	(Docs.ListId IS NOT NULL)  
    UNION    	
    SELECT DISTINCT
    	UserData.tp_ListId,
    	NULL,
    	NULL,
    	UserData.tp_SiteId
    FROM
    	UserData LEFT OUTER JOIN Lists
    	ON UserData.tp_ListId = Lists.tp_ID
    WHERE
         (Lists.tp_ID IS NULL) 
    ORDER BY
        SiteId, WebId, ListId
    RETURN 0

GO
