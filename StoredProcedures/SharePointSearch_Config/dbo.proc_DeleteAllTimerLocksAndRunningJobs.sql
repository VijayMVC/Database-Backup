/****** Object:  StoredProcedure [dbo].[proc_DeleteAllTimerLocksAndRunningJobs]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_DeleteAllTimerLocksAndRunningJobs(
    @ServerName nvarchar(128),
    @AbortRunningJobs bit)
AS
    SET NOCOUNT ON
    DELETE
        TimerLocks
    WHERE
        LockedByServerName = @ServerName
    IF (@AbortRunningJobs = 1)
    BEGIN
        UPDATE
            TimerRunningJobs
        SET
            Status = 5
        WHERE
            ServerName = @ServerName AND
            Status = 1
    END
    ELSE
    BEGIN
        DELETE
            TimerRunningJobs
        WHERE
            ServerName = @ServerName
    END

GO
