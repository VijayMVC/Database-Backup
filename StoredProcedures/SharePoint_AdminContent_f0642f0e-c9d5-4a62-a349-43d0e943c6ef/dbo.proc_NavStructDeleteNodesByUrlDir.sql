/****** Object:  StoredProcedure [dbo].[proc_NavStructDeleteNodesByUrlDir]    Script Date: 5/15/2018 12:12:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_NavStructDeleteNodesByUrlDir(
    @SiteId uniqueidentifier,
    @UrlDir nvarchar(256),
    @UrlLeaf nvarchar(128),
    @Url nvarchar(1024),
    @UrlLike nvarchar(1024))
AS
    SET NOCOUNT ON
    DECLARE @DeletedParentEids table (
        Eid int,
        EidParent int,
        RankChild int,
        WebId uniqueidentifier,
        UNIQUE(EidParent, RankChild, WebId))
    DECLARE @InitalRows int
    SET @InitalRows = 0
    IF @UrlLike IS NOT NULL
    BEGIN
        INSERT INTO @DeletedParentEids (Eid, EidParent, RankChild, WebId)
            SELECT
                NavNodes.Eid,
                NavNodes.EidParent,
                NavNodes.RankChild,
                NavNodes.WebId
            FROM
                NavNodes
            INNER JOIN
                Docs WITH (NOLOCK)
            ON
                Docs.SiteId = NavNodes.SiteId AND
                Docs.Id = NavNodes.DocId
            WHERE
                Docs.SiteId = @SiteId AND
                (Docs.DirName = @Url OR
                    Docs.DirName LIKE @UrlLike) AND
                Docs.IsCurrentVersion = 1
        SET @InitalRows = @@ROWCOUNT
    END
    INSERT INTO @DeletedParentEids (Eid, EidParent, RankChild, WebId)
        SELECT
            NavNodes.Eid,
            NavNodes.EidParent,
            NavNodes.RankChild,
            NavNodes.WebId
        FROM
            NavNodes
        INNER JOIN
            Docs WITH (NOLOCK)
        ON
            Docs.SiteId = NavNodes.SiteId AND
            Docs.Id = NavNodes.DocId
        WHERE
            Docs.SiteId = @SiteId AND
            Docs.DirName = @UrlDir AND
            Docs.LeafName = @UrlLeaf AND
            Docs.IsCurrentVersion = 1            
    SET @InitalRows = @@ROWCOUNT + @InitalRows
    IF @InitalRows = 0
    BEGIN
        RETURN 0
    END
    DECLARE @DeletedEids TABLE ( Eid int, WebId uniqueidentifier, EidParent int, NavCacheMask int, DocId uniqueidentifier NULL, Stage tinyint, UNIQUE(WebId, Eid, Stage))
    INSERT INTO @DeletedEids (
        Eid,
        WebId,
        EidParent,
        NavCacheMask,
        DocId,
        Stage)
        SELECT
            Eid,
            WebId,
            EidParent,
            dbo.fn_NavCacheMask(EidParent),
            NULL, 
            0
        FROM
            @DeletedParentEids
    WHILE @@RowCount > 0
    BEGIN
        INSERT INTO @DeletedEids (
            Eid,
            WebId,
            EidParent,
            NavCacheMask,
            DocId,
            Stage)
            SELECT
                NavNodes.Eid,
                NavNodes.WebId,
                NavNodes.EidParent,
                dbo.fn_NavCacheMask(NavNodes.EidParent),
                NavNodes.DocId,
                0
            FROM
                NavNodes
            INNER JOIN
                @DeletedEids Deleted1
            ON
                NavNodes.WebId = Deleted1.WebId AND
                NavNodes.EidParent = Deleted1.Eid
            LEFT OUTER JOIN
                @DeletedEids Deleted2
            ON
                NavNodes.Eid = Deleted2.Eid AND
                NavNodes.WebId = Deleted2.WebId
            WHERE
                NavNodes.SiteId = @SiteId AND
                Deleted2.Eid IS NULL
    END
    DECLARE @WebCount int SELECT @WebCount = COUNT(*) FROM Webs WITH (UPDLOCK) WHERE Webs.Id IN (SELECT WebId FROM @DeletedEids) OR (Webs.NavParentWebId IN (SELECT WebId FROM @DeletedEids))
    DELETE
        NavNodes
    FROM
        NavNodes, @DeletedEids Deleted
    WHERE
        NavNodes.SiteId = @SiteId AND
        NavNodes.WebId = Deleted.WebId AND
        NavNodes.Eid = Deleted.Eid
    DECLARE @Now datetime
    SET @Now = GETUTCDATE()
    INSERT INTO EventCache(
        EventTime, 
        SiteId, 
        WebId,
        ListId,
        ItemId,
        DocId,
        Guid0,
        Int0,
        ItemFullUrl,
        EventType,
        ObjectType,
        TimeLastModified)
    SELECT DISTINCT
        @Now,
        @SiteId,
        WebId,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        134217728,
        4,
        @Now
    FROM
        @DeletedEids
    UPDATE
        NavNodes
    SET
        NumChildren = NumChildren - (
        SELECT
            COUNT(*)
        FROM
            @DeletedParentEids DeletedParents
        WHERE
            DeletedParents.WebId = NavNodes.WebId AND
            DeletedParents.EidParent = NavNodes.Eid)
    FROM
        NavNodes
    INNER JOIN
        @DeletedParentEids DeletedParents
    ON
        NavNodes.WebId = DeletedParents.WebId AND
        NavNodes.Eid = DeletedParents.EidParent
    WHERE
        NavNodes.SiteId = @SiteId
    UPDATE
        NavNodes
    SET
        RankChild = NavNodes.RankChild - (
        SELECT
            COUNT(*)
        FROM
            @DeletedParentEids DeletedParents
        WHERE
            DeletedParents.WebId = NavNodes.WebId AND
            DeletedParents.EidParent = NavNodes.EidParent AND
            DeletedParents.RankChild < NavNodes.RankChild)
    FROM
        NavNodes
    INNER JOIN
        @DeletedParentEids DeletedParents
    ON
        NavNodes.WebId = DeletedParents.WebId AND
        NavNodes.EidParent = DeletedParents.EidParent
    WHERE
        NavNodes.SiteId = @SiteId
    DECLARE @DepList table (DocUrl nvarchar(260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL, Level tinyint DEFAULT 1 NOT NULL, DirName AS ISNULL(CASE WHEN (CHARINDEX(N'/', REVERSE(DocUrl)) > 0) THEN LEFT(DocUrl, DATALENGTH(DocUrl)/2 - CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN)) ELSE N'' END, N''), LeafName AS ISNULL(CASE WHEN (CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN) > 0) THEN RIGHT(DocUrl, CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN) - 1) ELSE DocUrl END, DocUrl), UNIQUE (DocUrl,Level)) INSERT INTO @DepList (DocUrl,Level) SELECT DISTINCT Deps.FullUrl,Deps.Level FROM Deps INNER JOIN @DeletedEids DeletedEids ON Deps.DepDesc = N'P:C|' + CAST(DeletedEids.EidParent AS nvarchar(32)) WHERE Deps.SiteId = @SiteId AND Deps.DeleteTransactionId = '00000000-0000-0000-0000-000000000000' AND Deps.DepType = 4 UPDATE Webs SET CachedNavDirty = 1 WHERE Webs.Id IN (SELECT WebId FROM @DeletedEids) OR (Webs.NavParentWebId IN (SELECT WebId FROM @DeletedEids)) DECLARE @IterCount int SELECT @IterCount = 0 WHILE @IterCount < 32 BEGIN INSERT INTO @DepList (DocUrl, Level) SELECT DISTINCT Deps.FullUrl,Deps.Level FROM @DepList DepList1 INNER JOIN Deps ON Deps.DepType = 1 AND Deps.DepDesc = DepList1.DocUrl AND DepList1.Level = 1 LEFT OUTER JOIN @DepList DepList2 ON DepList2.DocUrl = Deps.FullUrl WHERE Deps.SiteId = @SiteId AND Deps.DeleteTransactionId = 0x AND DepList2.DocUrl IS NULL IF @@RowCount = 0 BREAK SELECT @IterCount = @IterCount + 1 END IF @IterCount >= 32 BEGIN INSERT INTO @DepList (DocUrl,Level) SELECT DISTINCT FullUrl,Level FROM Deps WHERE DepType = 1 AND SiteId = @SiteId AND DeleteTransactionId = 0x AND FullUrl NOT IN (SELECT DocUrl FROM @DepList) END UPDATE Docs SET Docs.Dirty = 1, Docs.CacheParseId = NULL FROM Docs INNER JOIN @DepList DepList1 ON Docs.SiteId = @SiteId AND Docs.DirName = DepList1.DirName AND Docs.LeafName = DepList1.LeafName AND Docs.Level = DepList1.Level
    DELETE Deps FROM Deps, @DeletedEids DeletedEids WHERE SiteId = @SiteId AND DeleteTransactionId = '00000000-0000-0000-0000-000000000000' AND DepType = 4 AND Deps.DepDesc = N'P:C|' + CAST(DeletedEids.Eid AS nvarchar(32))
    UPDATE
        Docs
    SET
        Docs.Dirty = 1,
        Docs.CacheParseId = NULL
    FROM
        Docs
    INNER JOIN
        @DeletedEids DeletedEids
    ON
        Docs.Id = DeletedEids.DocId
    WHERE
        Docs.HasStream = 1
    UPDATE
        Docs
    SET
        Docs.Dirty = 1,
        Docs.CacheParseId = NULL
    FROM
        Docs
    INNER JOIN
        NavNodes
    ON
        Docs.Id = NavNodes.DocId
    INNER JOIN
        @DeletedParentEids DeletedParents
    ON
        DeletedParents.EidParent = NavNodes.Eid AND
        DeletedParents.WebId = NavNodes.WebId
    WHERE
        NavNodes.SiteId = @SiteId AND
        Docs.HasStream = 1
    UPDATE
        Docs
    SET
        Docs.Dirty = 1,
        Docs.CacheParseId = NULL
    FROM
        Docs
    INNER JOIN
        NavNodes
    ON
        Docs.Id = NavNodes.DocId
    INNER JOIN
        @DeletedParentEids DeletedParents
    ON
        DeletedParents.EidParent = NavNodes.EidParent AND
        DeletedParents.WebId = NavNodes.WebId
    WHERE
        NavNodes.SiteId = @SiteId AND
        Docs.HasStream = 1
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, 0, 1

GO
