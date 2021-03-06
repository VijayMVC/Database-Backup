/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_InsertQueryInfo]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_InsertQueryInfo
AS

BEGIN TRANSACTION  

SELECT TOP 1 clickId FROM MSSQLogUnprocessed WITH(TABLOCKX,HOLDLOCK)

IF (@@ROWCOUNT = 0)
BEGIN
    COMMIT TRANSACTION
    RETURN
END

INSERT INTO MSSQLogTemp WITH (TABLOCKX,HOLDLOCK) ([clickId],[queryString],[clickedUrl],[resultsUrl],[scope],[bestBet], [queryServer],[siteGuid],[searchTime],[clickTime],[searchDate],[clickedUrlRank], [numResults],[numHighConf],[numBestBets],[numScopes],[resultView],[advancedSearch], [didYouMean],[continued],[contextualScope],[contextualScopeUrl],[location])
SELECT [clickId],[queryString],[clickedUrl],[resultsUrl],[scope],[bestBet], [queryServer],[siteGuid],[searchTime],[clickTime],[searchDate],[clickedUrlRank], [numResults],[numHighConf],[numBestBets],[numScopes],[resultView],[advancedSearch], [didYouMean],[continued],[contextualScope],[contextualScopeUrl],[location] FROM MSSQLogUnprocessed 

TRUNCATE TABLE MSSQLogUnprocessed

INSERT INTO MSSQLogNonClickedTemp WITH (TABLOCKX,HOLDLOCK) ([clickId],[rank],[nonClickedUrl])
SELECT [clickId],[rank],[nonClickedUrl] FROM MSSQLogNonClickedUnprocessed WITH (TABLOCKX,HOLDLOCK)

TRUNCATE TABLE MSSQLogNonClickedUnprocessed

COMMIT TRANSACTION 

BEGIN TRANSACTION

UPDATE MSSQLogTemp WITH (TABLOCKX,HOLDLOCK) SET 
clickedUrlHash = binary_checksum(clickedUrl), 
queryStringHash = binary_checksum(queryString),
resultsUrlHash = binary_checksum(resultsUrl),
contextualScopeUrlHash = binary_checksum(contextualScopeUrl),
searchDate = DATEADD(day, DATEDIFF(day,'1/1/2000',searchTime), '1/1/2000')

DECLARE @Now datetime
SET @Now = GETDATE()

INSERT INTO MSSQLogSiteGuid WITH (TABLOCK, HOLDLOCK) (siteGuid) 
SELECT DISTINCT siteGuid from MSSQLogTemp AS t WHERE NOT EXISTS (
    SELECT * FROM MSSQLogSiteGuid AS g WHERE g.siteGuid = t.siteGuid)

UPDATE MSSQLogTemp SET siteId = g.siteId
FROM MSSQLogTemp as t INNER JOIN MSSQLogSiteGuid AS g
ON g.siteGuid = t.siteGuid

UPDATE MSSQLogSiteGuid SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogSiteGuid AS g
ON t.siteId = g.siteId

INSERT INTO MSSQLogScope WITH (TABLOCK, HOLDLOCK) (scope, numScopes) 
SELECT DISTINCT scope, numScopes from MSSQLogTemp AS t WHERE NOT EXISTS (
    SELECT * FROM MSSQLogScope AS s WHERE (s.scope = t.scope OR (t.scope IS NULL AND s.scope IS NULL)) AND (s.numScopes = t.numScopes))

UPDATE MSSQLogTemp SET scopeId = s.scopeId
FROM MSSQLogTemp as t INNER JOIN MSSQLogScope AS s
ON (t.scope = s.scope OR (t.scope IS NULL AND s.scope IS NULL)) AND (t.numScopes = s.numScopes)

UPDATE MSSQLogScope SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogScope AS s
ON t.scopeId = s.scopeId

INSERT INTO MSSQLogUrl WITH (TABLOCK, HOLDLOCK) (urlHash, url) 
SELECT DISTINCT clickedUrlHash, clickedUrl from MSSQLogTemp AS t WITH(INDEX(IX_MSSQLogTemp_ClickedUrlHash)) WHERE clickedUrl IS NOT NULL AND NOT EXISTS (
    SELECT * FROM MSSQLogUrl AS u WITH(INDEX(IX_MSSQLogUrl_Hash)) WHERE (u.urlHash = t.clickedUrlHash) AND (u.url = t.clickedUrl))

