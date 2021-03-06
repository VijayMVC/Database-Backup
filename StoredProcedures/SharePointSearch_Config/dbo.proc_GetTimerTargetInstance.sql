/****** Object:  StoredProcedure [dbo].[proc_GetTimerTargetInstance]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE dbo.proc_GetTimerTargetInstance(
    @JobId uniqueidentifier,
    @TargetInstanceId uniqueidentifier,
    @Exists bit OUTPUT)
AS
    SET NOCOUNT ON
    IF EXISTS(
        SELECT
            *
        FROM
            TimerTargetInstances
        WHERE
            JobId = @JobId AND
            (TargetInstanceId = @TargetInstanceId
                OR @TargetInstanceId IS NULL))
    BEGIN
        SET @Exists = 1
    END
    ELSE
    BEGIN
        SET @Exists = 0
    END
    RETURN 0

GO
