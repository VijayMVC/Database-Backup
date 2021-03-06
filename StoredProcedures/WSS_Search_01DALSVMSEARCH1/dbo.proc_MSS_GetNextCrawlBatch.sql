/****** Object:  StoredProcedure [dbo].[proc_MSS_GetNextCrawlBatch]    Script Date: 5/15/2018 12:13:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetNextCrawlBatch
@ProjectID int,
@CrawlID int,
@BatchSize int,
@FolderHighPriorityTransactions int
AS
Declare 
@BatchID int,
@Stmt nvarchar(4000),
@PARAM nvarchar(4000),
@Remain int
DECLARE @ITEMTYPE_INVALIDLINK int SET @ITEMTYPE_INVALIDLINK = 0 DECLARE @ITEMTYPE_STARTADDRESS int SET @ITEMTYPE_STARTADDRESS = 1 DECLARE @ITEMTYPE_LINK int SET @ITEMTYPE_LINK = 2 DECLARE @ITEMTYPE_COMMITTED int SET @ITEMTYPE_COMMITTED = 3 DECLARE @ITEMTYPE_ANCHORNEWLINK int SET @ITEMTYPE_ANCHORNEWLINK = 4 DECLARE @ITEMTYPE_ANCHORCOMMITTED int SET @ITEMTYPE_ANCHORCOMMITTED = 5 DECLARE @ITEMTYPE_ANCHORNOCRAWL int SET @ITEMTYPE_ANCHORNOCRAWL = 6
DECLARE @PORTAL_CONTENT int SET @PORTAL_CONTENT = 1 DECLARE @ANCHORPROJECT int SET @ANCHORPROJECT = 2 DECLARE @PROFILEIMPORT int SET @PROFILEIMPORT = 3
SET NOCOUNT ON
SET @Remain = 0
SET XACT_ABORT ON
BEGIN TRANSACTION
INSERT INTO MSSBatchHistory (CrawlID) VALUES (@CrawlID)
SELECT @BatchID = @@IDENTITY
IF @ProjectID != @ANCHORPROJECT 
BEGIN
    DECLARE @RowsInQueue int
    SELECT @RowsInQueue = COUNT(*) FROM MSSCrawlQueue WHERE BatchID = 0 AND CrawlID = @CrawlID
    DECLARE @RowsInBatch INT
    SET @RowsInBatch = 0
    IF @RowsInQueue > 0
    BEGIN
        SELECT @Stmt = N' UPDATE MSSCrawlQueue SET BatchID = @BatchID, Priority = 1
                        FROM MSSCrawlQueue A
                        INNER JOIN ( 
                            SELECT TOP ' +  Cast(@BatchSize as NVARCHAR(15)) + ' CrawlID, FolderHighPriority, ItemHighPriority, SeqID 
                            FROM MSSCrawlQueue  
                            WHERE CrawlID = @CrawlID 
                            AND FolderHighPriority = 0 
                            AND ItemHighPriority = 1
                            AND BatchID = 0 
                            ORDER BY SEQID ) AS  B
                        ON A.CrawlID = B.CrawlID AND A.FolderHighPriority = B.FolderHighPriority AND A.ItemHighPriority = B.ItemHighPriority AND A.SeqID = B.SeqID '
        SELECT @PARAM = N'@BatchID int,  @CrawlID int'
        EXEC SP_EXECUTESQL  @Stmt, @PARAM, @BatchID,  @CrawlID
        SELECT @RowsInBatch = @@ROWCOUNT
        SELECT @Remain = @BatchSize - @RowsInBatch
        IF @Remain > 0 AND @FolderHighPriorityTransactions > 0
        BEGIN
            DECLARE @Folders int
            IF @Remain < @FolderHighPriorityTransactions
                SET @Folders = @Remain
            ELSE
                SET @Folders = @FolderHighPriorityTransactions
            SELECT @Stmt = N' UPDATE MSSCrawlQueue SET BatchID = @BatchID, Priority = 3
                        FROM MSSCrawlQueue A
                        INNER JOIN ( 
                            SELECT TOP ' +  Cast(@Folders as NVARCHAR(15)) + ' CrawlID, FolderHighPriority, ItemHighPriority, SeqID 
                            FROM MSSCrawlQueue  
                            WHERE CrawlID = @CrawlID 
                            AND FolderHighPriority = 1 
                            AND ItemHighPriority = 0
                            AND BatchID = 0 
                            ORDER BY SEQID ) AS  B
                        ON A.CrawlID = B.CrawlID AND A.FolderHighPriority = B.FolderHighPriority AND A.ItemHighPriority = B.ItemHighPriority AND A.SeqID = B.SeqID '
            SELECT @PARAM = N'@BatchID int,  @CrawlID int'
            EXEC SP_EXECUTESQL  @Stmt, @PARAM, @BatchID,  @CrawlID
            SELECT @RowsInBatch = @RowsInBatch + @@ROWCOUNT
            SELECT @Remain = @BatchSize - @RowsInBatch
        END
        IF @Remain > 0
        BEGIN
            SELECT @Stmt = N' UPDATE MSSCrawlQueue SET BatchID = @BatchID, Priority = 2
                        FROM MSSCrawlQueue A
                        INNER JOIN ( 
                            SELECT TOP ' +  Cast(@Remain as NVARCHAR(15)) + ' CrawlID, FolderHighPriority, ItemHighPriority, SeqID 
                            FROM MSSCrawlQueue  
                            WHERE CrawlID = @CrawlID 
                            AND ((FolderHighPriority = 0 AND ItemHighPriority = 0) OR (FolderHighPriority = 1 AND ItemHighPriority = 1))
                            AND BatchID = 0 
                            ORDER BY SEQID ) AS  B
                        ON A.CrawlID = B.CrawlID AND A.FolderHighPriority = B.FolderHighPriority AND A.ItemHighPriority = B.ItemHighPriority AND A.SeqID = B.SeqID '
            SELECT @PARAM = N'@BatchID int,  @CrawlID int'
            EXEC SP_EXECUTESQL  @Stmt, @PARAM, @BatchID,  @CrawlID
            SELECT @RowsInBatch = @RowsInBatch + @@ROWCOUNT            
        END
    END
    DECLARE @RowsReturnedInBatch INT
    SELECT A.CrawlID,
            A.SourceDocID,
            A.DocID,
            B.DisplayURL,
            B.AccessURL,
            B.CompactURL,
            B.EndPathFlag,
            A.StartAddressID,
            A.HostDepth,
            A.EnumerationDepth,
            A.TransactionFlags,
            MD5,
            PropMD5, 
            UseChangeLog,
            IndexType, 
            LastModifiedTime,
            FolderDelCount,
            CONVERT(bigint, 0),
            CONVERT(bigint, 0),
            0,
            0,
            TransactionType,
            LCID,
            ItemType,
            A.FolderHighPriority,
            A.ItemHighPriority,
            A.SeqID,
            B.ChangeLogCookie,
            ChangeLogBatchID,
            SCOPE,
            B.DocPropsMD5,
            B.Retry
        FROM MSSCrawlQueue A
        INNER JOIN MSSCrawlURL B WITH(NOLOCK)
            ON A.DocID = B.DocID
        WHERE A.CrawlID = @CrawlID AND A.BatchID = @BatchID
        ORDER BY Priority
    SELECT @RowsReturnedInBatch = @@ROWCOUNT    
    IF @RowsInBatch > 0 AND @RowsInBatch <> @RowsReturnedInBatch
    BEGIN
        DELETE FROM MSSCrawlQueue WHERE CrawlId = @CrawlId AND BatchId = @BatchId
    END
END
ELSE
BEGIN
	DELETE MSSCrawlQueue 
	WHERE DocID in (SELECT DocID FROM MSSAnchorTransactions)
	AND CrawlID = @CrawlID
	TRUNCATE TABLE MSSAnchorTransactions
    SET @Remain = @BatchSize 
    SELECT @Stmt = N' UPDATE MSSCrawlQueue SET BatchID = @BatchID, Priority = 2
                FROM MSSCrawlQueue A
                INNER JOIN ( 
                    SELECT TOP ' +  Cast(@Remain as NVARCHAR(15)) + '  CrawlID, FolderHighPriority, ItemHighPriority, SeqID
                    FROM MSSCrawlQueue
                    WHERE CrawlID = @CrawlID 
                    AND BatchID = 0 
                    ORDER BY SEQID ) AS  B
                ON A.CrawlID = B.CrawlID AND A.FolderHighPriority = B.FolderHighPriority AND A.ItemHighPriority = B.ItemHighPriority AND A.SeqID = B.SeqID '
    SELECT @PARAM = N'@BatchID int,  @CrawlID int'
    EXEC SP_EXECUTESQL  @Stmt, @PARAM, @BatchID,  @CrawlID
    SELECT CrawlID,
        SourceDocID,
        DocID,
        NULL,
        NULL,
        NULL,
        0,
        StartAddressID,
        HostDepth,
        EnumerationDepth,
        TransactionFlags,
        0, 
        0, 
        0, 
        1, 
        CONVERT(bigint, 0), 
        0, 
        CONVERT(bigint, 0), 
        CONVERT(bigint, 0), 
        0, 
        0, 
        TransactionType,
        0, 
        ItemType,
        FolderHighPriority,
        ItemHighPriority,
        SeqID,
        NULL, 
        ChangeLogBatchID,
        SCOPE,
        CONVERT(bigint, 0),
        0
    FROM MSSCrawlQueue
    WHERE CrawlID = @CrawlID AND BatchID = @BatchID AND (ItemType = @ITEMTYPE_ANCHORNEWLINK or ItemType = @ITEMTYPE_ANCHORCOMMITTED)
    UNION
    SELECT A.CrawlID,
        A.SourceDocID,
        A.DocID,
        B.DisplayURL,
        B.AccessURL,
        B.CompactURL,
        B.EndPathFlag,
        A.StartAddressID,
        A.HostDepth,
        A.EnumerationDepth,
        A.TransactionFlags,
        MD5,
        PropMD5, 
        UseChangeLog,
        IndexType, 
        LastModifiedTime,
        FolderDelCount,
        CONVERT(bigint, 0),
        CONVERT(bigint, 0),
        0,
        0,
        TransactionType,
        LCID,
        ItemType,
        A.FolderHighPriority,
        A.ItemHighPriority,
        A.SeqID,
        B.ChangeLogCookie,
        ChangeLogBatchID,
        SCOPE,
        CONVERT(bigint, 0),
        B.Retry
    FROM MSSCrawlQueue A
        INNER JOIN MSSCrawlURL B WITH(NOLOCK)
        ON A.DocID = B.DocID
    WHERE A.CrawlID = @CrawlID AND A.BatchID = @BatchID AND ItemType <> @ITEMTYPE_ANCHORNEWLINK AND ItemType <> @ITEMTYPE_ANCHORCOMMITTED
END
COMMIT TRANSACTION
RETURN 1

GO
