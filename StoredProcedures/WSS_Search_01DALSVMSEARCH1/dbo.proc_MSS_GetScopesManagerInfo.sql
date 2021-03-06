/****** Object:  StoredProcedure [dbo].[proc_MSS_GetScopesManagerInfo]    Script Date: 5/15/2018 12:13:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetScopesManagerInfo(
    @AverageCompilationDuration int OUTPUT,
    @CompilationScheduleType smallint OUTPUT,
    @CustomCompilationSchedule nvarchar( 60 ) OUTPUT,
    @LastCompilationTime datetime OUTPUT,
    @NextCompilationTime datetime OUTPUT,
    @CompilationState int OUTPUT,
    @CompilationStartTime datetime OUTPUT,
    @CompilationPercentComplete smallint OUTPUT,
    @ScopesNeedingCompilation int OUTPUT )
AS
    SET @ScopesNeedingCompilation = ( SELECT COUNT(*)
                                      FROM dbo.MSSScopes
                                      WHERE  CompilationState = 3 OR
                                             CompilationState = 5)
    EXEC
        @CompilationPercentComplete = proc_MSS_CalculateScopeCompilationPercentComplete
    SELECT
        @AverageCompilationDuration = AverageCompilationDuration,
        @CompilationScheduleType = CompilationScheduleType,
        @CustomCompilationSchedule = CustomCompilationSchedule,
        @LastCompilationTime = LastCompilationTime,
        @NextCompilationTime = NextCompilationTime,
        @CompilationState = CompilationState | StartCompilation,
        @CompilationStartTime = CompilationStartTime
    FROM
        dbo.MSSScopesSystem
    RETURN @@ERROR

GO
