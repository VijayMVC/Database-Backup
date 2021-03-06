/****** Object:  StoredProcedure [dbo].[proc_DeleteTimerRunningJobs]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_DeleteTimerRunningJobs(
    @ServiceId uniqueidentifier, 
    @VirtualServerId uniqueidentifier,
    @JobId uniqueidentifier,
    @ServerName nvarchar(128) = NULL)
AS
    SET NOCOUNT ON
    DELETE
        TimerRunningJobs
    WHERE
        ServiceId = @ServiceId AND
        (VirtualServerId = @VirtualServerId OR
            (VirtualServerId IS NULL AND
                @VirtualServerId IS NULL)) AND
        JobId = @JobId AND
        (ServerName = @ServerName OR
            @ServerName IS NULL)

GO
