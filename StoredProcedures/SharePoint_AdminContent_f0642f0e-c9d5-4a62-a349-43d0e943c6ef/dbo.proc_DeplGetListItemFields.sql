/****** Object:  StoredProcedure [dbo].[proc_DeplGetListItemFields]    Script Date: 5/15/2018 12:12:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplGetListItemFields(
    @LastOrdinal int,
    @IsMajorFileOnly int,
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @Columns nvarchar(1700))
AS
    SET NOCOUNT ON
    DECLARE @SelectSql nvarchar(4000)
    SET @SelectSql = N'
SELECT
    E.Id AS Id,
    UD.tp_ID AS IntId,
    Docs.Id,
    UD.tp_UIVersion,
    UD.tp_UIVersionString,
    UD.tp_RowOrdinal, ' + @Columns + N'
    UD.tp_Level
FROM
    UserData UD
INNER JOIN
    (SELECT TOP 200
        E2.Id,
        E2.DirName,
        E2.LeafName
     FROM #ExportObjects E2
     WHERE
        E2.Ordinal > @LastOrdinal AND
        E2.Type = 4 AND
        E2.ParentId = @ListId AND
        E2.IsDeleted = 0
    ORDER BY E2.Ordinal ) AS E
ON
    UD.tp_SiteId = @SiteId AND
    E.DirName = UD.tp_DirName AND
    E.LeafName = UD.tp_LeafName AND
    UD.tp_ListId = @ListId
INNER JOIN Docs ON
    Docs.SiteId = @SiteId AND
    UD.tp_ID = Docs.DocLibRowId AND
    UD.tp_ListId = Docs.ListId AND
    UD.tp_Level = Docs.Level AND
    UD.tp_UIVersion = Docs.UIVersion AND
    UD.tp_DirName = Docs.DirName AND
    UD.tp_LeafName = Docs.LeafName
WHERE
    ((@IsMajorFileOnly = 1 AND UD.tp_Level = 1 ) OR
     (@IsMajorFileOnly <> 1 AND UD.tp_Level IN
     (SELECT TOP 1 d2.tp_Level FROM UserData d2
      WHERE
        d2.tp_SiteId = @SiteId AND
        d2.tp_ListId = @ListId AND
        d2.tp_DirName = UD.tp_DirName AND
        d2.tp_LeafName = UD.tp_LeafName AND
        d2.tp_RowOrdinal=0 AND
        d2.tp_Level <> 255)))
'
    EXEC sp_executesql @SelectSql, N'@SiteId uniqueidentifier, @ListId uniqueidentifier, @LastOrdinal int, @IsMajorFileOnly int', @SiteId, @ListId, @LastOrdinal, @IsMajorFileOnly

GO
