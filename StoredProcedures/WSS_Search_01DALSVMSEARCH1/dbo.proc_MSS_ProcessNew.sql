/****** Object:  StoredProcedure [dbo].[proc_MSS_ProcessNew]    Script Date: 5/15/2018 12:13:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ProcessNew
@DocID int OUTPUT,
@StartAddressID int, @ContentSourceID int, @ProjectID int,
@CrawlID int, 
@SourceDocID int, 
@TransactionFlags int, 
@HostDepth int, 
@EnumerationDepth int, 
@LCID int,
@PropMD5 int, 
@EndPathFlag int, 
@HostID int,
@IndexType int,
@AccessURL nvarchar(1500), @AccessHash int, 
@CompactURL nvarchar(500), @CompactHash int, 
@DisplayURL nvarchar(1500), @DisplayHash int, 
@UseChangeLog int,
@MaxDocId int
AS
    SET NOCOUNT ON 
    IF NOT EXISTS (
        SELECT DocID  
        FROM MSSCrawlURL 
        WHERE AccessHash = @AccessHash  
            AND AccessURL = @AccessURL 
            AND DeletePending = 0
            )
    BEGIN
        EXEC proc_MSS_GetNextDocID @MaxDocID, @DocID OUTPUT
        IF @DocID = -1 RETURN
        INSERT INTO MSSCrawlURL (
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
            TransactionFlags, 
            HostDepth,
            EnumerationDepth,
            ParentDocID,
            UseChangeLog,
            IndexType,
            LCID,           
            PropMD5,
            EndPathFlag, 
            HostID,
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
            @TranSactionFlags,
            @HostDepth,
            @EnumerationDepth,
            @SourceDocID,
            @UseChangeLog,
            @IndexType,
            @LCID,
            @PropMD5,
            @EndPathFlag,
            @HostID,
            0, 
            0 
        )
    END
    ELSE
    BEGIN
        SELECT @DocID = DocID  
        FROM MSSCrawlURL 
        WHERE AccessHash = @AccessHash  
            AND AccessURL = @AccessURL 
            AND DeletePending = 0
    END

GO
