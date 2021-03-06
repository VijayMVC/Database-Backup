/****** Object:  StoredProcedure [dbo].[proc_MSS_Crawl]    Script Date: 5/15/2018 12:11:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_Crawl
@ProjectID int,
@CrawlStage int,
@CrawlType int,
@CrawlID int,
@ContentSourceID int,
@StartAddressID int,
@AcquiredCrawlID int OUTPUT,
@CrawlStatus int OUTPUT
WITH RECOMPILE
AS
    SET NOCOUNT ON

    DECLARE @CRAWL_ACQUIREID int SET @CRAWL_ACQUIREID = 1 DECLARE @CRAWL_STATUS_INSERTSTARTPAGE int SET @CRAWL_STATUS_INSERTSTARTPAGE = 2 DECLARE @CRAWL_STARTCHECK int SET @CRAWL_STARTCHECK = 3 DECLARE @CRAWL_STATUS_START int SET @CRAWL_STATUS_START = 4 DECLARE @CRAWL_STATUS_FORBID int SET @CRAWL_STATUS_FORBID = 5 DECLARE @CRAWL_UPDATE_SEED int SET @CRAWL_UPDATE_SEED = 6 DECLARE @CRAWL_QUERY_DONE int SET @CRAWL_QUERY_DONE = 7 DECLARE @CRAWL_STATUS_DELETEUNVISITEDITEMS int SET @CRAWL_STATUS_DELETEUNVISITEDITEMS = 8 DECLARE @CRAWL_STATUS_PAUSE int SET @CRAWL_STATUS_PAUSE = 9 DECLARE @CRAWL_STATUS_RESUME int SET @CRAWL_STATUS_RESUME =10 DECLARE @CRAWL_STATUS_DONE int SET @CRAWL_STATUS_DONE = 11 DECLARE @CRAWL_UPDATE_STOP int SET @CRAWL_UPDATE_STOP = 12 DECLARE @CRAWL_STATUS_STOP int SET @CRAWL_STATUS_STOP = 13 DECLARE @CRAWL_STATUS_RESET int SET @CRAWL_STATUS_RESET = 14 DECLARE @CRAWL_START_DELETE int SET @CRAWL_START_DELETE = 15 DECLARE @CRAWL_DELETE_CS int SET @CRAWL_DELETE_CS = 16 DECLARE @CRAWL_DELETE_SA int SET @CRAWL_DELETE_SA = 17 
    DECLARE @CRAWLTYPE_FULL int SET @CRAWLTYPE_FULL = 1 DECLARE @CRAWLTYPE_INCREMENTAL int SET @CRAWLTYPE_INCREMENTAL = 2 DECLARE @CRAWLTYPE_DELETE int SET @CRAWLTYPE_DELETE = 6 
    DECLARE @GTHR_CA_ADD int SET @GTHR_CA_ADD = 0 DECLARE @GTHR_CA_DELETE int SET @GTHR_CA_DELETE = 1 DECLARE @GTHR_CA_MODIFY int SET @GTHR_CA_MODIFY = 2 DECLARE @GTHR_CA_MOVE_RENAME int SET @GTHR_CA_MOVE_RENAME = 3 
    DECLARE @SCOPE_SHALLOW int SET @SCOPE_SHALLOW = 0X0001 DECLARE @SCOPE_DEEP int SET @SCOPE_DEEP = 0X0002
    DECLARE @ITEMTYPE_INVALIDLINK int SET @ITEMTYPE_INVALIDLINK = 0 DECLARE @ITEMTYPE_STARTADDRESS int SET @ITEMTYPE_STARTADDRESS = 1 DECLARE @ITEMTYPE_LINK int SET @ITEMTYPE_LINK = 2 DECLARE @ITEMTYPE_COMMITTED int SET @ITEMTYPE_COMMITTED = 3 DECLARE @ITEMTYPE_ANCHORNEWLINK int SET @ITEMTYPE_ANCHORNEWLINK = 4 DECLARE @ITEMTYPE_ANCHORCOMMITTED int SET @ITEMTYPE_ANCHORCOMMITTED = 5 DECLARE @ITEMTYPE_ANCHORNOCRAWL int SET @ITEMTYPE_ANCHORNOCRAWL = 6
    DECLARE @DELETE_ERROR int SET @DELETE_ERROR = 1 DECLARE @DELETE_CRAWL int SET @DELETE_CRAWL = 2 DECLARE @DELETE_UNVISITED_FULL int SET @DELETE_UNVISITED_FULL = 3 DECLARE @DELETE_UNVISITED_INC int SET @DELETE_UNVISITED_INC = 4 DECLARE @DELETE_UNVISITED_LOG int SET @DELETE_UNVISITED_LOG = 5 DECLARE @DELETE_RECURSIVE int SET @DELETE_RECURSIVE = 6 DECLARE @DELETE_EXCLUDED int SET @DELETE_EXCLUDED = 7 DECLARE @DELETE_CHANGELOG int SET @DELETE_CHANGELOG = 8

    DECLARE
    @Temp int

    SET @AcquiredCrawlID = @CrawlID 

    SET XACT_ABORT ON

    BEGIN  TRANSACTION

    IF @CRAWL_ACQUIREID = @CrawlStage
    BEGIN

        SET @AcquiredCrawlID = 0
        INSERT INTO MSSCrawlHistory (ProjectID, Status, CrawlType) VALUES (@ProjectID, @CrawlStage, @CrawlType)
        SELECT @AcquiredCrawlID = @@IDENTITY
    END

    IF @CRAWL_STATUS_INSERTSTARTPAGE = @CrawlStage
    BEGIN
        IF NOT EXISTS ( SELECT * FROM MSSCrawlContent WHERE CrawlID = @CrawlID)
        BEGIN
            UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_INSERTSTARTPAGE
            WHERE CrawlID = @CrawlID
        END

        INSERT INTO MSSCrawlContent (CrawlID, CatalogID, ContentSourceID, StartAddressID)
        VALUES (@CrawlID, @ProjectID, @ContentSourceID, @StartAddressID)
    END

    IF @CRAWL_STARTCHECK = @CrawlStage
    BEGIN

        UPDATE MSSCrawlHistory SET CrawlType = @CrawlType WHERE CrawlID = @CrawlID

        SELECT @Temp = ContentSourceID  FROM MSSCrawlContent WITH (TABLOCKX)

        IF EXISTS 
            (SELECT * FROM MSSCrawlContent 
            WHERE CrawlID IN 
                (SELECT CrawlID FROM MSSCrawlHistory
                 WHERE CrawlID <> @CrawlID
                 AND (Status = @CRAWL_STATUS_START OR Status = @CRAWL_STATUS_PAUSE))             
            AND StartAddressID IN
                (SELECT StartAddressID FROM MSSCrawlContent
                WHERE CrawlID = @CrawlID))
        BEGIN
            UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_FORBID
            WHERE CrawlID = @CrawlID
        END
        ELSE 
        BEGIN
            UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_START, StartTime = GetDate()
            WHERE CrawlID = @CrawlID
        END
    END

    IF @CRAWL_UPDATE_SEED = @CrawlStage
    BEGIN
        UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_FORBID
        WHERE CrawlID = @CrawlID
    END

    IF @CRAWL_START_DELETE = @CrawlStage
    BEGIN
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
                StartAddressID,
                DocID,
                @GTHR_CA_DELETE,
                @SCOPE_SHALLOW,   
                TransactionFlags, 
                HostDepth,
                EnumerationDepth,
                0, 
                0, 
                @ITEMTYPE_COMMITTED,
                0, 
                0, 
                ProjectID,
                @DELETE_CRAWL
        FROM MSSCrawlURL A
        WHERE DeletePending = 1
            AND NOT EXISTS 
            (
                SELECT SeqID 
                FROM MSSCrawlQueue 
                WHERE DocID = A.DocID 
                AND StartAddressID = A.StartAddressID
                AND TransactionType = @GTHR_CA_DELETE
            )
    END

    SELECT @CrawlStatus =  Status FROM MSSCrawlHistory WHERE CrawlID = @CrawlID

    IF @CRAWL_QUERY_DONE = @CrawlStage AND @CrawlStatus = @CRAWL_STATUS_START
    BEGIN

        IF  0 = ( SELECT COUNT(*) FROM MSSCrawlQueue WHERE CrawlID = @CrawlID)
        BEGIN
            DECLARE @DeleteTransactionCount int
            SET @DeleteTransactionCount = 0

            IF @ProjectID != 2
            BEGIN
                IF EXISTS (SELECT CrawlID FROM MSSCrawlHistory WHERE CrawlID = @CrawlID AND CrawlType = @CRAWLTYPE_FULL)
                BEGIN
                    INSERT INTO MSSCrawlQueue (CrawlID,
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
                        StartAddressID, 
                        DocID,
                        @GTHR_CA_DELETE,
                        @SCOPE_SHALLOW,
                        0,  
                        HostDepth,
                        EnumerationDepth, 
                        ParentDocID,
                        0,
                        @ITEMTYPE_LINK,
                        0,
                        0,
                        ProjectID,
                        @DELETE_UNVISITED_FULL
                    FROM MSSCrawlURL A
                    WHERE StartAddressID IN (SELECT StartAddressID FROM MSSCrawlContent WHERE CrawlID = @CrawlID)
                    AND CommitCrawlID < @CrawlID

                    SELECT @DeleteTransactionCount = @@ROWCOUNT
                END
                IF EXISTS (SELECT CrawlID FROM MSSCrawlHistory WHERE CrawlID = @CrawlID AND CrawlType = @CRAWLTYPE_INCREMENTAL)
                BEGIN
                    INSERT INTO MSSCrawlQueue (CrawlID,
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
                        StartAddressID, 
                        DocID,
                        @GTHR_CA_DELETE,
                        @SCOPE_SHALLOW,
                        0,  
                        HostDepth,
                        EnumerationDepth, 
                        ParentDocID,
                        0,
                        @ITEMTYPE_LINK,
                        0,
                        0,
                        ProjectID,
                        @DELETE_UNVISITED_INC
                    FROM MSSCrawlURL A
                    WHERE StartAddressID IN (SELECT StartAddressID FROM MSSCrawlContent WHERE CrawlID = @CrawlID)
                    AND UseChangeLog = 0
                    AND ParentUpdateCrawlID = @CrawlID
                    AND CommitCrawlID < @CrawlID

                    SELECT @DeleteTransactionCount = @DeleteTransactionCount + @@ROWCOUNT
                END
                IF EXISTS (SELECT CrawlID FROM MSSCrawlHistory WHERE CrawlID = @CrawlID AND CrawlType = @CRAWLTYPE_INCREMENTAL)
                BEGIN
                    INSERT INTO MSSCrawlQueue (CrawlID,
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
                        StartAddressID, 
                        DocID,
                        @GTHR_CA_DELETE,
                        @SCOPE_DEEP,
                        0,  
                        HostDepth,
                        EnumerationDepth, 
                        ParentDocID,
                        0,
                        @ITEMTYPE_LINK,
                        0,
                        0,
                        ProjectID,
                        @DELETE_UNVISITED_LOG
                        FROM MSSCrawlURL A
                        WHERE StartAddressID IN (SELECT StartAddressID FROM MSSCrawlContent WHERE CrawlID = @CrawlID)
                        AND UseChangeLog = 1
                        AND ParentUpdateCrawlID = @CrawlID
                        AND CommitCrawlID < @CrawlID

                    SELECT @DeleteTransactionCount = @DeleteTransactionCount + @@ROWCOUNT
                END
            END    
            IF @DeleteTransactionCount = 0
            BEGIN

                DELETE MSSTranTempTable0
                WHERE CrawlID=@CrawlID

                IF @ProjectID = 1
                BEGIN 
                    DECLARE @DeletedCount int
                    SET @DeletedCount = 0

                    IF @CrawlType = @CRAWLTYPE_DELETE
                        SELECT @DeletedCount = (SELECT COUNT(*) FROM MSSCrawlDeletedURL WHERE CrawlID = @CrawlID)

                    IF @CrawlType != @CRAWLTYPE_DELETE OR @DeletedCount > 0
                    BEGIN
                        EXEC proc_MSS_UpdateHostStats2

                            EXEC proc_MSS_AnchorFixTargetDocid @CrawlId

                    END
                END

                declare @UrlWarnings int
                declare @DeletedUrlWarnings int
                declare @UrlErrors int
                declare @DeletedUrlErrors int

                DECLARE @Successes int
                DECLARE @Errors int
                DECLARE @Warnings int

		DECLARE @TempContentSourceID int

		SELECT @TempContentSourceID = ContentSourceID FROM MSSCrawlContent
		WHERE CrawlID = @CrawlID                

                SELECT @Successes = count(*) from MSSCrawlUrl WITH (NOLOCK)
                WHERE ProjectID = 1 
                AND CommitCrawlID in (SELECT CrawlID FROM MSSCrawlContent WHERE ContentSourceID = @TempContentSourceID)
                AND ErrorLevel = 0

                SELECT @UrlWarnings = count(*) from MSSCrawlUrl WITH (NOLOCK)
                WHERE ProjectID = 1 
                AND CommitCrawlID in (SELECT CrawlID FROM MSSCrawlContent WHERE ContentSourceID = @TempContentSourceID)
                AND ErrorLevel = 1

                SELECT @DeletedUrlWarnings = count(*) from MSSCrawlDeletedUrl WITH (NOLOCK)
                WHERE ProjectID = 1 
                AND CrawlID in (SELECT CrawlID FROM MSSCrawlContent WHERE ContentSourceID = @TempContentSourceID)
                AND ErrorLevel = 1

                set @Warnings = @UrlWarnings + @DeletedUrlWarnings

                SELECT @UrlErrors = count(*) from MSSCrawlUrl WITH (NOLOCK)
                WHERE ProjectID = 1 
                AND CommitCrawlID in (SELECT CrawlID FROM MSSCrawlContent WHERE ContentSourceID = @TempContentSourceID)
                AND ErrorLevel = 2

                SELECT @DeletedUrlErrors = count(*) from MSSCrawlDeletedUrl WITH (NOLOCK)
                WHERE ProjectID = 1 
                AND CrawlID in (SELECT CrawlID FROM MSSCrawlContent WHERE ContentSourceID = @TempContentSourceID)
                AND ErrorLevel = 2

                set @Errors = @UrlErrors + @DeletedUrlErrors

                IF @Successes IS NOT NULL
                BEGIN
                    UPDATE MSSCrawlHistory SET SuccessCount = @Successes
                    WHERE CrawlID = @CrawlID
                END

                IF @Errors IS NOT NULL
                BEGIN
                    UPDATE MSSCrawlHistory SET ErrorCount = @Errors
                    WHERE CrawlID = @CrawlID
                END

                IF @Warnings IS NOT NULL
                BEGIN
                    UPDATE MSSCrawlHistory SET WarningCount = @Warnings
                    WHERE CrawlID = @CrawlID
                END

                UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_DONE,  EndTime = GetDate() WHERE CrawlID = @CrawlID                                                

            END
        END
    END

    IF @CRAWL_STATUS_PAUSE = @CrawlStage
    BEGIN

        IF 0 = @CrawlID  
        BEGIN
            UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_PAUSE
            WHERE ProjectID = @ProjectID AND Status NOT IN
                (@CRAWL_STATUS_FORBID, @CRAWL_STATUS_DONE, @CRAWL_UPDATE_STOP, @CRAWL_STATUS_RESET)
        END
        ELSE
        BEGIN
            UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_PAUSE
            WHERE CrawlID = @CrawlID AND Status = @CRAWL_STATUS_START
        END
    END

    IF @CRAWL_STATUS_RESUME = @CrawlStage
    BEGIN

        IF 0 = @CrawlID  
        BEGIN
            UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_START
            WHERE ProjectID = @ProjectID AND Status = @CRAWL_STATUS_PAUSE
        END
        ELSE
        BEGIN
            UPDATE MSSCrawlHistory SET Status = @CRAWL_STATUS_START
            WHERE CrawlID = @CrawlID AND Status = @CRAWL_STATUS_PAUSE
        END
    END

    IF @CRAWL_UPDATE_STOP = @CrawlStage
    BEGIN
        IF 0 = @CrawlID  
        BEGIN

            DELETE FROM MSSCrawlQueue 
            WHERE SeqID IN 
            (
                SELECT SeqID
                FROM MSSCrawlQueue A, MSSCrawlHistory B
                WHERE A.ProjectID = @ProjectID
                AND A.CrawlID = B.CrawlID
                AND B.CrawlType != @CRAWLTYPE_DELETE
            )

            UPDATE MSSCrawlHistory SET Status = @CrawlStage, EndTime = GetDate()
            WHERE ProjectID = @ProjectID 
                AND Status NOT IN ( @CRAWL_STATUS_FORBID, @CRAWL_STATUS_DONE, @CRAWL_STATUS_RESET)
                AND CrawlType != @CRAWLTYPE_DELETE

            DELETE MSSTranTempTable0
            WHERE ProjectID=@ProjectID

        END
        ELSE
        BEGIN
            DELETE FROM MSSCrawlQueue 
            WHERE SeqID IN 
            (
                SELECT SeqID
                FROM MSSCrawlQueue A, MSSCrawlHistory B
                WHERE A.CrawlID = @CrawlID
                AND A.CrawlID = B.CrawlID
                AND A.ProjectID = @ProjectID
                AND B.CrawlType != @CRAWLTYPE_DELETE
            )

            UPDATE MSSCrawlHistory SET Status = @CrawlStage, EndTime = GetDate() 
            WHERE CrawlID = @CrawlID
            AND CrawlType != @CRAWLTYPE_DELETE

            DELETE MSSTranTempTable0
            WHERE CrawlID=@CrawlID
        END

        IF @ProjectID = 1
        BEGIN 
            EXEC proc_MSS_UpdateHostStats2

                DELETE MSSCrawlChangedSourceDocs WHERE CrawlID=@CrawlID
                DELETE MSSCrawlChangedTargetDocs WHERE CrawlID=@CrawlID

        END
    END

    IF @CRAWL_STATUS_RESET = @CrawlStage
    BEGIN

        TRUNCATE TABLE msscrawlqueue
        TRUNCATE TABLE msstrantemptable0

        TRUNCATE TABLE msscrawlHostList

        TRUNCATE TABLE MSSCrawlURL
        TRUNCATE TABLE MSSCrawlURLLog
        TRUNCATE TABLE MSSCrawlDeletedURL

        TRUNCATE TABLE MSSBatchHistory
        TRUNCATE TABLE MSSCrawlContent
        DELETE FROM MSSCrawlHistory 

        TRUNCATE TABLE MSSDocDeleteList
        UPDATE MSSNextDocID SET NextDocID = 1

        TRUNCATE TABLE MSSAnchorText 

        TRUNCATE TABLE MSSDocProps
        TRUNCATE TABLE MSSSecurityDescriptors
        TRUNCATE TABLE MSSDocSdids	

        TRUNCATE TABLE MSSAlertDocHistory	

    END

    IF @CrawlStage = @CRAWL_DELETE_CS 
    BEGIN
        UPDATE MSSCrawlURL 
        SET DeletePending = 1
        FROM MSSCrawlURL A
        WHERE ContentSourceID = @ContentSourceID

    END
    IF @CrawlStage = @CRAWL_DELETE_SA 
    BEGIN
        UPDATE MSSCrawlURL 
        SET DeletePending = 1
        WHERE StartAddressID = @StartAddressID
    END

    SELECT @CrawlStatus =  Status FROM MSSCrawlHistory WHERE CrawlID = @CrawlID

    COMMIT TRANSACTION
    RETURN 1

GO