UPDATE MSSQLogTemp SET clickedUrlId = u.urlId
FROM MSSQLogTemp as t WITH(INDEX(IX_MSSQLogTemp_ClickedUrlHash)) INNER JOIN MSSQLogUrl AS u WITH(INDEX(IX_MSSQLogUrl_Hash)) 
ON (u.urlHash = t.clickedUrlHash) AND (u.url = t.clickedUrl)

UPDATE MSSQLogUrl SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogUrl AS u
ON u.urlId = t.clickedUrlId

INSERT INTO MSSQLogQueryString WITH (TABLOCK, HOLDLOCK) (queryStringHash, queryString) 
SELECT DISTINCT queryStringHash, queryString from MSSQLogTemp AS t WITH(INDEX(IX_MSSQLogTemp_QueryStringHash)) WHERE NOT EXISTS (
    SELECT * FROM MSSQLogQueryString AS q WITH(INDEX(IX_MSSQLogQueryString_Hash)) WHERE (q.queryStringHash = t.queryStringHash) AND (q.queryString = t.queryString))

UPDATE MSSQLogTemp SET queryId = q.queryId
FROM MSSQLogTemp as t WITH(INDEX(IX_MSSQLogTemp_QueryStringHash)) INNER JOIN MSSQLogQueryString AS q WITH(INDEX(IX_MSSQLogQueryString_Hash)) 
ON (q.queryStringHash = t.queryStringHash) AND (q.queryString = t.queryString)

UPDATE MSSQLogQueryString SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogQueryString AS c
ON c.queryId = t.queryId

INSERT INTO MSSQLogBestBet WITH (TABLOCK, HOLDLOCK) (bestBet)
SELECT DISTINCT bestBet from MSSQLogTemp AS t WHERE bestBet IS NOT NULL AND NOT EXISTS (
    SELECT * FROM MSSQLogBestBet AS b WHERE b.bestBet = t.bestBet)

UPDATE MSSQLogTemp SET bestBetId = b.bestBetId
FROM MSSQLogTemp as t INNER JOIN MSSQLogBestBet AS b
ON t.bestBet = b.bestBet

UPDATE MSSQLogBestBet SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogBestBet AS b
ON t.bestBetId = b.bestBetId

INSERT INTO MSSQLogLocation WITH (TABLOCK, HOLDLOCK) (location)
SELECT DISTINCT location from MSSQLogTemp AS t WHERE location IS NOT NULL AND NOT EXISTS (
    SELECT * FROM MSSQLogLocation AS l WHERE l.location = t.location)

UPDATE MSSQLogTemp SET locationId = l.locationId
FROM MSSQLogTemp as t INNER JOIN MSSQLogLocation AS l
ON t.location = l.location

UPDATE MSSQLogLocation SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogLocation AS l
ON t.locationId = l.locationId

INSERT INTO MSSQLogQueryServer WITH (TABLOCK, HOLDLOCK) (queryServer) 
SELECT DISTINCT queryServer from MSSQLogTemp AS t WHERE queryServer IS NOT NULL AND NOT EXISTS (
    SELECT * FROM MSSQLogQueryServer AS q WHERE q.queryServer = t.queryServer)

UPDATE MSSQLogTemp SET queryServerId = q.queryServerId
FROM MSSQLogTemp as t INNER JOIN MSSQLogQueryServer AS q
ON t.queryServer = q.queryServer

UPDATE MSSQLogQueryServer SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogQueryServer AS q
ON t.queryServerId = q.queryServerId

INSERT INTO MSSQLogUrl (urlHash, url)
SELECT DISTINCT resultsUrlHash, resultsUrl from MSSQLogTemp AS t WHERE resultsUrl IS NOT NULL AND NOT EXISTS (
    SELECT * FROM MSSQLogUrl AS u WITH(INDEX(IX_MSSQLogUrl_Hash)) WHERE u.urlHash = t.resultsUrlHash AND u.url = t.resultsUrl)

UPDATE MSSQLogTemp SET resultsUrlId = u.urlId
FROM MSSQLogTemp as t INNER JOIN MSSQLogUrl AS u WITH(INDEX(IX_MSSQLogUrl_Hash)) 
ON u.urlHash = t.resultsUrlHash AND t.resultsUrl = u.url

