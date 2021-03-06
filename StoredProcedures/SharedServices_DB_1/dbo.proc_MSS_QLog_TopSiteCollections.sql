/****** Object:  StoredProcedure [dbo].[proc_MSS_QLog_TopSiteCollections]    Script Date: 5/15/2018 12:11:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_QLog_TopSiteCollections
 @siteGuid uniqueidentifier, 
 @isSspLevel bit 
AS

    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

    SELECT siteGuid, numQueries 
    FROM 
    (
        SELECT siteId, SUM(numQueries) AS numQueries
        FROM  dbo.MSSQLogHistorical
        WHERE (searchDate >= DATEADD(day, DATEDIFF(day, '1/1/2000', GETDATE()) - 30, '1/1/2000'))
        GROUP BY siteId
    ) AS t 
    INNER JOIN dbo.MSSQLogSiteGuid AS g
    ON g.siteId = t.siteId
    ORDER BY numQueries DESC 

GO
