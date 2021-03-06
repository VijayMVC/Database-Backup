/****** Object:  StoredProcedure [dbo].[proc_MSS_FlushTemp0]    Script Date: 5/15/2018 12:11:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_FlushTemp0
@FullIncrementalInterval int,
@DeleteOnErrorInterval int,
@DocID int,
@CrawlID int,
@AnchorsLimit int
AS

    SET NOCOUNT ON  

    SET XACT_ABORT ON

    BEGIN TRANSACTION

    DECLARE @ChangeLogCookie nvarchar(200)
    SET @ChangeLogCookie = NULL
    SELECT @ChangeLogCookie = ChangeLogCookie FROM MSSCrawlURL WITH(NOLOCK) WHERE DocID = @DocID

    EXEC dbo.proc_MSS_FlushLinks0 @FullIncrementalInterval, @DeleteOnErrorInterval, @DocID, @CrawlID, @ChangeLogCookie

        EXEC dbo.proc_MSS_FlushAnchorText0 @DocID, @CrawlID, @AnchorsLimit

    DELETE MSSTranTempTable0
    WHERE SourceDocID=@DocID AND CrawlID=@CrawlID

    COMMIT TRANSACTION
    RETURN 1


GO
