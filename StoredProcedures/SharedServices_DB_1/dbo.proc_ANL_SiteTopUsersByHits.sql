/****** Object:  StoredProcedure [dbo].[proc_ANL_SiteTopUsersByHits]    Script Date: 5/15/2018 12:11:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE PROCEDURE dbo.proc_ANL_SiteTopUsersByHits
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

SELECT TOP 5 UserName, CAST(SUM(HitCount) AS FLOAT)/@days As AvgHits 
FROM ANLHitsByResourceByUserByDay WITH (NOLOCK)
WHERE SiteGuid = @siteGuid
GROUP BY UserName
ORDER BY AvgHits DESC 

ROLLBACK TRANSACTION
RETURN 1


GO
