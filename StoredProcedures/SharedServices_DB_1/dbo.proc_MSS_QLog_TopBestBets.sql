/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_TopBestBets]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_TopBestBets
 @siteGuid uniqueidentifier,
 @isSspLevel bit
AS

    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

    DECLARE @siteId int
    EXEC @siteId = proc_MSS_QLog_GetSiteId @siteGuid, @isSspLevel
    IF (@siteId IS NULL AND @isSspLevel <> 1) RETURN

    SELECT TOP 300 bestBet, numClicks FROM 
    (
        SELECT bestBetId, SUM(numClicks) AS numClicks
        FROM dbo.MSSQLogBestBetSummary
        WHERE (searchDate >= DATEADD(day, DATEDIFF(day, '1/1/2000', GETDATE()) - 30, '1/1/2000')) 
        AND (siteId = @siteId OR @isSspLevel = 1)
        GROUP BY bestBetId
    ) AS t
    INNER JOIN dbo.MSSQLogBestBet AS b
    ON t.bestBetId = b.bestBetId
    ORDER BY numClicks DESC

GO
