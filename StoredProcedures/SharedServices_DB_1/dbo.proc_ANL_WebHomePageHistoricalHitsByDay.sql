/****** Object:  StoredProcedure [dbo].[proc_ANL_WebHomePageHistoricalHitsByDay]    Script Date: 5/15/2018 12:11:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE PROCEDURE dbo.proc_ANL_WebHomePageHistoricalHitsByDay
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

SELECT FullDate, ISNULL(HomePageHits,0) AS Hits
FROM ANLDay WITH (NOLOCK) LEFT OUTER JOIN ANLHistoricalWebUsage WITH (NOLOCK)
ON dbo.ANLDay.DayId = ANLHistoricalWebUsage.DayId
AND WebGuid = @webGuid
ORDER BY ANLDay.DayId ASC

ROLLBACK TRANSACTION
RETURN 1


GO
