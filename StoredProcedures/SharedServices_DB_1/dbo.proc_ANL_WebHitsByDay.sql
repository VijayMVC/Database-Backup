/****** Object:  StoredProcedure [dbo].[proc_ANL_WebHitsByDay]    Script Date: 5/15/2018 12:11:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE PROCEDURE dbo.proc_ANL_WebHitsByDay
 @webGuid uniqueidentifier
as

BEGIN TRANSACTION
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

DECLARE @locked INT
EXEC @locked = proc_ANL_LockMasterTablesForRead
IF @locked = -1
BEGIN 
 ROLLBACK TRANSACTION
 RETURN 0
END

SELECT FullDate, sum(HitCount) AS Hits 
FROM ANLDay WITH (NOLOCK) LEFT OUTER JOIN ANLHitsByResourceByDay WITH (NOLOCK)
ON dbo.ANLHitsByResourceByDay.DayId = ANLDay.DayId
AND WebGuid = @webGuid
WHERE IsHistorical = 0
GROUP BY FullDate
ORDER BY FullDate ASC

ROLLBACK TRANSACTION
RETURN 1


GO
