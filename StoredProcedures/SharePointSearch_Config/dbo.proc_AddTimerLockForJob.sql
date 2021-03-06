/****** Object:  StoredProcedure [dbo].[proc_AddTimerLockForJob]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_AddTimerLockForJob(
    @JobId uniqueidentifier, 
    @ServerName nvarchar(128),
    @LockTimeout int,
    @LockStatus int OUTPUT,
    @LockExpiredServerName nvarchar(128) OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @LockedByServerName nvarchar(128)
    DECLARE @LockedTime datetime
    DECLARE @Now datetime
    SET @Now = GETUTCDATE()
    SELECT
        @LockedByServerName = LockedByServerName,
        @LockedTime = LockedTime
    FROM
        TimerLocks
    WHERE
        JobId = @JobId
    IF (@@ERROR <> 0)
    BEGIN
        SET @LockStatus = 4
        RETURN 167
    END
    IF (@LockedByServerName IS NULL AND @LockedTime IS NULL)
    BEGIN
        INSERT INTO TimerLocks(
            JobId,
            LockedByServerName,
            LockedTime)
        VALUES(
            @JobId,
            @ServerName,
            @Now)
        IF (@@ROWCOUNT = 1)
        BEGIN
            SET @LockStatus = 2
            RETURN 0
        END
        ELSE
        BEGIN
            SET @LockStatus = 1
            RETURN 0
        END
    END
    ELSE
    BEGIN
        UPDATE
            TimerLocks
        SET
            LockedByServerName = @ServerName,
            LockedTime = @Now
        WHERE
            JobId = @JobId AND
            (LockedByServerName = @ServerName OR
                DATEADD(minute, @LockTimeout, @LockedTime) < @Now)
        IF (@@ROWCOUNT = 1)
        BEGIN
            IF (@LockedByServerName = @ServerName)
            BEGIN
                SET @LockStatus = 2
                RETURN 0
            END               
            ELSE
            BEGIN
                SET @LockStatus = 3
                SET @LockExpiredServerName = @LockedByServerName
                RETURN 0
            END
        END
        ELSE
        BEGIN
            SET @LockStatus = 1
            RETURN 0
        END             
    END
    RETURN 167        

GO
