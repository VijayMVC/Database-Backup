/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_ZeroResults]    Script Date: 5/15/2018 12:11:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_ZeroResults
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

    SELECT queryString, scope, numScopes, numQueries,
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
        ) AS resultsUrl, csn.contextualScope, cu.url as contextualScopeUrl
    FROM 
    (
        SELECT TOP 300 queryId, scopeId, numQueries, contextualScopeId
        FROM (
            SELECT queryId, scopeId, SUM(numZeroResults) AS numQueries, contextualScopeId
            FROM dbo.MSSQLogQuerySummary
            WHERE (searchDate >= @startDate)        
            AND (siteId = @siteId OR @isSspLevel = 1)
            GROUP BY queryId, scopeId, contextualScopeId
        ) as smr
        WHERE numQueries > 0
        ORDER BY numQueries DESC
    ) AS t
    INNER JOIN dbo.MSSQLogQueryString AS q
    ON q.queryId = t.queryId
    INNER JOIN dbo.MSSQLogScope AS s
    ON s.scopeId = t.scopeId
    INNER JOIN dbo.MSSQLogContextualScope AS cs 
    ON cs.contextualScopeId = t.contextualScopeId
    INNER JOIN dbo.MSSQLogContextualScopeName AS csn 
    ON csn.contextualScopeNameId = cs.contextualScopeNameId
    LEFT OUTER JOIN MSSQLogUrl as cu 
    ON cu.urlId = cs.contextualScopeUrlId
    ORDER BY numQueries DESC

GO
