/****** Object:  StoredProcedure [dbo].[proc_ANL_WebUniqueUsersByDay]    Script Date: 5/15/2018 12:11:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE PROCEDURE dbo.proc_ANL_WebUniqueUsersByDay
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

SELECT ANLDay.FullDate, COUNT(DISTINCT ANLHit.UserId) AS UniqueUsers
FROM ANLDay WITH (NOLOCK) LEFT OUTER JOIN 
	(ANLResource WITH (NOLOCK) INNER JOIN ANLHit WITH (NOLOCK) ON dbo.ANLHit.ResourceId = ANLResource.ResourceId AND ANLResource.WebGuid = @webGuid)
ON dbo.ANLHit.DayId = ANLDay.DayId
WHERE IsHistorical = 0
GROUP BY ANLDay.FullDate
ORDER BY ANLDay.FullDate ASC

ROLLBACK TRANSACTION
RETURN 1


GO
