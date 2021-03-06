/****** Object:  StoredProcedure [dbo].[proc_ANL_TestMasterLockIsFree]    Script Date: 5/15/2018 12:11:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

-- Attempts to get a Master lock to determine whether the Master lock has 
-- already been taken exclusively.
CREATE PROCEDURE dbo.proc_ANL_TestMasterLockIsFree
AS

BEGIN TRANSACTION
DECLARE @locked INT
EXEC @locked = proc_ANL_LockMasterTablesForRead
ROLLBACK TRANSACTION

IF @locked = -1
 RETURN 0
ELSE
 RETURN 1


GO
