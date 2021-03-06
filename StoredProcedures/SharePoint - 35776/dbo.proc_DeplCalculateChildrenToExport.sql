/****** Object:  StoredProcedure [dbo].[proc_DeplCalculateChildrenToExport]    Script Date: 5/15/2018 12:11:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplCalculateChildrenToExport(
    @SiteId uniqueidentifier,
    @IsMajorFileOnly int,
    @LinksOnly tinyint,
    @IncludeUserInfo bit)
AS
    SET NOCOUNT ON
    DECLARE @Level int
    DECLARE @SkipUserInfoListId uniqueidentifier
    DECLARE @ErrorSave INT
    SET @ErrorSave = 0
    SET @SkipUserInfoListId = 0x0
    IF (@IncludeUserInfo = 0)
    BEGIN
        SELECT
            @SkipUserInfoListId = UserInfoListId
        FROM
            Sites
        WHERE
            Id = @SiteId
   END
    IF @SiteId IS NULL
        RETURN 87
    SET @Level = 0
    WHILE EXISTS(
        SELECT
            TOP 1 Id
        FROM #ExportObjects
        WHERE
            Level = @Level AND
            IncludeDescendants > 0)
    BEGIN
        INSERT INTO #ExportObjects(
            Id,
            Level,
            DirName,
            LeafName,
            Type,
            ParentId,
            ParentWebId,
            IncludeDescendants,
            IsLink,
            FullUrl)
        SELECT
            Docs.Id,
            @Level + 1,
            Docs.DirName,
            Docs.LeafName,
            CASE
                WHEN Docs.Type = 1 AND Docs.DocLibRowId IS NOT NULL THEN 6
                WHEN Docs.Type = 1 AND e.Type = 6 THEN e.Type
                WHEN Docs.Type = 1 OR
                     Docs.Type = 2 THEN 2
                WHEN Docs.DocLibRowId IS NOT NULL THEN 7
                WHEN Docs.Type = 0 AND e.Type = 6 THEN 7
                ELSE 5
            END,
            Docs.ParentId,
            Docs.WebId,
            CASE
                WHEN Docs.Type = 0 THEN 0
                WHEN Docs.Type = 1 AND
                     e.Type = 1 AND
                     e.IncludeDescendants = 1
                     THEN 2
                ELSE e.IncludeDescendants
            END,
            @LinksOnly,
            CASE
                WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName
                WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName
                ELSE Docs.DirName + N'/' + Docs.LeafName
            END
        FROM
            Docs
        INNER JOIN #ExportObjects e
        ON
            Docs.SiteId = @SiteId AND
            Docs.ParentId = e.Id 
        LEFT JOIN Webs
        ON
            Docs.Type = 2 AND
            Docs.WebId = Webs.Id
        WHERE
            NOT (e.Type = 2 AND
                 Docs.Type = 2 AND
                 e.IncludeDescendants < 2) AND
             NOT ((e.Type = 2 OR e.TYpe = 6) AND
                  Docs.Type = 1 AND
                  e.IncludeDescendants < 2) AND
            e.IsDeleted = 0 AND
            e.Level = @Level AND
            e.IsLink = @LinksOnly AND
            (Docs.ListId IS NULL OR Docs.ListId <> @SkipUserInfoListId) AND
            NOT (Docs.Type = 1 AND
                 Docs.LeafName = '_vti_pvt' ) AND
            (
              -- NOTE: Copy this into DeplGetFileData if this is changed
             (@IsMajorFileOnly = 1 AND Docs.Level=1) OR
             (@IsMajorFileOnly = 0 AND Docs.Level IN
                (SELECT TOP 1 d2.Level 
                 FROM Docs d2
                 WHERE 
                    d2.DirName=Docs.DirName AND 
                    d2.LeafName=Docs.LeafName AND 
                    d2.SiteId = @SiteId AND
                    d2.SiteId = Docs.SiteId AND
                    d2.Level < 255))) AND
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects existing
                WHERE
                    Docs.Id = existing.Id) AND
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects exportedWebs
                WHERE
                    e.ParentWebId = exportedWebs.Id AND
                    exportedWebs.IncludeDescendants = 1 AND
                    Docs.WebId <> e.ParentWebId) AND
            ISNULL(Webs.ProductVersion, 3) >= 3
        SET @ErrorSave = @@ERROR
        IF @ErrorSave <> 0
            RETURN @ErrorSave
        INSERT INTO #ExportObjects(
            Id,
            Level,
            DirName,
            LeafName,
            Type,
            ParentId,
            ParentWebId,
            IncludeDescendants,
            IsLink,
            FullUrl)
        SELECT
            Docs.WebID,
            @Level + 1,
            e.DirName,
            e.LeafName,
            1,
            Docs.ParentId,
            Docs.WebId,
            e.IncludeDescendants,
            @LinksOnly,
            e.FullUrl
        FROM
            Docs
        INNER JOIN #ExportObjects e
        ON
            SiteId = @SiteId AND
            e.DirName = Docs.DirName AND
            e.LeafName = Docs.LeafName AND
            Docs.Type = 2
        WHERE
            e.Level = @Level AND
            (e.Type = 2 OR
             e.Type = 6) AND
            e.IsDeleted = 0 AND
            e.IsLink = @LinksOnly AND
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects existing
                WHERE
                    Docs.WebId = existing.Id)
        SET @ErrorSave = @@ERROR
        IF @ErrorSave <> 0
            RETURN @ErrorSave
        INSERT INTO #ExportObjects(
            Id,
            Level,
            Type,
            ParentId,
            ParentWebId)
        SELECT
            NEWID(),
            @Level + 1,
            9,
            e.Id,
            e.Id
        FROM #ExportObjects e
        WHERE
            e.Level = @Level AND
            e.Type = 1 AND
            e.IsDeleted = 0 AND
            e.IsLink = @LinksOnly AND
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects existing
                WHERE
                    existing.Type = 9 AND
                    existing.ParentId = e.Id)
        SET @ErrorSave = @@ERROR
        IF @ErrorSave <> 0
            RETURN @ErrorSave
        INSERT INTO #ExportObjects(
            Id,
            Level,
            Type,
            ParentId,
            ParentWebId)
        SELECT
            NEWID(),
            @Level+1,
            15,
            e.Id,
            e.Id
        FROM #ExportObjects e
        WHERE
            e.Level = @Level AND
            e.Type = 1 AND
            e.IsDeleted = 0 AND
            e.IsLink = @LinksOnly AND
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects existing
                WHERE
                    existing.Type = 15 AND
                    existing.ParentId = e.Id)
        SET @ErrorSave = @@ERROR
        IF @ErrorSave <> 0
            RETURN @ErrorSave
        INSERT INTO #ExportObjects(
            Id,
            Level,
            Type,
            ParentId,
            ParentWebId)
        SELECT
            NEWID(),
            @Level+1,
            17,
            e.Id,
            e.Id
        FROM #ExportObjects e
        WHERE
            e.Level = @Level AND
            e.Type = 1 AND
            e.IsDeleted = 0 AND
            e.IsLink = @LinksOnly AND
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects existing
                WHERE
                    existing.Type = 17 AND
                    existing.ParentId = e.Id)
        SET @ErrorSave = @@ERROR
        IF @ErrorSave <> 0
            RETURN @ErrorSave
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
            ContentTypeId)
        SELECT DISTINCT
            NEWID(),
            CASE
                WHEN ct.Class = 1 THEN 8
                ELSE 10
            END,
            @Level + 1,
            ct.Scope,
            '',
            Webs.Id,
            Webs.Id,
            0,
            @LinksOnly,
            ct.Scope,
            ct.ContentTypeId
        FROM
            ContentTypes ct
        INNER JOIN
            Webs
        ON
            ct.SiteId = @SiteId AND
            ct.Scope = Webs.FullUrl AND
            ct.Class is not null       
        INNER JOIN #ExportObjects e
        ON
            Webs.Id = e.Id AND
            e.Level = @Level AND
            e.Type = 1 AND
            e.IsDeleted = 0 AND
            e.IsLink = @LinksOnly
        WHERE NOT EXISTS (
            SELECT 1
            FROM #ExportObjects existing
            WHERE
                ct.ContentTypeId = existing.ContentTypeId)
        SET @ErrorSave = @@ERROR
        IF @ErrorSave <> 0
            RETURN @ErrorSave
        INSERT INTO #ExportObjects(
            Id,
            Level,
            DirName,
            LeafName,
            Type,
            ParentId,
            ParentWebId,
            IncludeDescendants,
            IsLink,
            FullUrl)
        SELECT
            Lists.tp_ID,
            @Level + 1,
            e.DirName,
            e.LeafName,
            3,
            Lists.tp_WebId,
            Lists.tp_WebId,
            2,
            @LinksOnly,
            e.FullUrl
        FROM
            Lists
        INNER JOIN #ExportObjects e
        ON
            Lists.tp_RootFolder = e.Id AND
            Lists.tp_WebId = e.ParentWebId
        WHERE
            e.Level = @Level AND
            (e.Type = 2 OR
             e.Type = 6) AND
            e.IsDeleted = 0 AND
            e.IsLink = @LinksOnly AND
            Lists.tp_Id <> @SkipUserInfoListId AND
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects existing
                WHERE
                    Lists.tp_ID = existing.Id)
        SET @ErrorSave = @@ERROR
        IF @ErrorSave <> 0
            RETURN @ErrorSave
        INSERT INTO #ExportObjects(
            Id,
            Level,
            DirName,
            LeafName,
            Type,
            ParentId,
            ParentWebId,
            IncludeDescendants,
            IsLink,
            FullUrl)
        SELECT DISTINCT
            NEWID(),
            @Level + 1,
            ud.tp_DirName,
            ud.tp_LeafName,
            4,
            ud.tp_ListId,
            e.ParentWebId,
            e.IncludeDescendants,
            @LinksOnly,
            CASE
                WHEN (DATALENGTH(ud.tp_DirName) = 0) THEN ud.tp_LeafName
                WHEN (DATALENGTH(ud.tp_LeafName) = 0) THEN ud.tp_DirName
                ELSE ud.tp_DirName + N'/' + ud.tp_LeafName
            END
        FROM #ExportObjects e
        INNER JOIN
            UserData ud
        ON
            e.DirName = ud.tp_DirName AND
            e.LeafName = ud.tp_LeafName AND
            ud.tp_RowOrdinal = 0 AND
            ud.tp_Level <> 255 AND
            e.Level = @Level + 1 AND
            (e.Type = 5 OR e.Type = 7 OR
             e.Type = 6
            ) AND
            e.IsDeleted = 0 AND
            e.IsLink = @LinksOnly AND
            ((@IsMajorFileOnly = 1 AND ud.tp_Level=1) OR
             (@IsMajorFileOnly = 0 AND ud.tp_Level IN
                (SELECT TOP 1 d2.tp_Level FROM UserData d2
                    WHERE
                        ud.tp_SiteId = @SiteId AND
                        d2.tp_SiteId = ud.tp_SiteId AND
                        d2.tp_DirName = ud.tp_DirName AND
                        d2.tp_LeafName = ud.tp_LeafName AND
                        d2.tp_Level <> 255))) AND
            ud.tp_SiteId = @SiteId
        WHERE
            NOT EXISTS (
                SELECT 1
                FROM #ExportObjects existing
                WHERE
                    ud.tp_DirName = existing.DirName AND
                    ud.tp_LeafName = existing.LeafName AND
                    ud.tp_SiteId = @SiteId AND
                    existing.Type = 4) 
        SET @ErrorSave = @@ERROR
        IF @ErrorSave <> 0
            RETURN @ErrorSave
        SET @Level = @Level + 1
    END
    RETURN 0

GO
