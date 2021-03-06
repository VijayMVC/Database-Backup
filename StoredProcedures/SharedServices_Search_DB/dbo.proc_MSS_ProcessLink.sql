/****** Object:  StoredProcedure [dbo].[proc_MSS_ProcessLink]    Script Date: 5/15/2018 12:11:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ProcessLink
@FullIncrementalInterval int, @DeleteOnErrorInterval int,

@StartAddressID int, @ContentSourceID int, @ProjectID int,
@CrawlID int, 
@SourceDocID int, 
@ItemType int, 
@TransactionType int, 
@Scope int, 
@TransactionFlags int, 

@AccessURL nvarchar(1500), @AccessHash int, 
@CompactURL nvarchar(500), @CompactHash int, 
@ParentCompactURL nvarchar(500), @ParentCompactHash int, 
@DisplayURL nvarchar(1500), @DisplayHash int, 

@LastModifiedTime bigint, 
@EndPathFlag int, 
@PropMD5 int, 
@Host nvarchar(1000), 
@HostDepth int, 
@EnumerationDepth int, 
@IndexType int, 
@SeqID bigint, 
@LCID int,

@UseChangeLog int, 
@ChangeLogBatchID int, 
@FolderHighPriority int, 
@ItemHighPriority int, 
@ProtocolSwitch int,
@SourceIsStartAddress int,
@SourceHostHop int, 
@hrResult int, 
@Anchor nvarchar(512),
@ParentChangeLogCookie nvarchar(200)

AS
    SET NOCOUNT ON  
    DECLARE @ITEMTYPE_INVALIDLINK int SET @ITEMTYPE_INVALIDLINK = 0 DECLARE @ITEMTYPE_STARTADDRESS int SET @ITEMTYPE_STARTADDRESS = 1 DECLARE @ITEMTYPE_LINK int SET @ITEMTYPE_LINK = 2 DECLARE @ITEMTYPE_COMMITTED int SET @ITEMTYPE_COMMITTED = 3 DECLARE @ITEMTYPE_ANCHORNEWLINK int SET @ITEMTYPE_ANCHORNEWLINK = 4 DECLARE @ITEMTYPE_ANCHORCOMMITTED int SET @ITEMTYPE_ANCHORCOMMITTED = 5 DECLARE @ITEMTYPE_ANCHORNOCRAWL int SET @ITEMTYPE_ANCHORNOCRAWL = 6
    DECLARE @ERRORLEVEL_SUCCESS int SET @ERRORLEVEL_SUCCESS = 0 DECLARE @ERRORLEVEL_WARNING int SET @ERRORLEVEL_WARNING = 1 DECLARE @ERRORLEVEL_ERROR int SET @ERRORLEVEL_ERROR = 2
    DECLARE @GTHR_CA_ADD int SET @GTHR_CA_ADD = 0 DECLARE @GTHR_CA_DELETE int SET @GTHR_CA_DELETE = 1 DECLARE @GTHR_CA_MODIFY int SET @GTHR_CA_MODIFY = 2 DECLARE @GTHR_CA_MOVE_RENAME int SET @GTHR_CA_MOVE_RENAME = 3 
    DECLARE @SCOPE_SHALLOW int SET @SCOPE_SHALLOW = 0X0001 DECLARE @SCOPE_DEEP int SET @SCOPE_DEEP = 0X0002
    DECLARE @CRAWLTYPE_FULL int SET @CRAWLTYPE_FULL = 1 DECLARE @CRAWLTYPE_INCREMENTAL int SET @CRAWLTYPE_INCREMENTAL = 2 DECLARE @CRAWLTYPE_DELETE int SET @CRAWLTYPE_DELETE = 6 
    DECLARE @TF_DIRECTORY int SET @TF_DIRECTORY = 0x0004 DECLARE @TF_FOLLOW_DIRECTORIES int SET @TF_FOLLOW_DIRECTORIES = 0x0008 DECLARE @TF_USES_EXTENDED_DIRLINKS int SET @TF_USES_EXTENDED_DIRLINKS = 0x0200 DECLARE @TF_SITE_CONTAINER int SET @TF_SITE_CONTAINER = 0x0000400 DECLARE @TF_RARE_CRAWL int SET @TF_RARE_CRAWL = 0x0000800 DECLARE @TF_USE_LAST_MODIFIED int SET @TF_USE_LAST_MODIFIED = 0x0040 DECLARE @TF_UPDATE_SECURITY_ONLY int SET @TF_UPDATE_SECURITY_ONLY = 0x2000000
    DECLARE @PRTH_S_NOT_MODIFIED int SET @PRTH_S_NOT_MODIFIED = 0x41203 DECLARE @GTHR_E_URL_EXCLUDED int SET @GTHR_E_URL_EXCLUDED = 0x80040d07 DECLARE @GTHR_E_URL_EXCLUDED_DEPTH int SET @GTHR_E_URL_EXCLUDED_DEPTH = 0x80040d08 DECLARE @GTHR_S_NO_INDEX int SET @GTHR_S_NO_INDEX = 0x40D90 DECLARE @WSS_TOKEN_TOO_EARLY int SET @WSS_TOKEN_TOO_EARLY = 0x810200BC 
    DECLARE @CRAWL_ACQUIREID int SET @CRAWL_ACQUIREID = 1 DECLARE @CRAWL_STATUS_INSERTSTARTPAGE int SET @CRAWL_STATUS_INSERTSTARTPAGE = 2 DECLARE @CRAWL_STARTCHECK int SET @CRAWL_STARTCHECK = 3 DECLARE @CRAWL_STATUS_START int SET @CRAWL_STATUS_START = 4 DECLARE @CRAWL_STATUS_FORBID int SET @CRAWL_STATUS_FORBID = 5 DECLARE @CRAWL_UPDATE_SEED int SET @CRAWL_UPDATE_SEED = 6 DECLARE @CRAWL_QUERY_DONE int SET @CRAWL_QUERY_DONE = 7 DECLARE @CRAWL_STATUS_DELETEUNVISITEDITEMS int SET @CRAWL_STATUS_DELETEUNVISITEDITEMS = 8 DECLARE @CRAWL_STATUS_PAUSE int SET @CRAWL_STATUS_PAUSE = 9 DECLARE @CRAWL_STATUS_RESUME int SET @CRAWL_STATUS_RESUME =10 DECLARE @CRAWL_STATUS_DONE int SET @CRAWL_STATUS_DONE = 11 DECLARE @CRAWL_UPDATE_STOP int SET @CRAWL_UPDATE_STOP = 12 DECLARE @CRAWL_STATUS_STOP int SET @CRAWL_STATUS_STOP = 13 DECLARE @CRAWL_STATUS_RESET int SET @CRAWL_STATUS_RESET = 14 DECLARE @CRAWL_START_DELETE int SET @CRAWL_START_DELETE = 15 DECLARE @CRAWL_DELETE_CS int SET @CRAWL_DELETE_CS = 16 DECLARE @CRAWL_DELETE_SA int SET @CRAWL_DELETE_SA = 17
    DECLARE @DELETE_ERROR int SET @DELETE_ERROR = 1 DECLARE @DELETE_CRAWL int SET @DELETE_CRAWL = 2 DECLARE @DELETE_UNVISITED_FULL int SET @DELETE_UNVISITED_FULL = 3 DECLARE @DELETE_UNVISITED_INC int SET @DELETE_UNVISITED_INC = 4 DECLARE @DELETE_UNVISITED_LOG int SET @DELETE_UNVISITED_LOG = 5 DECLARE @DELETE_RECURSIVE int SET @DELETE_RECURSIVE = 6 DECLARE @DELETE_EXCLUDED int SET @DELETE_EXCLUDED = 7 DECLARE @DELETE_CHANGELOG int SET @DELETE_CHANGELOG = 8 

    DECLARE

    @DocID int,
    @HisCrawlID int,
    @HisCommitCrawlID int, 
    @HisPropMD5 int,
    @HisUseChangeLog int, 
    @HisParentDocID int,
    @HisLastModifiedTime bigint,
    @HisStartAddressID int,
    @HisLastTouchStart datetime,
    @HisTransactionFlags int,
    @HisAccessURL nvarchar(2048), 
    @HisAccessHash int, 

    @HostID int,
    @CrawlType int,
    @CrawlStatus int,

    @CreateAddModifyTransaction int,
    @CreateDeleteTransaction int,
    @Excluded int,
    @ExceededDepth int,

    @ErrorID int,
    @ErrorLevel int,
    @MarkDelete bit, 

    @TrackID bigint,
    @TrackIDLog bigint,
    @NotModifiedErrorID int,
    @NotModifiedErrorLevel int

    SET @DocID = NULL
    SET @HisCrawlID = 0 
    SET @HisUseChangeLog = 0
    SET @HisPropMd5 = 0
    SET @HisStartAddressID = 0
    SET @HisLastTouchStart = NULL
    SET @HisTransactionFlags = 0

    SET @CreateAddModifyTransaction = 0
    SET @CreateDeleteTransaction = 0
    SET @Excluded = 0
    SET @ExceededDepth = 0

    SELECT @NotModifiedErrorID = ErrorID FROM MSSCrawlErrorList WHERE hrResult = @PRTH_S_NOT_MODIFIED
    SELECT @NotModifiedErrorLevel = ErrorLevel FROM MSSCrawlErrorList WHERE hrResult = @PRTH_S_NOT_MODIFIED

    SELECT @CrawlType = CrawlType, @CrawlStatus=Status FROM MSSCrawlHistory WHERE CrawlID = @CrawlID

    IF @CrawlStatus=@CRAWL_UPDATE_STOP
        RETURN 

    IF ( @ITEMTYPE_LINK = @ItemType  AND @GTHR_CA_MOVE_RENAME = @TransactionType )
    BEGIN
        SELECT @DocID=DocID, @HisCrawlID=CrawlID, @HisCommitCrawlID=CommitCrawlID, @HisUseChangeLog=UseChangeLog, @HisParentDocID = ParentDocID,
                @HisPropMD5 = PropMD5, @HisLastModifiedTime = LastModifiedTime, @HisStartAddressID = StartAddressID, @HisTransactionFlags = TransactionFlags,
                @HisAccessURL = AccessURL, @HisAccessHash = AccessHash
        FROM MSSCrawlURL 
        WHERE CompactHash=@CompactHash AND CompactURL=@CompactURL AND DeletePending = 0

        IF @DocID IS NULL
            RETURN

        IF @HisAccessHash = @AccessHash AND @HisAccessURL = @AccessURL
        BEGIN
            SET @TransactionType = @GTHR_CA_MODIFY
            SET @Scope = @SCOPE_DEEP 
        END
        ELSE
        BEGIN
            EXEC dbo.proc_MSS_ProcessLink
                @FullIncrementalInterval, @DeleteOnErrorInterval,
                @StartAddressID, @ContentSourceID, @ProjectID, @CrawlID,  @SourceDocID, @ItemType,  @GTHR_CA_DELETE,  @Scope, @TransactionFlags, 
                @AccessURL, @AccessHash, @CompactURL, @CompactHash, @ParentCompactURL, @ParentCompactHash, @DisplayURL, @DisplayHash,
                @LastModifiedTime, @EndPathFlag, @PropMD5, @Host,	@HostDepth, @EnumerationDepth, @IndexType, @SeqID, @LCID,
                @UseChangeLog, @ChangeLogBatchID, @FolderHighPriority, @ItemHighPriority, @ProtocolSwitch, @SourceIsStartAddress, @SourceHostHop,
                @hrResult, @Anchor, @ParentChangeLogCookie

            EXEC dbo.proc_MSS_ProcessLink
                @FullIncrementalInterval, @DeleteOnErrorInterval,
                @StartAddressID, @ContentSourceID, @ProjectID, @CrawlID,  @SourceDocID, @ItemType,  @GTHR_CA_ADD,  @Scope, @TransactionFlags, 
                @AccessURL, @AccessHash, @CompactURL, @CompactHash, @ParentCompactURL, @ParentCompactHash, @DisplayURL, @DisplayHash,
                @LastModifiedTime, @EndPathFlag, @PropMD5, @Host,	@HostDepth, @EnumerationDepth, @IndexType, @SeqID, @LCID,
                @UseChangeLog, @ChangeLogBatchID, @FolderHighPriority, @ItemHighPriority, @ProtocolSwitch, @SourceIsStartAddress, @SourceHostHop,
                @hrResult, @Anchor, @ParentChangeLogCookie

            RETURN
        END
    END

    ELSE IF ( @ITEMTYPE_LINK = @ItemType  AND @GTHR_CA_DELETE = @TransactionType)
    BEGIN
        SELECT @DocID=DocID, @HisCrawlID=CrawlID, @HisCommitCrawlID=CommitCrawlID, @HisUseChangeLog=UseChangeLog, @HisParentDocID = ParentDocID,
                @HisPropMD5 = PropMD5, @HisLastModifiedTime = LastModifiedTime, @HisStartAddressID = StartAddressID, @HisTransactionFlags = TransactionFlags, @HisLastTouchStart = LastTouchStart,
                @AccessURL = AccessURL, @AccessHash = AccessHash, @DisplayURL = DisplayURL, @DisplayHash = DisplayHash
        FROM MSSCrawlURL 
        WHERE CompactHash=@CompactHash AND CompactURL=@CompactURL AND DeletePending = 0

        IF @DocID IS NULL
            RETURN
    END

    ELSE 
    BEGIN

        SELECT @DocID=DocID, @HisCrawlID=CrawlID, @HisCommitCrawlID=CommitCrawlID, @HisUseChangeLog=UseChangeLog, @HisParentDocID = ParentDocID,
                @HisPropMD5 = PropMD5, @HisLastModifiedTime = LastModifiedTime, @HisStartAddressID = StartAddressID, @HisTransactionFlags = TransactionFlags, @HisLastTouchStart = LastTouchStart
        FROM MSSCrawlURL 
        WHERE MSSCrawlURL.AccessHash = @AccessHash  AND MSSCrawlURL.AccessURL = @AccessURL AND DeletePending = 0

            IF @DocId IS NOT NULL
            BEGIN
                UPDATE MSSTranTempTable0 SET DocId = @DocId WHERE AccessHash = @AccessHash AND AccessUrl = @AccessUrl
            END

    END

    IF @DocID IS NOT NULL AND @HisCrawlID>=@CrawlID AND @ChangeLogBatchID = 0 
        RETURN

    IF @DocID IS NOT NULL AND
        @HisParentDocID = -1 AND
        @ITEMTYPE_STARTADDRESS != @ItemType AND
        @ChangeLogBatchID = 0
            RETURN

    IF @DocID IS NOT NULL AND
        @HisStartAddressID != @StartAddressID AND
        @ProtocolSwitch = 1 AND
        @SourceIsStartAddress != 1 AND
        @SourceHostHop = 1
            RETURN

    IF @CrawlType = @CRAWLTYPE_INCREMENTAL AND 
        @DocID is NOT NULL AND 
        @HisTransactionFlags & @TF_RARE_CRAWL <> 0 AND 
        DATEDIFF(mi, @HisLastTouchStart, getdate()) < @FullIncrementalInterval
            RETURN

    EXEC DBO.proc_MSS_GetHostID @host, @HostID OUTPUT
    IF @hrResult != 0 
    BEGIN
        EXEC dbo.proc_MSS_GetCrawlErrorID @hrResult, @ErrorID OUTPUT, @ErrorLevel OUTPUT, @MarkDelete OUTPUT
    END

    IF @ITEMTYPE_STARTADDRESS =  @ItemType 
    BEGIN
        IF EXISTS ( SELECT CrawlType FROM MSSCrawlHistory WHERE CrawlID = @CrawlID AND CrawlType = @CRAWLTYPE_INCREMENTAL)
        BEGIN
            IF @DocID IS NULL
            BEGIN
                EXEC dbo.proc_MSS_ProcessNew
                    @DocID OUTPUT,
                    @StartAddressID, @ContentSourceID, @ProjectID,
                    @CrawlID, 
                    @SourceDocID, 
                    @TransactionFlags, 
                    @HostDepth, 
                    @EnumerationDepth, 
                    @LCID,
                    @PropMD5, 
                    @EndPathFlag, 
                    @HostID,
                    @IndexType,
                    @AccessURL, @AccessHash,
                    @CompactURL, @CompactHash, 
                    @DisplayURL, @DisplayHash, 
                    @UseChangeLog

            END

            EXEC DBO.proc_MSS_ProcessStartInc
                @FullIncrementalInterval, 
                @DeleteOnErrorInterval,
                @DocID, 
                @StartAddressID, 
                @ContentSourceID,
                @ProjectID,
                @CrawlID

            RETURN
        END
    END

    IF @CrawlType = @CRAWLTYPE_INCREMENTAL AND
        @DocID IS NOT NULL AND
        @UseChangeLog = 0 AND
        @CrawlID > @HisCrawlID  AND
        (@TransactionFlags & @TF_USES_EXTENDED_DIRLINKS) <> 0 AND
        @LastModifiedTime = @HisLastModifiedTime AND
        (@TransactionFlags & @TF_UPDATE_SECURITY_ONLY) = 0
    BEGIN
        UPDATE MSSCrawlURL SET CrawlID = @CrawlID, CommitCrawlID = @CrawlID, ErrorID = @NotModifiedErrorID, ErrorLevel = @NotModifiedErrorLevel WHERE DocID = @DocID

        RETURN
    END

    IF @ChangeLogBatchID > 0 AND (@TransactionFlags & @TF_UPDATE_SECURITY_ONLY) <> 0 
    BEGIN
        DECLARE @RecursiveLevel int
        declare @UpdateSecurityQueue TABLE (
                    DocID int, 
                    TransactionFlags int, 
                    HostDepth int,
                    EnumerationDepth int,
                    SourceDocID int,
                    RecursiveLevel int,
                    FolderHighPriority int)

        INSERT INTO @UpdateSecurityQueue (DocID, TransactionFlags, HostDepth, EnumerationDepth, SourceDocID, RecursiveLevel, FolderHighPriority)
        SELECT DocID, TransactionFlags, HostDepth, EnumerationDepth, ParentDocID, 0, FolderHighPriority
        FROM MSSCrawlURL 
        WHERE DocID=@DocID 

        Set @RecursiveLevel = 1
        INSERT INTO @UpdateSecurityQueue (DocID, TransactionFlags, HostDepth, EnumerationDepth, SourceDocID, RecursiveLevel, FolderHighPriority)
        SELECT DocID, TransactionFlags, HostDepth, EnumerationDepth, ParentDocID, @RecursiveLevel, FolderHighPriority
        FROM MSSCrawlURL 
        WHERE 
            (ParentDocID = @DocID AND 
            ((TransactionFlags & @TF_USES_EXTENDED_DIRLINKS <> 0 AND TransactionFlags & @TF_DIRECTORY <> 0) AND UseChangeLog = 1))

        WHILE @RecursiveLevel > 0 
        BEGIN
            DECLARE @RowCount int

            INSERT INTO @UpdateSecurityQueue (DocID, TransactionFlags, HostDepth, EnumerationDepth, SourceDocID, RecursiveLevel, FolderHighPriority)
                SELECT DocID, TransactionFlags, HostDepth, EnumerationDepth, ParentDocID, @RecursiveLevel + 1, FolderHighPriority
                FROM MSSCrawlURL WHERE ParentDocID IN
                (SELECT DocID FROM @UpdateSecurityQueue 
                        WHERE RecursiveLevel = @RecursiveLevel AND 
                            TransactionFlags & @TF_DIRECTORY <> 0
                )  and TransactionFlags & @TF_DIRECTORY <> 0

            IF @@ROWCOUNT = 0
               BREAK

            SET @RecursiveLevel =@RecursiveLevel + 1
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
            ProjectID)
        SELECT
           @CrawlID,
           @StartAddressID,
           DocID,
           @GTHR_CA_MODIFY,
           @SCOPE_DEEP,   
           TransactionFlags | @TF_UPDATE_SECURITY_ONLY, 
            HostDepth,
            EnumerationDepth,
            SourceDocID,
            @ChangeLogBatchID,
            @ITEMTYPE_LINK,
            FolderHighPriority, 
            0, 
            @ProjectID
        FROM @UpdateSecurityQueue 

        RETURN
    END

    IF (@UseChangeLog > 0  AND @HisCommitCrawlID > 0 AND @HisPropMD5 != @PropMD5)
        SELECT @Scope = @SCOPE_DEEP

    IF @ChangeLogBatchID > 0 AND @CrawlID > @HisCrawlID AND @TransactionType = @GTHR_CA_DELETE
    BEGIN
        SET @CreateDeleteTransaction = 1
        UPDATE MSSCrawlURL SET CrawlID = @CrawlID WHERE DocID = @DocID
    END

    IF @TransactionType <> @GTHR_CA_DELETE AND @hrResult = 0 
        SET @CreateAddModifyTransaction = 1;		

    IF @hrResult = @GTHR_E_URL_EXCLUDED_DEPTH
        SET @ExceededDepth = 1
    ELSE IF @hrResult <> 0 
        SET @Excluded = 1

    IF @CreateAddModifyTransaction = 1
    BEGIN
        DECLARE @ParentDocID int
        SET @ParentDocID = @SourceDocID
        IF @UseChangeLog = 1
        BEGIN
            SET @HisParentDocID = NULL
            IF @ParentCompactURL IS NOT NULL            
                SELECT @HisParentDocID = DocID FROM MSSCrawlURL WHERE CompactHash=@ParentCompactHash AND CompactURL=@ParentCompactURL
            IF @HisParentDocID IS NOT NULL
                SET @ParentDocID = @HisParentDocID
            ELSE IF @ParentChangeLogCookie IS NOT NULL AND @CrawlType = @CRAWLTYPE_INCREMENTAL
                RETURN
        END

        IF @DocID IS NULL
        BEGIN
            EXEC dbo.proc_MSS_ProcessNew
                @DocID OUTPUT,
                @StartAddressID, @ContentSourceID, @ProjectID,
                @CrawlID, 
                @ParentDocID, 
                @TransactionFlags, 
                @HostDepth, 
                @EnumerationDepth, 
                @LCID,
                @PropMD5, 
                @EndPathFlag, 
                @HostID,
                @IndexType,
                @AccessURL, @AccessHash,
                @CompactURL, @CompactHash, 
                @DisplayURL, @DisplayHash, 
                @UseChangeLog

            IF @DocID = -1
            BEGIN
                RETURN 0
            END

                UPDATE MSSTranTempTable0 SET DocId = @DocId WHERE AccessHash = @AccessHash AND AccessUrl = @AccessUrl

        END
        ELSE
        BEGIN

            UPDATE MSSCrawlURL SET CrawlID = @CrawlID, ParentDocID = @ParentDocID, StartAddressID = @StartAddressID, ContentSourceID = @ContentSourceID WHERE DocID = @DocID
        END
    END

    IF @CreateAddModifyTransaction = 1
    BEGIN
        INSERT INTO MSSCrawlQueue (
            CrawlID,
            StartAddressID,
            ProjectID,
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
            ItemHighPriority)
        VALUES (  
            @CrawlID,
            @StartAddressID,
            @ProjectID,
            @DocID,
            @GTHR_CA_MODIFY,
            @Scope,
            @TransactionFlags,
            @HostDepth,
            @EnumerationDepth,
            @SourceDocID,
            @ChangeLogBatchID,
            @ItemType,
            @FolderHighPriority, 
            @ItemHighPriority)

    END

    IF (@ExceededDepth = 1 AND @DocID IS NULL) OR @Excluded = 1
    BEGIN

        SET @TrackID = NULL
        SELECT @TrackID = TrackID FROM MSSCrawlDeletedURL
            WHERE AccessHash = @AccessHash AND AccessURL = @AccessURL

        IF @TrackID IS NULL 
        BEGIN

            INSERT INTO MSSCrawlDeletedURL (
                StartAddressID,
                ContentSourceID,
                ProjectID,
                DocID,
                CrawlID,
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
                EndPathFlag,
                HostID,
                LCID,
                LogTime,
                ErrorID,
                ErrorLevel)
            VALUES (
                @StartAddressID,
                @ContentSourceID,
                @ProjectID,
                @DocID,
                @CrawlID,
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
                @SourceDocID,
                @UseChangeLog,
                @EndPathFlag,
                @HostID,
                @LCID,
                GetDate(),
                @ErrorID,
                @ErrorLevel)

            IF @ProjectID = 1
            BEGIN 
                UPDATE MSSCrawlHostList SET 
                    WarningCount = WarningCount + 1
                WHERE HostID = @HostID
            END
        END
    END

    if @Excluded = 1 AND @DocID IS NOT NULL  AND @HisStartAddressID = @StartAddressID
        SET @CreateDeleteTransaction = 1

    IF @CreateDeleteTransaction = 1 AND @DocID IS NOT NULL
    BEGIN
        DECLARE @DeleteReason int
        IF @Excluded = 1
            SET @DeleteReason = @DELETE_EXCLUDED
        ELSE
            SET @DeleteReason = @DELETE_CHANGELOG

        INSERT INTO MSSCrawlQueue (
            CrawlID,
            StartAddressID, 
            ProjectID,
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
            DeleteReason)
        VALUES(
            @CrawlID,
            @StartAddressID,
            @ProjectID,
            @DocID,
            @GTHR_CA_DELETE,
            @SCOPE_DEEP,   
            @TransactionFlags, 
            0, 
            0, 
            0, 
            @ChangeLogBatchID,
            @ItemType,
            @FolderHighPriority,  
            @ItemHighPriority,
            @DeleteReason)

    END

GO
