/****** Object:  StoredProcedure [dbo].[proc_MSS_AnchorFixTargetDocid]    Script Date: 5/15/2018 12:11:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_AnchorFixTargetDocid
@CrawlId as int
WITH RECOMPILE
AS
SET NOCOUNT ON

    CREATE TABLE #ChangedSourceDocs (
        [DocId] [int] NOT NULL 
    )

    INSERT INTO #ChangedSourceDocs 
        SELECT DocId FROM MSSCrawlChangedSourceDocs WHERE CrawlId = @CrawlId

    CREATE CLUSTERED INDEX #IX_ChangedSourceDocs ON #ChangedSourceDocs ([DocId])

    CREATE TABLE [#AnchorText] (
        [SourceDocID] [int] NULL ,
        [TargetDocID] [int] NULL ,
        [LinkHash] [int] NULL ,
        [Link] [nvarchar] (2048) COLLATE database_default NULL,
        [LinkId] [int],
    ) ON [PRIMARY]

    INSERT INTO #AnchorText select SourceDocId, TargetDocId, LinkHash, Link, LinkId
        FROM MSSAnchorText
        JOIN #ChangedSourceDocs
               ON #ChangedSourceDocs.DocId = SourceDocId
    WHERE (TargetDocID = -1 or TargetDocID IS NULL)

    CREATE  INDEX [#IX_Link] ON [dbo].[#AnchorText]([LinkHash]) ON [PRIMARY]

    CREATE TABLE [#AnchorText2] (
        [SourceDocID] [int] NULL ,
        [TargetDocID] [int] NULL ,
        [LinkHash] [int] NULL ,
        [Link] [nvarchar] (2048) COLLATE database_default NULL ,
        [LinkId] [int],
    ) ON [PRIMARY]

    CREATE UNIQUE INDEX [#IX_AnchorText2_LinkId] ON [dbo].[#AnchorText2]([SourceDocID], [LinkId])  WITH  IGNORE_DUP_KEY ON [PRIMARY]

    INSERT INTO #AnchorText2
    SELECT SourceDocID,
          CASE
                WHEN TargetDocID = -1 THEN H.DocID
                ELSE TargetDocID
          END AS TargetDocID,
          LinkHash,
          Link,
          LinkId
    FROM #AnchorText A
    LEFT JOIN MSSCrawlURL H
        ON A.linkhash = H.displayHash
            AND A.link = H.displayUrl
            AND H.IndexType = 1
            AND H.crawlid = H.commitcrawlid

    DROP TABLE #AnchorText

    CREATE UNIQUE CLUSTERED INDEX [#IX_AnchorText_LinkId] ON [dbo].[#AnchorText2]([SourceDocID], [LinkId])  ON [PRIMARY]

    UPDATE MSSAnchorText 
    SET TargetDocID = T.TargetDocID
    FROM MSSAnchorText A
        JOIN #AnchorText2 T 
            ON A.SourceDocID = T.SourceDocID AND 
            A.LinkId = T.LinkId
    WHERE T.TargetDocID <> -1 and T.TargetDocID IS NOT NULL
    OPTION (MERGE JOIN)

    DROP TABLE #AnchorText2

    CREATE TABLE [#History] (
        [DocID] [int] NULL ,
        [DisplayHash] [int] NULL ,
        [DisplayURL] [nvarchar] (2048) COLLATE database_default NULL
    ) 

    INSERT INTO #History
    SELECT H.DocID, DisplayHash, DisplayURL
    FROM MSSCrawlURL H 
        JOIN #ChangedSourceDocs
            ON #ChangedSourceDocs.DocId = H.DocId
    WHERE H.IndexType = 1
        AND H.crawlid = H.commitcrawlid

    CREATE CLUSTERED INDEX [#IX_History] ON [dbo].[#History]([DisplayHash]) ON [PRIMARY]

    UPDATE MSSAnchorText 
    SET TargetDocID = H.DocID
    FROM MSSAnchorText A
        JOIN #History H 
            ON A.linkhash = H.displayHash
            AND A.link = H.displayUrl
    WHERE (A.TargetDocID = -1 or A.TargetDocID IS NULL)

    DROP TABLE #History

    UPDATE MSSAnchorText
    SET TargetDocID = H.DocID
    FROM MSSAnchorText A
        JOIN MSSCrawlURL H 
            ON A.linkhash = H.AccessHash
               AND A.link = H.AccessUrl
        JOIN #ChangedSourceDocs
               ON #ChangedSourceDocs.DocId = H.DocId
    WHERE (A.TargetDocID = -1 or A.TargetDocID IS NULL)
    AND A.AnchorText is null 

    DECLARE 
    @DisplayURL nvarchar(2048), 
    @DisplayHash int

    CREATE TABLE #DupAnchors (
        [SourceDocID] [int] NULL ,
        [TargetDocID] [int] NULL ,
        [LinkHash] [int] NULL ,
        [Link] [nvarchar] (2048) NULL ,
        [LCID] [int] NULL ,
        [AnchorText] [nvarchar] (1024) NULL ,
        [MarkDirty] [tinyint] NULL
    ) ON [PRIMARY]

    CREATE TABLE #ChangedTargetDocs (
        [DocId] [int] NOT NULL 
    )

    DECLARE DuplicateURLs CURSOR FAST_FORWARD  FOR
    SELECT distinct a.displayhash, a.displayurl from msscrawlurl a, msscrawlurl b, #ChangedSourceDocs
    WHERE 
    a.displayhash=b.displayhash
    AND a.displayurl=b.displayurl
    AND a.docid <> b.docid
    AND a.indextype=1
    AND b.indextype=1
    AND a.crawlid=a.commitcrawlid
    AND b.crawlid=b.commitcrawlid
    AND #ChangedSourceDocs.DocId = a.docid 

    OPEN DuplicateURLs 
    FETCH NEXT FROM DuplicateURLs INTO @DisplayHash, @DisplayURL

    WHILE @@FETCH_STATUS = 0 
    BEGIN
        TRUNCATE TABLE #DupAnchors
        INSERT INTO #DupAnchors(SourceDocID, TargetDocID, LinkHash, Link, LCID, AnchorText, MarkDirty)
        SELECT distinct SourceDocID, B.DocID, LinkHash, Link, A.LCID, AnchorText, MarkDirty
        FROM MSSAnchorText A, MSSCrawlURL B
        WHERE B.displayhash=@DisplayHash
            AND B.displayurl=@DisplayURL
            AND B.indextype=1
            AND B.crawlid=commitcrawlid
            AND A.linkhash=@DisplayHash
            AND A.link=@DisplayURL
            AND B.DocID not in
                (
                SELECT targetdocid 
                FROM MSSAnchorText 
                WHERE linkhash=@DisplayHash
                AND link=@DisplayURL
                AND sourcedocid=A.sourcedocid
                )

        INSERT INTO MSSAnchorText(SourceDocID, TargetDocID, LinkHash, Link, LCID, AnchorText, MarkDirty)
        SELECT SourceDocID, TargetDocID, LinkHash, Link, LCID, AnchorText, MarkDirty
            FROM #DupAnchors

        INSERT INTO #ChangedTargetDocs
        SELECT TargetDocId FROM #DupAnchors A

        FETCH NEXT FROM DuplicateURLs INTO @DisplayHash, @DisplayURL
    END

    CLOSE DuplicateURLs
    DEALLOCATE DuplicateURLs

    INSERT INTO MSSCrawlChangedTargetDocs (CrawlId, DocId)
    SELECT @CrawlId, DocID FROM #ChangedTargetDocs

    INSERT INTO MSSAnchorPendingChangeLog (CrawlId, TargetDocId)
    SELECT @CrawlId, MSSAnchorText.TargetDocId FROM MSSAnchorText 
    JOIN #ChangedSourceDocs 
        ON #ChangedSourceDocs.DocId = MSSAnchorText.SourceDocId
    WHERE MSSAnchorText.TargetDocId <> -1 

    INSERT INTO MSSAnchorPendingChangeLog (CrawlId, TargetDocId) 
    SELECT MSSCrawlChangedTargetDocs.CrawlId, DocId FROM MSSCrawlChangedTargetDocs 
    WHERE MSSCrawlChangedTargetDocs.CrawlId = @CrawlId 


GO
