/****** Object:  StoredProcedure [dbo].[proc_MSS_FlushTemp0]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_FlushTemp0
@FullIncrementalInterval int,
@DeleteOnErrorInterval int,
@DocID int,
@CrawlID int,
@MaxDocId int,
@AnchorsLimit int,
@LicenseExceeded bit OUTPUT
AS
    SET NOCOUNT ON  
    SET XACT_ABORT ON
    BEGIN TRANSACTION
    SET @LicenseExceeded = 0;
    DECLARE @ChangeLogCookie nvarchar(200)
    SET @ChangeLogCookie = NULL
    SELECT @ChangeLogCookie = ChangeLogCookie FROM MSSCrawlURL WITH(NOLOCK) WHERE DocID = @DocID
    EXEC dbo.proc_MSS_FlushLinks0 @FullIncrementalInterval, @DeleteOnErrorInterval, @DocID, @CrawlID, @MaxDocId, @ChangeLogCookie, @LicenseExceeded OUTPUT
    DELETE MSSTranTempTable0
    WHERE SourceDocID=@DocID AND CrawlID=@CrawlID
    COMMIT TRANSACTION
    RETURN 1

GO
