/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_TopQueries]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_TopQueries
 @siteGuid uniqueidentifier,
 @isSspLevel bit,
 @topResultsCount int
AS

    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

    DECLARE @siteId int
    EXEC @siteId = proc_MSS_QLog_GetSiteId @siteGuid, @isSspLevel
    IF (@siteId IS NULL AND @isSspLevel <> 1) RETURN

    DECLARE @startDate smalldatetime
    SET @startDate = DATEADD(day, DATEDIFF(day, '1/1/2000', GETDATE()) - 30, '1/1/2000')

    DECLARE @stmt nvarchar(4000),
    @param nvarchar(4000)

    SELECT @param = N'@isSspLevel bit, @siteId int, @startDate smalldatetime'

    SELECT @stmt = N'
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
        SELECT TOP ' + Cast(@topResultsCount as NVARCHAR(15))
        +N'queryId, scopeId, numQueries, contextualScopeId
        FROM (
            SELECT queryId, scopeId, SUM(numQueries) AS numQueries, contextualScopeId
            FROM dbo.MSSQLogQuerySummary
            WHERE (searchDate >= @startDate) 
            AND (siteId = @siteId OR @isSspLevel = 1)
            GROUP BY queryId, scopeId, contextualScopeId
        ) as smr
        ORDER BY numQueries DESC
    ) AS t
    INNER JOIN dbo.MSSQLogScope AS s
    ON s.scopeId = t.scopeId
    INNER JOIN dbo.MSSQLogQueryString AS q
    ON q.queryId = t.queryId
    INNER JOIN dbo.MSSQLogContextualScope AS cs 
    ON cs.contextualScopeId = t.contextualScopeId
    INNER JOIN dbo.MSSQLogContextualScopeName AS csn 
    ON csn.contextualScopeNameId = cs.contextualScopeNameId
    LEFT OUTER JOIN MSSQLogUrl as cu 
    ON cu.urlId = cs.contextualScopeUrlId
    ORDER BY numQueries DESC'

    EXEC SP_EXECUTESQL  @stmt, @param, @isSspLevel, @siteId, @startDate

GO
