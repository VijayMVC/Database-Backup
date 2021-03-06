/****** Object:  View [dbo].[MSSQLogDetail]    Script Date: 5/15/2018 12:14:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW dbo.MSSQLogDetail
AS
SELECT      u2.url AS clickedUrl, qs.queryString, g.siteGuid, 
                      s.scope, b.bestBet, q.numResults, q.numBestBets, q.clickedUrlRank, q.searchTime, 
                      q.clickTime, q.advancedSearch, q.continued, u1.url AS resultsUrl, sv.queryServer, 
                      q.numHighConf, q.didYouMean, q.resultView, csn.contextualScope, cu.url as contextualScopeUrl 
FROM         dbo.MSSQLog AS q INNER JOIN
                      dbo.MSSQLogQueryString AS qs ON q.queryId = qs.queryId LEFT OUTER JOIN
                      dbo.MSSQLogScope AS s ON q.scopeId = s.scopeId LEFT OUTER JOIN
                      dbo.MSSQLogQueryServer AS sv ON q.queryServerId = sv.queryServerId LEFT OUTER JOIN
                      dbo.MSSQLogUrl AS u1 ON q.resultsUrlId = u1.urlId LEFT OUTER JOIN
                      dbo.MSSQLogUrl AS u2 ON q.clickedUrlId = u2.urlId LEFT OUTER JOIN
                      dbo.MSSQLogBestBet AS b ON q.bestBetId = b.bestBetId INNER JOIN
                      dbo.MSSQLogSiteGuid AS g ON q.siteId = g.siteId INNER JOIN
                      dbo.MSSQLogContextualScope as cs ON q.contextualScopeId = cs.contextualScopeId INNER JOIN
                      dbo.MSSQLogContextualScopeName as csn ON cs.contextualScopeNameId = csn.contextualScopeNameId LEFT OUTER JOIN
                      dbo.MSSQLogUrl AS cu ON cs.contextualScopeUrlId = cu.urlId

GO