UPDATE MSSQLogUrl SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogUrl AS u
ON t.resultsUrlId = u.urlId

INSERT INTO MSSQLogUrl WITH (TABLOCK, HOLDLOCK) (urlHash, url) 
SELECT DISTINCT contextualScopeUrlHash, contextualScopeUrl from MSSQLogTemp AS t WHERE contextualScopeUrl IS NOT NULL AND NOT EXISTS (
    SELECT * FROM MSSQLogUrl AS u WITH(INDEX(IX_MSSQLogUrl_Hash)) WHERE (u.urlHash = t.contextualScopeUrlHash) AND (u.url = t.contextualScopeUrl))

UPDATE MSSQLogTemp SET contextualScopeUrlId = u.urlId
FROM MSSQLogTemp as t INNER JOIN MSSQLogUrl AS u WITH(INDEX(IX_MSSQLogUrl_Hash)) 
ON (u.urlHash = t.contextualScopeUrlHash) AND (u.url = t.contextualScopeUrl)

UPDATE MSSQLogUrl SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogUrl AS u
ON u.urlId = t.contextualScopeUrlId

INSERT INTO MSSQLogContextualScopeName WITH (TABLOCK, HOLDLOCK) (contextualScope) 
SELECT DISTINCT contextualScope from MSSQLogTemp AS t WHERE NOT EXISTS (
    SELECT * FROM MSSQLogContextualScopeName AS q WHERE (q.contextualScope = t.contextualScope OR (q.contextualScope IS NULL AND t.contextualScope IS NULL)))

UPDATE MSSQLogTemp SET contextualScopeNameId = q.contextualScopeNameId
FROM MSSQLogTemp as t INNER JOIN MSSQLogContextualScopeName AS q
ON (q.contextualScope = t.contextualScope OR (q.contextualScope IS NULL AND t.contextualScope IS NULL))

UPDATE MSSQLogContextualScopeName SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogContextualScopeName AS q
ON t.contextualScopeNameId = q.contextualScopeNameId

INSERT INTO MSSQLogContextualScope WITH (TABLOCK, HOLDLOCK) (contextualScopeNameId, contextualScopeUrlId) 
SELECT DISTINCT contextualScopeNameId, contextualScopeUrlId from MSSQLogTemp AS t WHERE NOT EXISTS (
    SELECT * FROM MSSQLogContextualScope AS s WHERE (s.contextualScopeNameId = t.contextualScopeNameId OR (t.contextualScopeNameId IS NULL AND s.contextualScopeNameId IS NULL)) AND ((s.contextualScopeUrlId = t.contextualScopeUrlId)  OR (t.contextualScopeUrlId IS NULL AND s.contextualScopeUrlId IS NULL)))

UPDATE MSSQLogTemp SET contextualScopeId = s.contextualScopeId
FROM MSSQLogTemp as t INNER JOIN MSSQLogContextualScope AS s
ON (s.contextualScopeNameId = t.contextualScopeNameId OR (t.contextualScopeNameId IS NULL AND s.contextualScopeNameId IS NULL)) AND ((s.contextualScopeUrlId = t.contextualScopeUrlId)  OR (t.contextualScopeUrlId IS NULL AND s.contextualScopeUrlId IS NULL))

UPDATE MSSQLogContextualScope SET lastReference = @Now
FROM MSSQLogTemp as t INNER JOIN MSSQLogContextualScope AS s
ON t.contextualScopeId = s.contextualScopeId

INSERT INTO MSSQLog WITH (TABLOCK) ([clickId], [queryId], [siteId], [clickedUrlId], [numResults], [numBestBets], [bestBetId], [scopeId], [clickedUrlRank], [searchTime], [clickTime], [advancedSearch], [resultsUrlId], [queryServerId], [numHighConf], [didYouMean], [resultView], [continued], [contextualScopeId], [locationId])
SELECT [clickId], [queryId], [siteId], [clickedUrlId], [numResults], [numBestBets], [bestBetId], [scopeId], [clickedUrlRank], [searchTime], [clickTime], [advancedSearch], [resultsUrlId], [queryServerId], [numHighConf], [didYouMean], [resultView], [continued], [contextualScopeId], [locationId] FROM MSSQLogTemp

