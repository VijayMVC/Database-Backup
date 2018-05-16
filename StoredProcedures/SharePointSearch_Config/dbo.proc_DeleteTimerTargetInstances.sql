/****** Object:  StoredProcedure [dbo].[proc_DeleteTimerTargetInstances]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_DeleteTimerTargetInstances(
    @JobId uniqueidentifier)
AS
    SET NOCOUNT ON
    DELETE
        TimerTargetInstances
    WHERE
        JobId = @JobId

GO
