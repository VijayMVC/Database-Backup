/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_QueriesByScope]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_QueriesByScope
 @siteGuid uniqueidentifier,
 @isSspLevel bit
AS

    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

    DECLARE @siteId int
    EXEC @siteId = proc_MSS_QLog_GetSiteId @siteGuid, @isSspLevel
    IF (@siteId IS NULL AND @isSspLevel <> 1) RETURN

    DECLARE @startDate smalldatetime
    SET @startDate = DATEADD(day, DATEDIFF(day, '1/1/2000', GETDATE()) - 30, '1/1/2000')

    SELECT TOP 100 PERCENT scope, numScopes, numQueries, contextualScope FROM 
    (
        SELECT scopeId, SUM(numQueries) AS numQueries, csn.contextualScope
        FROM  dbo.MSSQLogScopeSummary as lss, dbo.MSSQLogContextualScope as cs, dbo.MSSQLogContextualScopeName as csn
        WHERE (searchDate >= @startDate)
        AND (siteId = @siteId OR @isSspLevel = 1)
        AND (lss.contextualScopeId = cs.contextualScopeId)
        AND (cs.contextualScopeNameId = csn.contextualScopeNameId OR (cs.contextualScopeNameId IS NULL AND csn.contextualScopeNameId IS NULL))
        GROUP BY scopeId, csn.contextualScope
    ) AS t
    INNER JOIN dbo.MSSQLogScope AS s
    ON t.scopeId = s.scopeId
    ORDER BY numQueries DESC

GO
