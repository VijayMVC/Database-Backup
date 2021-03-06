/****** Object:  StoredProcedure [dbo].[proc_ANL_LockMasterTablesForRead]    Script Date: 5/15/2018 12:11:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

--
-- Returns: 0 if the lock was acquired, -1 if the lock was not acquired.
--
-- Used during report rendering to prevent the master tables from being updated
-- or their indexes dropped by usage processing. Takes out a shared lock on the
-- ANLMasterLock table.
--
-- There is no timeout parameter - all lock attempts either succeed or 
-- immediately fail. A succesful lock will be held for the duration of the 
-- current transaction. 
--
CREATE PROCEDURE dbo.proc_ANL_LockMasterTablesForRead
AS

-- Save the timeout before changing it.
DECLARE @OriginalTimeout int
SET @OriginalTimeout = @@LOCK_TIMEOUT
SET LOCK_TIMEOUT 0 -- 100

-- Try to get the lock 3 times before giving up.
DECLARE @tries int
SELECT @tries = 0

DECLARE @result int
SELECT @result = -1

WHILE @tries < 3 AND @result < 0
BEGIN
 EXEC @result = sp_getapplock 'ANLMasterLock', 'Shared'

 -- Somehow we get timeouts (even when there is nobody holding a lock that 
 -- should block) and sp_getapplock returns NULL. We'll treat this as a normal
 -- timeout.
 IF @result IS NULL
  SELECT @result = -1

 SELECT @tries = @tries + 1
END

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
