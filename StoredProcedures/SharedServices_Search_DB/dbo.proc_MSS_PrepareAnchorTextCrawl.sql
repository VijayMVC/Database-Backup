/****** Object:  StoredProcedure [dbo].[proc_MSS_PrepareAnchorTextCrawl]    Script Date: 5/15/2018 12:11:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_PrepareAnchorTextCrawl
            @CrawlId as int OUTPUT
WITH RECOMPILE
AS

SET NOCOUNT ON

    select @CrawlId = MIN(CrawlId) from MSSAnchorPendingChangeLog

    if @CrawlId is null 
    BEGIN
                select @CrawlId = -1
                return
    END

    INSERT INTO MSSAnchorChangeLog (CrawlId, TargetDocId, ChangeType)
                SELECT @CrawlId, 
                            AnchorTextChanges.TargetDocId, 
                            CASE WHEN NumberOfLinks = 0 THEN 1 
                                        ELSE 2 
                            END
                FROM
                  (select SUM(CASE WHEN MSSAnchorText.SourceDocId is NULL THEN 0 else 1 END) AS NumberOfLinks, MSSAnchorPendingChangeLog.TargetDocId FROM MSSAnchorPendingChangeLog
                            LEFT OUTER JOIN MSSAnchorText ON
                                        MSSAnchorText.TargetDocId = MSSAnchorPendingChangeLog.TargetDocId
                            WHERE MSSAnchorPendingChangeLog.CrawlId = @CrawlId
                            GROUP BY MSSAnchorPendingChangeLog.TargetDocId
                  ) AS AnchorTextChanges

    SET NOCOUNT OFF


GO
