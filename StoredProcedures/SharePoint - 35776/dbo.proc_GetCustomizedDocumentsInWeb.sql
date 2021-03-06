/****** Object:  StoredProcedure [dbo].[proc_GetCustomizedDocumentsInWeb]    Script Date: 5/15/2018 12:12:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetCustomizedDocumentsInWeb(
    @SiteId uniqueidentifier,
    @WebFullUrl nvarchar(260),
    @DocIdLast uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @GhostDocs TABLE(
        Id uniqueidentifier NOT NULL,
        UNIQUE (Id))
    DECLARE @Folders TABLE(
        Depth int NOT NULL,
        DirName nvarchar(256) COLLATE database_default 
            NOT NULL,
        PRIMARY KEY CLUSTERED (Depth, DirName))
    DECLARE @Depth int
    SET @Depth = 0
    INSERT INTO
        @GhostDocs
    SELECT DISTINCT
        Id
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @WebFullUrl AND
        SetupPath IS NOT NULL AND
        (DocFlags & 64) <> 0
    INSERT INTO
        @Folders
    SELECT
        @Depth,
        CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @WebFullUrl AND
        Type = 1
    WHILE (EXISTS (SELECT * FROM @Folders))
    BEGIN
        SET @Depth = @Depth + 1
        INSERT INTO
            @GhostDocs
        SELECT DISTINCT
            Docs.Id
        FROM
            @Folders AS Folders
        INNER JOIN
            Docs
        ON
            Docs.SiteId = @SiteId AND
            Docs.DirName = Folders.DirName AND
            Docs.SetupPath IS NOT NULL AND
            (Docs.DocFlags & 64) <> 0
        INSERT INTO
            @Folders
        SELECT
            @Depth,
            CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END
        FROM
            @Folders AS Folders
        INNER JOIN
            Docs
        ON
            Docs.SiteId = @SiteId AND
            Docs.DirName = Folders.DirName AND
            Docs.Type = 1
        WHERE
            Folders.Depth = (@Depth - 1)                
        DELETE
            @Folders
        WHERE
            Depth = (@Depth - 1)
    END
    SELECT TOP 1000
        GhostDocs.Id
    FROM
        @GhostDocs AS GhostDocs
    WHERE
        GhostDocs.Id > @DocIdLast
    ORDER BY
        GhostDocs.Id ASC

GO
