/****** Object:  StoredProcedure [dbo].[proc_GetLinkInfoSingleDoc]    Script Date: 5/15/2018 12:12:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetLinkInfoSingleDoc(
    @DocSiteId   uniqueidentifier,
    @DocDirName  nvarchar(256),
    @DocLeafName nvarchar(128),
    @Level tinyint)
AS
    SET NOCOUNT ON
    SELECT DISTINCT
        Links.TargetDirName AS LinkDirName,
        Links.TargetLeafName AS LinkLeafName, Links.Type AS LinkType,
        Links.Security AS LinkSecurity, Links.Dynamic AS LinkDynamic,
        Links.ServerRel AS LinkServerRel, Docs.Type AS LinkStatus,
        PointsToDir AS PointsToDir, NULL AS WebPartId, NULL AS LinkNumber,
        NULL AS WebId, NULL AS Search, NULL AS FieldId
    FROM
        Links LEFT OUTER JOIN Docs
    ON
        Links.ServerRel = 1 AND
        Docs.SiteId = Links.SiteId AND
        Docs.DirName = Links.TargetDirName AND
        Docs.LeafName = Links.TargetLeafName
    WHERE
        Links.SiteId = @DocSiteId AND Links.DirName = @DocDirName AND
        Links.LeafName = @DocLeafName AND Links.Level = @Level
    UNION ALL
    SELECT DISTINCT
        Links.DirName AS LinkDirName,
        Links.LeafName AS LinkLeafName, Links.Type AS LinkType, 
        NULL AS LinkSecurity, NULL AS LinkDynamic, NULL AS LinkServerRel,
        CAST(128 AS tinyint) AS LinkStatus,
        NULL AS PointsToDir, NULL AS WebPartId,
        NULL AS LinkNumber, NULL AS WebId, NULL AS Search, NULL AS FieldId
    FROM
        AllLinks AS Links WITH (INDEX=Links_Backward)
    WHERE
        SiteId = @DocSiteId AND DeleteTransactionId = 0x AND
        TargetDirName = @DocDirName AND TargetLeafName = @DocLeafName

GO
