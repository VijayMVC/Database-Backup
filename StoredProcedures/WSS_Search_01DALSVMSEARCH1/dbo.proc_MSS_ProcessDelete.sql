/****** Object:  StoredProcedure [dbo].[proc_MSS_ProcessDelete]    Script Date: 5/15/2018 12:13:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ProcessDelete
@ProjectID int,
@ContentSourceID int,
@StartAddressID int,
@DocID int,
@CrawlID int,
@HisCrawlID int,
@HisCommitCrawlID int,
@Scope int,
@TransactionFlags int,
@UseChangeLog int, 
@ChangeLogCookie nvarchar(1000),
@ChangeLogBatchID int,
@DeleteReason int,
@TransactionType int, 
@HostDepth int, 
@EnumerationDepth int, 
@HisParentDocID int, 
@EndPathFlag int,
@HostID int,
@LCID int,
@ErrorID int,
@ErrorLevel int,
@AccessURL nvarchar(2048), 
@AccessHash int, 
@CompactURL nvarchar(40), 
@CompactHash int,
@DisplayURL nvarchar(2048), 
@DisplayHash int,
@MaxDocId int
AS
    DECLARE @ITEMTYPE_INVALIDLINK int SET @ITEMTYPE_INVALIDLINK = 0 DECLARE @ITEMTYPE_STARTADDRESS int SET @ITEMTYPE_STARTADDRESS = 1 DECLARE @ITEMTYPE_LINK int SET @ITEMTYPE_LINK = 2 DECLARE @ITEMTYPE_COMMITTED int SET @ITEMTYPE_COMMITTED = 3 DECLARE @ITEMTYPE_ANCHORNEWLINK int SET @ITEMTYPE_ANCHORNEWLINK = 4 DECLARE @ITEMTYPE_ANCHORCOMMITTED int SET @ITEMTYPE_ANCHORCOMMITTED = 5 DECLARE @ITEMTYPE_ANCHORNOCRAWL int SET @ITEMTYPE_ANCHORNOCRAWL = 6
    DECLARE @ERRORLEVEL_SUCCESS int SET @ERRORLEVEL_SUCCESS = 0 DECLARE @ERRORLEVEL_WARNING int SET @ERRORLEVEL_WARNING = 1 DECLARE @ERRORLEVEL_ERROR int SET @ERRORLEVEL_ERROR = 2
    DECLARE @GTHR_CA_ADD int SET @GTHR_CA_ADD = 0 DECLARE @GTHR_CA_DELETE int SET @GTHR_CA_DELETE = 1 DECLARE @GTHR_CA_MODIFY int SET @GTHR_CA_MODIFY = 2 DECLARE @GTHR_CA_MOVE_RENAME int SET @GTHR_CA_MOVE_RENAME = 3 
    DECLARE @SCOPE_SHALLOW int SET @SCOPE_SHALLOW = 0X0001 DECLARE @SCOPE_DEEP int SET @SCOPE_DEEP = 0X0002
    DECLARE @CRAWLTYPE_FULL int SET @CRAWLTYPE_FULL = 1 DECLARE @CRAWLTYPE_INCREMENTAL int SET @CRAWLTYPE_INCREMENTAL = 2 DECLARE @CRAWLTYPE_DELETE int SET @CRAWLTYPE_DELETE = 6 
    DECLARE @TF_DIRECTORY int SET @TF_DIRECTORY = 0x0004 DECLARE @TF_FOLLOW_DIRECTORIES int SET @TF_FOLLOW_DIRECTORIES = 0x0008 DECLARE @TF_USES_EXTENDED_DIRLINKS int SET @TF_USES_EXTENDED_DIRLINKS = 0x0200 DECLARE @TF_SITE_CONTAINER int SET @TF_SITE_CONTAINER = 0x0000400 DECLARE @TF_RARE_CRAWL int SET @TF_RARE_CRAWL = 0x0000800 DECLARE @TF_USE_LAST_MODIFIED int SET @TF_USE_LAST_MODIFIED = 0x0040 DECLARE @TF_UPDATE_SECURITY_ONLY int SET @TF_UPDATE_SECURITY_ONLY = 0x2000000
    DECLARE @DELETE_ERROR int SET @DELETE_ERROR = 1 DECLARE @DELETE_CRAWL int SET @DELETE_CRAWL = 2 DECLARE @DELETE_UNVISITED_FULL int SET @DELETE_UNVISITED_FULL = 3 DECLARE @DELETE_UNVISITED_INC int SET @DELETE_UNVISITED_INC = 4 DECLARE @DELETE_UNVISITED_LOG int SET @DELETE_UNVISITED_LOG = 5 DECLARE @DELETE_RECURSIVE int SET @DELETE_RECURSIVE = 6 DECLARE @DELETE_EXCLUDED int SET @DELETE_EXCLUDED = 7 DECLARE @DELETE_CHANGELOG int SET @DELETE_CHANGELOG = 8
    IF @Scope = @SCOPE_DEEP AND @TransactionFlags & @TF_DIRECTORY <> 0
    BEGIN
        DECLARE @RecursiveLevel int
        declare @DeleteTransaction TABLE (
                    DocID int, 
                    TransactionFlags int, 
                    HostDepth int,
                    EnumerationDepth int,
                    SourceDocID int,
                    RecursiveLevel int)
        Set @RecursiveLevel = 1
        INSERT INTO @DeleteTransaction (DocID, TransactionFlags, HostDepth, EnumerationDepth, SourceDocID, RecursiveLevel)
        SELECT DocID, TransactionFlags, HostDepth, EnumerationDepth, ParentDocID, @RecursiveLevel
        FROM MSSCrawlURL 
        WHERE ParentDocID = @DocID AND 
            ((TransactionFlags & @TF_USES_EXTENDED_DIRLINKS <> 0 AND TransactionFlags & @TF_DIRECTORY = 0) OR UseChangeLog = 1)
        IF @UseChangeLog <> 0 OR @ChangeLogCookie IS NOT NULL
        BEGIN
            WHILE @RecursiveLevel > 0 
            BEGIN
                DECLARE @RowCount int
                INSERT INTO @DeleteTransaction (DocID, TransactionFlags, HostDepth, EnumerationDepth, SourceDocID, RecursiveLevel)
                SELECT DocID, TransactionFlags, HostDepth, EnumerationDepth, ParentDocID, @RecursiveLevel + 1
                FROM MSSCrawlURL WHERE ParentDocID IN
                (SELECT DocID FROM @DeleteTransaction WHERE RecursiveLevel = @RecursiveLevel AND TransactionFlags & @TF_DIRECTORY <> 0)
                IF @@ROWCOUNT = 0
                    BREAK
                SET @RecursiveLevel =@RecursiveLevel + 1
            END
        END
        INSERT INTO MSSCrawlQueue (
                CrawlID,
                StartAddressID, 
                DocID,                  
                TransactionType,
                Scope, 
                TransactionFlags,
                HostDepth,
                EnumerationDepth,
                SourceDocID,
                ChangeLogBatchID, 
                ItemType,
                FolderHighPriority,
                ItemHighPriority,
                ProjectID,
                DeleteReason)
        SELECT @CrawlID,
                @StartAddressID,
                DocID,
                @GTHR_CA_DELETE,
                @SCOPE_SHALLOW,   
                TransactionFlags, 
                HostDepth,
                EnumerationDepth,
                SourceDocID,
                @ChangeLogBatchID,
                @ITEMTYPE_COMMITTED,
                0, 
                0, 
                @ProjectID,
                @DELETE_RECURSIVE
        FROM @DeleteTransaction
    END
    DECLARE @TrackIDDel int
    INSERT INTO MSSCrawlDeletedURL (
            StartAddressID,
            ContentSourceID,
            ProjectID,
            DocID,
            CrawlID,
            HisCrawlID,
            HisCommitCrawlID,
            AccessURL,
            AccessHash,
            CompactURL,
            CompactHash,
            DisplayURL,
            DisplayHash,
            TransactionType,
            Scope,
            TransactionFlags,
            HostDepth,
            EnumerationDepth,
            ParentDocID,
            UseChangeLog,
            ChangeLogCookie,
            EndPathFlag,
            HostID,
            LCID,
            LogTime,
            ErrorID,
            ErrorLevel,
            DeleteReason)
    VALUES (
            @StartAddressID,
            @ContentSourceID,
            @ProjectID,
            @DocID,
            @CrawlID,
            @HisCrawlID,
            @HisCommitCrawlID,
            @AccessURL,
            @AccessHash,
            @CompactURL,
            @CompactHash,
            @DisplayURL,
            @DisplayHash,
            @TransactionType,
            @Scope,
            @TransactionFlags,
            @HostDepth,
            @EnumerationDepth,
            @HisParentDocID,
            @UseChangeLog,
            @ChangeLogCookie,
            @EndPathFlag,
            @HostID,
            @LCID,
            GetDate(),
            @ErrorID,            
            @ErrorLevel,
            @DeleteReason)
    DELETE FROM MSSCrawlURL WHERE DocID = @DocID
    DELETE FROM MSSCrawlQueue WHERE DocID=@DocID AND BatchID = 0
    DECLARE @Available int
    IF @AccessUrl like 'anchorqh:%' or @AccessUrl like 'spsimport%'
        SET @Available = 2  --no neeed to stage availability of docid on the anchor text queries and import URLs
    ELSE 
        SET @Available = 0
    IF NOT EXISTS (SELECT DocID FROM MSSDocDeleteList WHERE DocID=@DocID) AND (@MaxDocId = -1 OR @DocID <= @MaxDocId)
    BEGIN
        INSERT INTO MSSDocDeleteList (DocID, CrawlId, Available) VALUES (@DocID, @CrawlID, @Available)
    END

GO