INSERT INTO MSSQLogQuerySummaryTemp WITH (TABLOCK,HOLDLOCK) (searchDate1, siteId1, queryId1, scopeId1, numQueries1, clickThroughBase1, numClicks1, numZeroResults1, numZeroBestBets1, contextualScopeId1) 
SELECT 
    searchDate, 
    siteId, 
    queryId, 
    scopeId, 
    COUNT(*) AS numQueries, 
    SUM(CASE WHEN numResults > 0 AND continued = 0 THEN 1 ELSE 0 END) AS clickThroughBase,
    SUM(CASE WHEN numResults > 0 AND continued = 0 AND clickedUrl IS NOT NULL THEN 1 ELSE 0 END) AS numClicks, 
    SUM(CASE WHEN numResults = 0 THEN 1 ELSE 0 END) AS numZeroResults,
    SUM(CASE WHEN numBestBets = 0 THEN 1 ELSE 0 END) AS numZeroBestBets,
    contextualScopeId
FROM dbo.MSSQLogTemp
WHERE location IS NULL
GROUP BY searchDate, siteId, queryId, scopeId, contextualScopeId

INSERT INTO MSSQLogScopeSummaryTemp WITH (TABLOCK,HOLDLOCK) (searchDate1, siteId1, scopeId1, numQueries1, contextualScopeId1) 
SELECT 
    searchDate1, 
    siteId1, 
    scopeId1, 
    SUM(numQueries1) AS numQueries1,
    contextualScopeId1
FROM dbo.MSSQLogQuerySummaryTemp
GROUP BY searchDate1, siteId1, scopeId1, contextualScopeId1

INSERT INTO MSSQLogHistoricalTemp WITH (TABLOCK,HOLDLOCK) (searchDate1, siteId1, numQueries1) 
SELECT 
    searchDate1, 
    siteId1, 
    SUM(numQueries1) AS numQueries1
FROM dbo.MSSQLogScopeSummaryTemp AS t
GROUP BY siteId1, searchDate1

INSERT INTO MSSQLogResultsUrlSummaryTemp WITH (TABLOCK,HOLDLOCK) (searchDate1, siteId1, queryId1, resultsUrlId1, numQueries1) 
SELECT 
    searchDate, 
    siteId, 
    queryId, 
    resultsUrlId,
    COUNT(*) AS numQueries
FROM dbo.MSSQLogTemp
GROUP BY searchDate, siteId, queryId, resultsUrlId

INSERT INTO MSSQLogClickedUrlSummaryTemp WITH (TABLOCK,HOLDLOCK) (searchDate1, siteId1, clickedUrlId1, numClicks1) 
SELECT 
    searchDate, 
    siteId, 
    clickedUrlId, 
    COUNT(*) AS numClicks
FROM dbo.MSSQLogTemp
WHERE clickedUrl IS NOT NULL
GROUP BY searchDate, siteId, clickedUrlId

INSERT INTO MSSQLogBestBetSummaryTemp WITH (TABLOCK,HOLDLOCK) (searchDate1, siteId1, bestBetId1, numClicks1) 
SELECT 
    searchDate, 
    siteId, 
    bestBetId, 
    COUNT(*) AS numClicks
FROM dbo.MSSQLogTemp
WHERE bestBetId IS NOT NULL
GROUP BY searchDate, siteId, bestBetId

INSERT INTO MSSQLogLocationSummaryTemp WITH (TABLOCK,HOLDLOCK) (searchDate1, siteId1, locationId1, clickThroughBase1, numClicks1, numQueries1)
SELECT 
    searchDate, 
    siteId, 
    locationId, 
    SUM(CASE WHEN numResults > 0 AND continued = 0 THEN 1 ELSE 0 END) AS clickThroughBase,
    SUM(CASE WHEN numResults > 0 AND continued = 0 AND clickedUrl IS NOT NULL THEN 1 ELSE 0 END) AS numClicks, 
    COUNT(*) AS numQueries
FROM dbo.MSSQLogTemp
WHERE locationId IS NOT NULL
GROUP BY searchDate, siteId, locationId

