/****** Object:  StoredProcedure [dbo].[proc_ANL_WebUsersByHits]    Script Date: 5/15/2018 12:11:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE PROCEDURE dbo.proc_ANL_WebUsersByHits
 @webGuid uniqueidentifier
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

SELECT TOP 300 UserName, CAST(SUM(HitCount) AS FLOAT)/@days As AvgHits 
FROM ANLHitsByResourceByUserByDay WITH (NOLOCK)
WHERE WebGuid = @webGuid
GROUP BY UserName
ORDER BY AvgHits DESC 

ROLLBACK TRANSACTION
RETURN 1


GO
