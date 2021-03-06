/****** Object:  StoredProcedure [dbo].[proc_DeplAddExportObjectLinks]    Script Date: 5/15/2018 12:11:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddExportObjectLinks(
    @SiteId uniqueidentifier,
    @IsMajorFileOnly tinyint)
AS
    SET NOCOUNT ON
    DECLARE @RecordCount int
    SET @RecordCount = 0
    IF @SiteId IS NULL
        RETURN 87
    IF EXISTS(
        SELECT 1
        FROM #ExportObjects
        WHERE
            Type = 1 AND
            ParentId = '00000000-0000-0000-0000-000000000000' AND
            IncludeDescendants = 2)
    BEGIN
        SELECT @RecordCount
        RETURN 0
    END
    UPDATE #ExportObjects
        SET IsLink = 0
    WHERE IsLink = 1
    INSERT INTO #ExportObjects(
        Id,
        Level,
        DirName,
        LeafName,
        Type,
        ParentId,
        ParentWebId,
        IncludeDescendants,
        IsDependency,
        IsLink,
        FullUrl)
    SELECT DISTINCT
        TargetDocs.Id,
        0,
        TargetDocs.DirName,
        TargetDocs.LeafName,
        CASE
            WHEN TargetDocs.Type = 1 AND TargetDocs.DocLibRowId IS NOT NULL THEN 6
            WHEN TargetDocs.Type = 1 THEN 2
            WHEN TargetDocs.DocLibRowId IS NOT NULL THEN 7
            ELSE 5
        END,
        TargetDocs.ParentId,
        TargetDocs.WebId,
        0,
        1, 
        1, 
        CASE
            WHEN (DATALENGTH(TargetDocs.DirName) = 0) THEN TargetDocs.LeafName
            WHEN (DATALENGTH(TargetDocs.LeafName) = 0) THEN TargetDocs.DirName
            ELSE TargetDocs.DirName + N'/' + TargetDocs.LeafName
        END
    FROM #ExportObjects e
    INNER JOIN
        Docs
    ON
        e.Id = Docs.Id AND
        (e.Type = 5 OR e.Type = 7) AND
        e.IsDeleted = 0 AND
        ((@IsMajorFileOnly = 1 AND Docs.Level=1) OR
        (@IsMajorFileOnly = 0 AND Docs.Level IN
            (SELECT TOP 1 d2.Level FROM Docs d2
            WHERE d2.Id=Docs.Id AND d2.Level <> 255)) )
    INNER JOIN
        Links
    ON
        Links.SiteId = @SiteId AND
        Links.DirName = Docs.DirName AND
        Links.LeafName = Docs.LeafName AND
        Links.Level = Docs.Level AND
        Links.SiteId = Docs.SiteId AND
        Links.ServerRel = 1
    INNER JOIN
        Docs TargetDocs
    ON
        Links.SiteId = TargetDocs.SiteId AND
        Links.TargetDirName = TargetDocs.DirName AND
        Links.TargetLeafName = TargetDocs.LeafName
    INNER JOIN
        Lists
    ON
        TargetDocs.ListId = Lists.tp_ID AND
        TargetDocs.WebId = Lists.tp_WebId
    WHERE
        ((Lists.tp_Flags & 16) <> 0 OR
         (Lists.tp_Flags & 0x8000000) = 0) AND
        ((@IsMajorFileOnly = 1 AND TargetDocs.Level=1) OR
        (@IsMajorFileOnly = 0 AND TargetDocs.Level IN
            (SELECT TOP 1 d3.Level FROM Docs d3
            WHERE d3.Id=TargetDocs.Id AND d3.Level <> 255))) AND
        NOT EXISTS (
            SELECT 1
            FROM #ExportObjects existing
            WHERE
                TargetDocs.Id = existing.Id)
    SET @RecordCount = @@ROWCOUNT
    INSERT INTO #ExportObjects(
        Id,
        Type,
        Level,
        DirName,
        LeafName,
        ParentId,
        ParentWebId,
        IncludeDescendants,
        IsDependency,
        IsLink,
        FullUrl)
    SELECT
        NEWID(),
        4,
        0,
        listitems.tp_DirName,
        listitems.tp_LeafName,
        listitems.tp_ListId,
        listitems.WebId,
        0,
        1, 
        1, 
        CASE
            WHEN (DATALENGTH(listitems.tp_DirName) = 0) THEN listitems.tp_LeafName
            WHEN (DATALENGTH(listitems.tp_LeafName) = 0) THEN listitems.tp_DirName
            ELSE listitems.tp_DirName + N'/' + listitems.tp_LeafName
        END
    FROM
    (
        SELECT DISTINCT
            UserData.tp_DirName,
            UserData.tp_LeafName,
            UserData.tp_ListId,
            Docs.WebId
        FROM #ExportObjects e
        INNER JOIN
            Docs
        ON
            e.IsLink = 1 AND
            e.Id = Docs.Id
        INNER JOIN
            UserData
        ON
            Docs.ListId = UserData.tp_ListId AND
            Docs.DocLibRowId = UserData.tp_ID AND
            UserData.tp_SiteId = @SiteId
        WHERE
            UserData.tp_RowOrdinal = 0 AND
            ((@IsMajorFileOnly = 1 AND UserData.tp_Level=1) OR
             (@IsMajorFileOnly = 0 AND UserData.tp_Level IN
                (SELECT TOP 1 d2.tp_Level FROM UserData d2
                 WHERE
                   d2.tp_Id = UserData.tp_Id AND
                   d2.tp_ListId = UserData.tp_ListId AND
                   d2.tp_Level <> 255))) AND
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects existing
                WHERE
                    UserData.tp_DirName = existing.DirName AND
                    UserData.tp_LeafName = existing.LeafName AND
                    existing.Type = 4)
    ) listitems
    SELECT @RecordCount
    RETURN 0

GO