INSERT INTO MSSQLogHistorical WITH (TABLOCK,HOLDLOCK) (searchDate, siteId, numQueries) 
SELECT searchDate1, siteId1, 0 FROM MSSQLogHistoricalTemp AS t
WHERE NOT EXISTS (
    SELECT * FROM MSSQLogHistorical AS h
    WHERE h.siteId = t.siteId1
    AND h.searchDate = t.searchDate1
)

UPDATE MSSQLogHistorical
SET 
    numQueries = numQueries + t.numQueries1
FROM MSSQLogHistoricalTemp AS t
WHERE siteId = t.siteId1
AND searchDate = t.searchDate1

INSERT INTO MSSQLogScopeSummary WITH (TABLOCK,HOLDLOCK) (searchDate, siteId, scopeId, numQueries, contextualScopeId) 
SELECT searchDate1, siteId1, scopeId1, 0, contextualScopeId1 FROM MSSQLogScopeSummaryTemp AS t
WHERE NOT EXISTS (
    SELECT * FROM MSSQLogScopeSummary AS h
    WHERE h.siteId = t.siteId1
    AND h.searchDate = t.searchDate1
    AND h.scopeId = t.scopeId1
    AND h.contextualScopeId = t.contextualScopeId1
)

UPDATE MSSQLogScopeSummary
SET 
    numQueries = numQueries + t.numQueries1
FROM MSSQLogScopeSummaryTemp AS t
WHERE siteId = t.siteId1
AND searchDate = t.searchDate1
AND scopeId = t.scopeId1
AND contextualScopeId = t.contextualScopeId1

INSERT INTO MSSQLogClickedUrlSummary WITH (TABLOCK,HOLDLOCK) (searchDate, siteId, clickedUrlId, numClicks) 
SELECT searchDate1, siteId1, clickedUrlId1, 0 FROM MSSQLogClickedUrlSummaryTemp AS t
WHERE NOT EXISTS (
    SELECT * FROM MSSQLogClickedUrlSummary AS h
    WHERE h.siteId = t.siteId1
    AND h.searchDate = t.searchDate1
    AND h.clickedUrlId = t.clickedUrlId1
)

UPDATE MSSQLogClickedUrlSummary
SET 
    numClicks = numClicks + t.numClicks1
FROM MSSQLogClickedUrlSummaryTemp AS t
WHERE siteId = t.siteId1
AND searchDate = t.searchDate1
AND clickedUrlId = t.clickedUrlId1

INSERT INTO MSSQLogBestBetSummary WITH (TABLOCK,HOLDLOCK) (searchDate, siteId, bestBetId, numClicks) 
SELECT searchDate1, siteId1, bestBetId1, 0 FROM MSSQLogBestBetSummaryTemp AS t
WHERE NOT EXISTS (
    SELECT * FROM MSSQLogBestBetSummary AS h
    WHERE h.siteId = t.siteId1
    AND h.searchDate = t.searchDate1
    AND h.bestBetId = t.bestBetId1
)

UPDATE MSSQLogBestBetSummary
SET 
    numClicks = numClicks + t.numClicks1
FROM MSSQLogBestBetSummaryTemp AS t
WHERE siteId = t.siteId1
AND searchDate = t.searchDate1
AND bestBetId = t.bestBetId1

INSERT INTO MSSQLogLocationSummary WITH (TABLOCK,HOLDLOCK) (searchDate, siteId, locationId,  clickThroughBase, numClicks, numQueries) 
SELECT searchDate1, siteId1, locationId1, 0, 0, 0  FROM MSSQLogLocationSummaryTemp AS t
WHERE NOT EXISTS (
    SELECT * FROM MSSQLogLocationSummary AS h
    WHERE h.siteId = t.siteId1
    AND h.searchDate = t.searchDate1
    AND h.locationId = t.locationId1
)

UPDATE MSSQLogLocationSummary
SET 
    clickThroughBase = clickThroughBase + t.clickThroughBase1,
    numClicks = numClicks + t.numClicks1,
    numQueries = numQueries + t.numQueries1 
FROM MSSQLogLocationSummaryTemp AS t
WHERE siteId = t.siteId1
AND searchDate = t.searchDate1
AND locationId = t.locationId1

