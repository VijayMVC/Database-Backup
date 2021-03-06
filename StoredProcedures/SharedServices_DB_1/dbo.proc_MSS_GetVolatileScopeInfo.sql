/****** Object:  StoredProcedure [dbo].[proc_MSS_GetVolatileScopeInfo]    Script Date: 5/15/2018 12:11:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_GetVolatileScopeInfo(
    @ScopeID int,
    @CompilationState smallint OUTPUT,
    @LastCompilationTime datetime OUTPUT )
AS
    SELECT
        @CompilationState = CompilationState,
        @LastCompilationTime = LastCompilationTime
    FROM
        dbo.MSSScopes
    WHERE
        ScopeID = @ScopeID

    IF @@ROWCOUNT = 0
        RETURN 1
    ELSE
        RETURN @@ERROR

GO
