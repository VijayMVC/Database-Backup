/****** Object:  StoredProcedure [dbo].[proc_DirtyDependents]    Script Date: 5/15/2018 12:11:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DirtyDependents(
    @SiteId uniqueidentifier,
    @DepType tinyint,
    @DepDesc nvarchar(270),
    @DepDescLike nvarchar(260) = NULL)
AS
    SET NOCOUNT ON
    IF @DepDesc IS NOT NULL
    BEGIN
        IF NOT EXISTS (
            SELECT 
                * 
            FROM 
                Deps
            WHERE
                SiteId = @SiteId AND
                DeleteTransactionId = 0x AND
                DepType = @DepType AND
                DepDesc = @DepDesc)
        BEGIN
            RETURN 0
        END       
    END
    DECLARE @DepList table (DocUrl nvarchar(260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL, Level tinyint DEFAULT 1 NOT NULL, DirName AS ISNULL(CASE WHEN (CHARINDEX(N'/', REVERSE(DocUrl)) > 0) THEN LEFT(DocUrl, DATALENGTH(DocUrl)/2 - CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN)) ELSE N'' END, N''), LeafName AS ISNULL(CASE WHEN (CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN) > 0) THEN RIGHT(DocUrl, CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN) - 1) ELSE DocUrl END, DocUrl), UNIQUE (DocUrl,Level))
    IF @DepDesc IS NOT NULL
    BEGIN
        INSERT INTO @DepList (DocUrl,Level)
        SELECT
            FullUrl,
            Level
        FROM
            Deps
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = 0x AND
            DepType = @DepType AND
            DepDesc = @DepDesc
    END
    ELSE
    BEGIN
        INSERT INTO @DepList (DocUrl,Level)
        SELECT DISTINCT
            FullUrl,
            Level
        FROM
            Deps
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = 0x AND
            (DepType = @DepType OR
                DepType LIKE @DepDescLike)
        IF @@RowCount = 0
            RETURN 0
    END
    DECLARE @IterCount int SELECT @IterCount = 0 WHILE @IterCount < 32 BEGIN INSERT INTO @DepList (DocUrl, Level) SELECT DISTINCT Deps.FullUrl,Deps.Level FROM @DepList DepList1 INNER JOIN Deps ON Deps.DepType = 1 AND Deps.DepDesc = DepList1.DocUrl AND DepList1.Level = 1 LEFT OUTER JOIN @DepList DepList2 ON DepList2.DocUrl = Deps.FullUrl WHERE Deps.SiteId = @SiteId AND Deps.DeleteTransactionId = 0x AND DepList2.DocUrl IS NULL IF @@RowCount = 0 BREAK SELECT @IterCount = @IterCount + 1 END IF @IterCount >= 32 BEGIN INSERT INTO @DepList (DocUrl,Level) SELECT DISTINCT FullUrl,Level FROM Deps WHERE DepType = 1 AND SiteId = @SiteId AND DeleteTransactionId = 0x AND FullUrl NOT IN (SELECT DocUrl FROM @DepList) END UPDATE Docs SET Docs.Dirty = 1, Docs.CacheParseId = NULL FROM Docs INNER JOIN @DepList DepList1 ON Docs.SiteId = @SiteId AND Docs.DirName = DepList1.DirName AND Docs.LeafName = DepList1.LeafName AND Docs.Level = DepList1.Level
    RETURN 0

GO
