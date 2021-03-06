/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_ZeroBestBets]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_ZeroBestBets
 @siteGuid uniqueidentifier,
 @isSspLevel bit
WITH RECOMPILE
AS

    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

    DECLARE @siteId int
    EXEC @siteId = proc_MSS_QLog_GetSiteId @siteGuid, @isSspLevel
    IF (@siteId IS NULL AND @isSspLevel <> 1) RETURN

    DECLARE @startDate smalldatetime
    SET @startDate = DATEADD(day, DATEDIFF(day, '1/1/2000', GETDATE()) - 30, '1/1/2000')

    SELECT queryString, numQueries,
        (
            SELECT url AS resultsUrl FROM 
            (
                SELECT TOP 1 resultsUrlId FROM dbo.MSSQLogResultsUrlSummary AS r
                WHERE (r.siteId = @siteId OR @isSspLevel = 1)
                AND (r.searchDate >= @startDate)
                AND (r.queryIdX = q.queryId)
                GROUP BY resultsUrlId
                ORDER BY SUM(numQueries) DESC
            ) AS x
            INNER JOIN MSSQLogUrl as u
            ON u.urlId = x.resultsUrlId
        ) AS resultsUrl
     FROM 
    (
        SELECT TOP 300 queryId, numQueries
        FROM (
            SELECT queryId, SUM(numZeroBestBets) AS numQueries
            FROM MSSQLogQuerySummary
            WHERE (searchDate >= @startDate) 
            AND (siteId = @siteId OR @isSspLevel = 1)
            GROUP BY queryId
        ) as smr
        WHERE numQueries > 0
        ORDER BY numQueries DESC
    ) AS t
    INNER JOIN dbo.MSSQLogQueryString AS q 
    ON t.queryId = q.queryId
    ORDER BY numQueries DESC

GO