INSERT INTO MSSQLogQuerySummary WITH (TABLOCK,HOLDLOCK) (searchDate, siteId, queryId, scopeId, numQueries, clickThroughBase, numClicks, numZeroResults, numZeroBestBets, contextualScopeId) 
SELECT searchDate1, siteId1, queryId1, scopeId1, 0, 0, 0, 0, 0, contextualScopeId1 FROM MSSQLogQuerySummaryTemp AS t
WHERE NOT EXISTS 
(
    SELECT * FROM MSSQLogQuerySummary AS q
    WHERE t.siteId1 = q.siteId
    AND t.searchDate1 = q.searchDate
    AND t.queryId1 = q.queryId
    AND t.scopeId1 = q.scopeId
    AND t.contextualScopeId1 = q.contextualScopeId
)

UPDATE MSSQLogQuerySummary 
SET 
    numQueries = numQueries + t.numQueries1, 
    clickThroughBase = clickThroughBase + t.clickThroughBase1, 
    numClicks = numClicks + t.numClicks1, 
    numZeroResults = numZeroResults + t.numZeroResults1, 
    numZeroBestBets = numZeroBestBets + t.numZeroBestBets1
FROM MSSQLogQuerySummaryTemp AS t
WHERE t.siteId1 = siteId
AND t.searchDate1 = searchDate
AND t.queryId1 = queryId
AND t.scopeId1 = scopeId
AND t.contextualScopeId1 = contextualScopeId

INSERT INTO MSSQLogResultsUrlSummary WITH (TABLOCK,HOLDLOCK) (searchDate, siteId, queryIdX, resultsUrlId, numQueries) 
SELECT searchDate1, siteId1, queryId1, resultsUrlId1, 0 FROM MSSQLogResultsUrlSummaryTemp AS t
WHERE NOT EXISTS 
(
    SELECT * FROM MSSQLogResultsUrlSummary AS q
    WHERE t.siteId1 = q.siteId
    AND t.searchDate1 = q.searchDate
    AND t.queryId1 = q.queryIdX
    AND t.resultsUrlId1 = q.resultsUrlId
)

UPDATE MSSQLogResultsUrlSummary 
SET 
    numQueries = numQueries + t.numQueries1
FROM MSSQLogResultsUrlSummaryTemp AS t
WHERE t.siteId1 = siteId
AND t.searchDate1 = searchDate
AND t.queryId1 = queryIdX
AND t.resultsUrlId1 = resultsUrlId

TRUNCATE TABLE MSSQLogHistoricalTemp
TRUNCATE TABLE MSSQLogQuerySummaryTemp
TRUNCATE TABLE MSSQLogResultsUrlSummaryTemp
TRUNCATE TABLE MSSQLogScopeSummaryTemp
TRUNCATE TABLE MSSQLogClickedUrlSummaryTemp
TRUNCATE TABLE MSSQLogBestBetSummaryTemp
TRUNCATE TABLE MSSQLogLocationSummaryTemp
TRUNCATE TABLE MSSQLogTemp

COMMIT TRANSACTION 

BEGIN TRANSACTION

UPDATE MSSQLogNonClickedTemp WITH (TABLOCKX,HOLDLOCK) SET nonClickedUrlHash = binary_checksum(nonClickedUrl)

INSERT INTO MSSQLogUrl WITH (TABLOCK, HOLDLOCK) (urlHash, url) 
SELECT DISTINCT nonClickedUrlHash, nonClickedUrl from MSSQLogNonClickedTemp AS t WHERE NOT EXISTS (
    SELECT * FROM MSSQLogUrl AS u WHERE u.urlHash = t.nonClickedUrlHash AND u.url = t.nonClickedUrl)

UPDATE MSSQLogNonClickedTemp SET nonClickedUrlId = u.urlId
FROM MSSQLogNonClickedTemp as t INNER JOIN MSSQLogUrl AS u
ON u.urlHash = t.nonClickedUrlHash AND t.nonClickedUrl = u.url

UPDATE MSSQLogUrl SET lastReference = @Now
FROM MSSQLogNonClickedTemp as t INNER JOIN MSSQLogUrl AS u
ON t.nonClickedUrlId = u.urlId

INSERT INTO MSSQLogNonClicked WITH (TABLOCK) (clickId, rank, nonClickedUrlId) 
SELECT clickId, rank, nonClickedUrlId FROM MSSQLogNonClickedTemp

TRUNCATE TABLE MSSQLogNonClickedTemp

COMMIT TRANSACTION


GO
