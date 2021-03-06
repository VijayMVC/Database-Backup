/****** Object:  StoredProcedure [dbo].[proc_DeplAddFileDependencies]    Script Date: 5/15/2018 12:12:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddFileDependencies(
    @SiteId uniqueidentifier,
    @IsMajorFileOnly int,
    @LinksOnly tinyint)
AS
    SET NOCOUNT ON
    DECLARE @Level int
    SET @Level = 0
    IF NOT EXISTS
        (SELECT TOP 1 Id FROM #ExportObjects
         WHERE Type = 5 OR Type = 7)
        RETURN 0
    INSERT INTO #ExportObjects(
        Id,
        Type,
        Level,
        DirName,
        LeafName,
        ParentId,
        ParentWebId,
        IncludeDescendants,
        IsLink,
        FullUrl,
        IsSelected)
    SELECT DISTINCT
        NEWID(),
        4,
        @Level + 1,
        ud.tp_DirName,
        ud.tp_LeafName,
        ud.tp_ListId,
        e.ParentWebId,
        e.IncludeDescendants,
        @LinksOnly,
        CASE
            WHEN (DATALENGTH(ud.tp_DirName) = 0) THEN ud.tp_LeafName
            WHEN (DATALENGTH(ud.tp_LeafName) = 0) THEN ud.tp_DirName
            ELSE ud.tp_DirName + N'/' + ud.tp_LeafName
        END,
        case when @LinksOnly = 0 THEN 1 ELSE 0 END
    FROM #ExportObjects e
    INNER JOIN
        UserData ud
    ON
        e.DirName = ud.tp_DirName AND
        e.LeafName = ud.tp_LeafName AND
        (e.Type = 5 OR e.Type = 7) AND
        e.IsDeleted = 0 AND
        e.IsLink = @LinksOnly AND
        ((@IsMajorFileOnly = 1 AND ud.tp_Level=1) OR
         (@IsMajorFileOnly = 0 AND ud.tp_Level IN
            (SELECT TOP 1 d2.tp_Level FROM UserData d2
                WHERE
                d2.tp_Id = ud.tp_Id AND
                d2.tp_ListId = ud.tp_ListId AND
                d2.tp_Level <> 255))) AND
        ud.tp_SiteId = @SiteId
    WHERE
        NOT EXISTS (
            SELECT 1
            FROM #ExportObjects existing
            WHERE
                ud.tp_DirName = existing.DirName AND
                ud.tp_LeafName = existing.LeafName AND
                existing.Type = 4) AND
        NOT EXISTS (
            SELECT 1
            FROM #ExportObjects existing
            WHERE
                ud.tp_ListId = existing.Id AND
                existing.IncludeDescendants > 0)    

GO
