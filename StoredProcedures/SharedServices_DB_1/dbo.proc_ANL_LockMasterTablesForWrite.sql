/****** Object:  StoredProcedure [dbo].[proc_ANL_LockMasterTablesForWrite]    Script Date: 5/15/2018 12:11:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

--
-- Returns: 0 if the lock was acquired, -1 if the lock was not acquired.
--
-- Used during usage processing to prevent clients from trying to render 
-- reports while the master tables are being populated with and their indexes 
-- are dropped. 
--
-- Locks the ANLMasterLock table exclusively, marking all of the master tables
-- as locked for reading and writing from any other clients. There is no
-- timeout parameter - the wait is indefinite. A succesful lock will be held 
-- for the duration of the current transaction.
--
-- Note that there should not be more than one writer waiting for this lock
-- because the only writer should be the log processing task and there should 
-- never be two instances of the log processor trying to write at the same 
-- time.
--
CREATE PROCEDURE dbo.proc_ANL_LockMasterTablesForWrite
AS

-- Save the timeout before changing it.
DECLARE @OriginalTimeout int
SET @OriginalTimeout = @@LOCK_TIMEOUT
SET LOCK_TIMEOUT -1

DECLARE @result int
EXEC @result = sp_getapplock 'ANLMasterLock', 'Exclusive'

-- Restore the old timeout.
DECLARE @sql nvarchar(4000)
SET @sql = N'SET LOCK_TIMEOUT ' + cast(@OriginalTimeout AS nvarchar(10))
EXEC sp_executesql @sql

-- sp_getapplock returns 0 or 1 for success or a negative number if it could 
-- not be acquired.
IF @result < 0
 RETURN -1
ELSE
 RETURN 0


GO
