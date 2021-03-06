/****** Object:  StoredProcedure [dbo].[proc_GetTimerJobLastRunTime]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_GetTimerJobLastRunTime(
    @ServiceId uniqueidentifier,
    @VirtualServerId uniqueidentifier,
    @JobId uniqueidentifier,
    @LastRunTime datetime = NULL OUTPUT)
AS
    SET NOCOUNT ON
    SELECT
        @LastRunTime = MAX(StartTime)
    FROM
        TimerRunningJobs
    WHERE
        ServiceId = @ServiceId AND
        (VirtualServerId = @VirtualServerId OR
            (VirtualServerId IS NULL AND
                @VirtualServerId IS NULL)) AND
        JobId = @JobId
    IF (@LastRunTime IS NULL)
        RETURN 31
    RETURN 0

GO
