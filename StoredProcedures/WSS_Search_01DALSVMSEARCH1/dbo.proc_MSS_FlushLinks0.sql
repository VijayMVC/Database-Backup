/****** Object:  StoredProcedure [dbo].[proc_MSS_FlushLinks0]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_FlushLinks0
@FullIncrementalInterval int,
@DeleteOnErrorInterval int,
@ParentDocID int,
@ParentCrawlID int,
@MaxDocId int,
@ParentChangeLogCookie nvarchar(200),
@LicenseExceeded bit OUTPUT
AS
    SET NOCOUNT ON  
    DECLARE @ITEMTYPE_INVALIDLINK int SET @ITEMTYPE_INVALIDLINK = 0 DECLARE @ITEMTYPE_STARTADDRESS int SET @ITEMTYPE_STARTADDRESS = 1 DECLARE @ITEMTYPE_LINK int SET @ITEMTYPE_LINK = 2 DECLARE @ITEMTYPE_COMMITTED int SET @ITEMTYPE_COMMITTED = 3 DECLARE @ITEMTYPE_ANCHORNEWLINK int SET @ITEMTYPE_ANCHORNEWLINK = 4 DECLARE @ITEMTYPE_ANCHORCOMMITTED int SET @ITEMTYPE_ANCHORCOMMITTED = 5 DECLARE @ITEMTYPE_ANCHORNOCRAWL int SET @ITEMTYPE_ANCHORNOCRAWL = 6
    DECLARE @CrawlID int, @SourceDocID int, @DocID int, @StartAddressID int, @ContentSourceID int, @ProjectID int, @AccessURL nvarchar(1500), @AccessHash int, @CompactURL nvarchar(40), @CompactHash int, @ParentCompactURL nvarchar(40), @ParentCompactHash int, @DisplayURL nvarchar(1500), @DisplayHash int, @Host nvarchar(300), @hrResult int, @Anchor nvarchar(512), @TransactionType int, @Scope int, @ItemType int, @TransactionFlags int, @HostDepth int, @EnumerationDepth int, @UseChangeLog int, @IndexType int, @ChangeLogBatchID int, @FolderHighPriority int, @ItemHighPriority int, @SeqID bigint, @LCID int, @EndPathFlag int, @PropMD5 int, @LastModifiedTime bigint, @ProtocolSwitch int
    DECLARE @SourceIsStartAddress int
    SET @SourceIsStartAddress = 0
    SET @LicenseExceeded = 0
    DECLARE @SourceHostHop int
    SET @SourceHostHop = 0
    IF @ParentDocID != -1
    BEGIN
        DECLARE @ParentHostID int, @GrandParentDocID int, @GrandParentHostID int
        SELECT @ParentHostID = HostID, @GrandParentDocID = ParentDocID FROM MSSCrawlURL WITH(NOLOCK) WHERE DocID = @ParentDocID
        IF @GrandParentDocID = -1
            SET @SourceIsStartAddress = 1
        ELSE
        BEGIN
            SELECT @GrandParentHostID = HostID FROM MSSCrawlURL WITH(NOLOCK) WHERE DocID = @GrandParentDocID
            IF @ParentHostID != @GrandParentHostID 
                SET @SourceHostHop = 1
        END
    END
    DECLARE Links CURSOR FAST_FORWARD  FOR
    SELECT CrawlID, SourceDocID, DocID, StartAddressID, ContentSourceID, ProjectID, AccessURL, AccessHash, CompactURL, CompactHash, ParentCompactURL, ParentCompactHash, DisplayURL, DisplayHash, Host, hrResult, AnchorText, TransactionType, Scope, ItemType, TransactionFlags, HostDepth, EnumerationDepth, UseChangeLog, IndexType, ChangeLogBatchID, FolderHighPriority, ItemHighPriority, SeqID, LCID, EndPathFlag, PropMD5, LastModifiedTime, ProtocolSwitch
    FROM MSSTranTempTable0
    WHERE  SourceDocID= @ParentDocID AND CrawlID = @ParentCrawlID AND (@ITEMTYPE_STARTADDRESS = ItemType OR  @ITEMTYPE_LINK = ItemType)
    OPEN Links
    FETCH NEXT FROM Links INTO @CrawlID, @SourceDocID, @DocID, @StartAddressID, @ContentSourceID, @ProjectID, @AccessURL, @AccessHash, @CompactURL, @CompactHash, @ParentCompactURL, @ParentCompactHash, @DisplayURL, @DisplayHash, @Host, @hrResult, @Anchor, @TransactionType, @Scope, @ItemType, @TransactionFlags, @HostDepth, @EnumerationDepth, @UseChangeLog, @IndexType, @ChangeLogBatchID, @FolderHighPriority, @ItemHighPriority, @SeqID, @LCID, @EndPathFlag, @PropMD5, @LastModifiedTime, @ProtocolSwitch
    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC dbo.proc_MSS_ProcessLink
            @FullIncrementalInterval, @DeleteOnErrorInterval,
            @StartAddressID, @ContentSourceID, @ProjectID,
            @CrawlID, 
            @SourceDocID, 
            @ItemType, 
            @TransactionType, 
            @Scope, 
            @TransactionFlags, 
            @AccessURL, @AccessHash, 
            @CompactURL, @CompactHash,
            @ParentCompactURL, @ParentCompactHash,
            @DisplayURL, @DisplayHash,
            @LastModifiedTime,
            @EndPathFlag, 
            @PropMD5, 
            @Host,
            @HostDepth, 
            @EnumerationDepth, 
            @IndexType, 
            @SeqID,
            @LCID,
            @UseChangeLog,
            @ChangeLogBatchID,
            @FolderHighPriority,
            @ItemHighPriority,
            @ProtocolSwitch,
            @SourceIsStartAddress,
            @SourceHostHop,
            @hrResult,
            @Anchor,
            @MaxDocId,
            @ParentChangeLogCookie,
            @LicenseExceeded OUTPUT
        FETCH NEXT FROM Links INTO @CrawlID, @SourceDocID, @DocID, @StartAddressID, @ContentSourceID, @ProjectID, @AccessURL, @AccessHash, @CompactURL, @CompactHash, @ParentCompactURL, @ParentCompactHash, @DisplayURL, @DisplayHash, @Host, @hrResult, @Anchor, @TransactionType, @Scope, @ItemType, @TransactionFlags, @HostDepth, @EnumerationDepth, @UseChangeLog, @IndexType, @ChangeLogBatchID, @FolderHighPriority, @ItemHighPriority, @SeqID, @LCID, @EndPathFlag, @PropMD5, @LastModifiedTime, @ProtocolSwitch
    END
    CLOSE Links
    DEALLOCATE Links

GO
