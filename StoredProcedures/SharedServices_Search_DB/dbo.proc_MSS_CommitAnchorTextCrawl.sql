/****** Object:  StoredProcedure [dbo].[proc_MSS_CommitAnchorTextCrawl]    Script Date: 5/15/2018 12:11:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_CommitAnchorTextCrawl
	@CrawlId as int
WITH RECOMPILE
AS

    DELETE FROM MSSAnchorChangeLog WHERE CrawlId = @CrawlId
    DELETE FROM MSSCrawlChangedSourceDocs WHERE CrawlId = @CrawlId
    DELETE FROM MSSCrawlChangedTargetDocs WHERE CrawlId = @CrawlId
    DELETE FROM MSSAnchorPendingChangeLog WHERE CrawlId = @CrawlId

    UPDATE MSSDocDeleteList SET Available = 1 WHERE CrawlId = @CrawlId AND Available = 0
    UPDATE MSSDocDeleteList SET Available = 2 WHERE CrawlId < @CrawlId AND Available = 1


GO
