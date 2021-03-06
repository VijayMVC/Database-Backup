/****** Object:  StoredProcedure [dbo].[proc_MSS_ShareScopesCompilationInfo]    Script Date: 5/15/2018 12:13:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ShareScopesCompilationInfo(
    @CompilationPercentComplete smallint,
    @QueryServers int,
    @ShouldBeCompiling bit OUTPUT )
AS
    DECLARE @LastError int
    UPDATE
        dbo.MSSScopesSystem
    SET
        QueryServers = @QueryServers
    BEGIN TRAN
    IF ( ( SELECT CompilationScheduleType 
           FROM dbo.MSSScopesSystem ) = 1 )
    BEGIN
        IF ( GETUTCDATE() > ( SELECT NextCompilationTime
                              FROM dbo.MSSScopesSystem ) )
            EXEC @LastError = dbo.proc_MSS_StartScopesCompilation
        IF @LastError <> 0  
        BEGIN
            ROLLBACK TRANSACTION
            RETURN @LastError
        END
    END
    SET @ShouldBeCompiling = 0
    IF ( ( SELECT CompilationState FROM dbo.MSSScopesSystem ) = 0 )
    BEGIN
        IF ( ( SELECT StartCompilation FROM dbo.MSSScopesSystem ) = 1 )
        BEGIN
            SET @ShouldBeCompiling = 1
            UPDATE 
                dbo.MSSScopesSystem 
            SET
                CompilationState = 1,
                CompilationPercentComplete = 0,
                StartCompilation = 0
        END
    END
    ELSE
    BEGIN
        SET @ShouldBeCompiling = ~( SELECT StopCompilation FROM dbo.MSSScopesSystem )
    END
    SELECT @LastError = @@ERROR
    IF @LastError <> 0  
    BEGIN
        ROLLBACK TRANSACTION
        RETURN @LastError
    END
    UPDATE
        dbo.MSSScopesSystem
    SET
        CompilationPercentComplete = @CompilationPercentComplete
    SELECT @LastError = @@ERROR
    IF @LastError <> 0  
    BEGIN
        ROLLBACK TRANSACTION
        RETURN @LastError
    END
    COMMIT TRAN
    RETURN 0

GO
