/****** Object:  StoredProcedure [dbo].[proc_ANL_LockShadowTables]    Script Date: 5/15/2018 12:11:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

--
-- @Wait: specifies whether or not to wait for the lock.
--  0  : don't wait for the lock.
--  1  : queue up and wait indefinitely for the lock.
--
-- Returns: returns 0 if the lock was acquired, -1 if it could not be acquired.
--
-- Locks ANLShadowLock exclusively, marking all of the shadow tables as locked
-- for reading and writing from any other clients. There is no timeout 
-- parameter - all lock attempts either succeed or immediately fail. A 
-- succesful lock will be held for the duration of the current transaction.
--
-- Note that if @Wait is 1 then this procedure will always return 0 or fail
-- due to an error. It will only return -1 if @Wait is 1 and the lock has been
-- acquired by another process.
--
-- NOTE: even though this stored procedure may attempt to wait indefinitely for
-- a lock it may be killed if its outer transaction is not expecting to wait 
-- that long. Therefore, LOCK_TIMEOUT should be set to indefinite before
-- calling this procedure.
--
CREATE PROCEDURE dbo.proc_ANL_LockShadowTables
	@Wait AS TINYINT
AS

-- Save the timeout before changing it.
DECLARE @OriginalTimeout int
SET @OriginalTimeout = @@LOCK_TIMEOUT

IF @Wait = 0
 SET LOCK_TIMEOUT 0
ELSE
 SET LOCK_TIMEOUT -1 
DECLARE @result int

EXEC @result = sp_getapplock 'ANLShadowLock', 'Exclusive'

-- Restore the old timeout.
DECLARE @sql nvarchar(4000)
SET @sql = N'SET LOCK_TIMEOUT ' + cast(@OriginalTimeout AS NVARCHAR(10))
EXEC sp_executesql @sql

-- sp_getapplock returns 0 or 1 for success or a negative number if it could 
-- not be acquired.
IF @result < 0
 RETURN -1
ELSE
 RETURN 0


GO
