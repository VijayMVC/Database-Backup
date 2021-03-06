/****** Object:  StoredProcedure [dbo].[proc_DeplAddListDependencies]    Script Date: 5/15/2018 12:12:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddListDependencies(
    @SiteId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @Level int
    SET @Level = 0
    IF NOT EXISTS
        (SELECT TOP 1 Id FROM #ExportObjects
         WHERE Type = 3)
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
        FullUrl)
    SELECT
        Docs.Id,
        CASE
            WHEN Docs.DocLibRowId IS NOT NULL THEN 6
            ELSE 2
        END,
        @Level,
        Docs.DirName,
        Docs.LeafName,
        Docs.ParentId,
        Docs.WebId,
        e.IncludeDescendants,
        CASE
            WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName
            WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName
            ELSE Docs.DirName + N'/' + Docs.LeafName
        END
    FROM #ExportObjects e
    INNER JOIN
        Lists
    ON
        e.Id = Lists.tp_ID AND
        e.Type = 3 AND
        e.IsDeleted = 0
    INNER JOIN
        Docs
    ON
        Docs.SiteId = @SiteId AND
        Docs.Id = Lists.tp_RootFolder
    WHERE  NOT EXISTS (
        SELECT 1
        FROM #ExportObjects existing
        WHERE
            Docs.Id = existing.Id)
    INSERT INTO #ExportObjects(
        Id,
        Level,
        DirName,
        LeafName,
        Type,
        ParentId,
        ParentWebId,
        IncludeDescendants,
        FullUrl)
    SELECT
        Docs.Id,
        @Level + 1,
        Docs.DirName,
        Docs.LeafName,
        CASE
            WHEN Docs.Type = 1 AND Docs.DocLibRowId IS NOT NULL THEN 6
            WHEN Docs.Type = 1 THEN 2
            WHEN Docs.DocLibRowId IS NOT NULL THEN 7
            ELSE 5
        END,
        Docs.ParentId,
        Docs.WebId,
        CASE
            WHEN Docs.Type = 1 THEN 2 
            ELSE 0
        END,
        CASE
            WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName
            WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName
            ELSE Docs.DirName + N'/' + Docs.LeafName
        END
    FROM #ExportObjects e
    INNER JOIN
        Docs
    ON
        Docs.SiteId = @SiteId AND
        Docs.ListId = e.Id AND
        e.Type = 3 AND
        e.IncludeDescendants = 0 AND
        e.IsDeleted = 0 AND
        Docs.DoclibRowId IS NULL AND
        Docs.Level = 1
    WHERE
        NOT EXISTS (
            SELECT 1
            FROM #ExportObjects existing
            WHERE
                Docs.Id = existing.Id)
    INSERT INTO #ExportObjects(
        Id,
        Level,
        DirName,
        LeafName,
        Type,
        ParentId,
        ParentWebId,
        IncludeDescendants,
        FullUrl)
    SELECT
        Docs.Id,
        @Level + 1,
        Docs.DirName,
        Docs.LeafName,
        CASE
            WHEN Docs.DocLibRowId IS NOT NULL THEN 7
            ELSE 5
        END,
        Docs.ParentId,
        Docs.WebId,
        0,
        CASE
            WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName
            WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName
            ELSE Docs.DirName + N'/' + Docs.LeafName
        END
    FROM #ExportObjects e
    INNER JOIN
        Lists
    ON
        e.Id = Lists.tp_ID AND
        e.Type = 3 AND
        e.IsDeleted = 0
    INNER JOIN
        Docs
    ON
        Docs.SiteId = @SiteId AND
        Docs.Id = Lists.tp_Template AND
        Docs.Level = 1
    WHERE NOT EXISTS (
        SELECT 1
        FROM #ExportObjects existing
        WHERE
            Docs.Id = existing.Id)

GO
