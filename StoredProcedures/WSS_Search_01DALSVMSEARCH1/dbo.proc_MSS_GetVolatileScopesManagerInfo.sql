/****** Object:  StoredProcedure [dbo].[proc_MSS_GetVolatileScopesManagerInfo]    Script Date: 5/15/2018 12:13:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetVolatileScopesManagerInfo(
    @AverageCompilationDuration int OUTPUT,
    @LastCompilationTime datetime OUTPUT,
    @NextCompilationTime datetime OUTPUT,
    @CompilationState int OUTPUT,
    @CompilationStartTime datetime OUTPUT,
    @CompilationPercentComplete smallint OUTPUT,
    @ScopesNeedingCompilation int OUTPUT )
AS
    EXEC
        @CompilationPercentComplete = proc_MSS_CalculateScopeCompilationPercentComplete
    SELECT
        @AverageCompilationDuration = AverageCompilationDuration,
        @LastCompilationTime = LastCompilationTime,
        @NextCompilationTime = NextCompilationTime,
        @CompilationState = CompilationState | StartCompilation,
        @CompilationStartTime = CompilationStartTime
    FROM
        dbo.MSSScopesSystem
    SELECT
        @ScopesNeedingCompilation = COUNT(*)
    FROM
        dbo.MSSScopes
    WHERE
        LastChangeID > ( SELECT LastCompilationID FROM dbo.MSSScopesSystem )
    RETURN @@ERROR

GO
