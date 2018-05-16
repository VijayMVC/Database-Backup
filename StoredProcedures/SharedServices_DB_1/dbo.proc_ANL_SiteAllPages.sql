/****** Object:  StoredProcedure [dbo].[proc_ANL_SiteAllPages]    Script Date: 5/15/2018 12:11:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE PROCEDURE dbo.proc_ANL_SiteAllPages
 @siteGuid uniqueidentifier
AS

BEGIN TRANSACTION
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

DECLARE @locked INT
EXEC @locked = proc_ANL_LockMasterTablesForRead
IF @locked = -1
BEGIN 
 ROLLBACK TRANSACTION
 RETURN 0
END

DECLARE @days INT
SELECT @days = dbo.fn_ANL_GetNumDetailedReportingDays()

SELECT TOP 300 h.FullUrl, h.DocName, CAST(SUM(h.HitCount) AS FLOAT)/@days AS AvgDailyHits
FROM ANLHitsByResourceByDay h WITH (NOLOCK)
WHERE (h.SiteGuid = @siteGuid)
GROUP BY h.SiteGuid, h.DocName, h.FullUrl
ORDER BY AvgDailyHits DESC

ROLLBACK TRANSACTION
RETURN 1


GO
