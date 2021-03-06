/****** Object:  StoredProcedure [dbo].[proc_ListAllFileUrls]    Script Date: 5/15/2018 12:12:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ListAllFileUrls(
    @SiteId uniqueidentifier,
    @WebUrl nvarchar(260),
    @IncludeGhosts bit)
AS
    SET NOCOUNT ON
    DECLARE @WebId uniqueidentifier
    DECLARE @WebDirName nvarchar(256)
    DECLARE @WebLeafName nvarchar(128)
    EXEC proc_SplitUrl @WebUrl, @WebDirName OUTPUT, @WebLeafName OUTPUT
    SELECT
        @WebId = WebId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @WebDirName AND
        LeafName = @WebLeafName AND
        Type = 2
    IF @WebId IS NULL
    BEGIN
        RETURN 3
    END
    IF NOT EXISTS (
        SELECT
            *
        FROM
            Webs (NOLOCK)
        WHERE
            SiteId = @SiteId AND
            ParentWebId = @WebId)
    BEGIN
        IF (DATALENGTH(@WebUrl) = 0)
        BEGIN
            SELECT
                DirName,
                LeafName
            FROM
                Docs WITH (NOLOCK)
            WHERE
                Docs.SiteId = @SiteId AND
                Docs.WebId = @WebId AND
                Docs.Type = 0 AND
                Docs.IsCurrentVersion = 1 AND
                (@IncludeGhosts = 1 OR Docs.HasStream = 1)
        END
        ELSE
        BEGIN
            DECLARE @UrlLike nvarchar(1024)
            EXEC proc_EscapeForLike @WebUrl, @UrlLike OUTPUT
            SELECT
                DirName,
                LeafName
            FROM
                Docs WITH (NOLOCK)
            WHERE
                Docs.SiteId = @SiteId AND
                (Docs.DirName = @WebUrl OR
                    Docs.DirName LIKE @UrlLike) AND
                Docs.WebId = @WebId AND
                Docs.Type = 0 AND
                Docs.IsCurrentVersion = 1 AND
                (@IncludeGhosts = 1 OR Docs.HasStream = 1)
        END
        RETURN 0
    END
    DECLARE @DirList table (
        Id int IDENTITY PRIMARY KEY NOT NULL,
        FullUrl nvarchar(260)
            COLLATE Latin1_General_CI_AS_KS_WS NOT NULL)
    INSERT INTO @DirList(
        FullUrl)
    VALUES(
        CASE WHEN (DATALENGTH(@WebDirName) = 0) THEN @WebLeafName WHEN (DATALENGTH(@WebLeafName) = 0) THEN @WebDirName ELSE @WebDirName + N'/' + @WebLeafName END)
    DECLARE @ix int
    SET @ix = 0
    DECLARE @previx int
    SET @previx = 1
    DECLARE @rc int
    WHILE 1 = 1
    BEGIN
        INSERT INTO @DirList(
            FullUrl)               
        SELECT
            CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
        FROM
            Docs (NOLOCK)
        WHERE
            SiteId = @SiteId AND
            DirName IN (
                SELECT
                    FullUrl
                FROM
                    @DirList
                WHERE
                    Id > @ix) AND
            Type = 1
        SET @rc = @@ROWCOUNT
        IF @rc = 0
        BEGIN
            BREAK
        END
        SET @ix = @ix + @previx
        SET @previx = @rc
    END
    SELECT
        Docs.DirName,
        Docs.LeafName
    FROM
        Docs (NOLOCK)
    INNER JOIN
        @DirList DL
    ON
        Docs.DirName = DL.FullUrl 
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.Type = 0 AND
        (@IncludeGhosts = 1 OR Docs.HasStream = 1)
    RETURN 0

GO
