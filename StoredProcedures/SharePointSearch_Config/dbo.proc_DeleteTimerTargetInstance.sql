/****** Object:  StoredProcedure [dbo].[proc_DeleteTimerTargetInstance]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_DeleteTimerTargetInstance(
    @JobId uniqueidentifier,
    @TargetInstanceId uniqueidentifier,
    @Exists bit OUTPUT)
AS
    SET NOCOUNT ON
    DELETE
        TimerTargetInstances
    WHERE
        JobId = @JobId AND
        TargetInstanceId = @TargetInstanceId
    DECLARE @ReturnCode int
    EXEC @ReturnCode = 
        proc_GetTimerTargetInstance 
            @JobId,
            NULL,           
            @Exists OUTPUT
    RETURN @ReturnCode

GO
