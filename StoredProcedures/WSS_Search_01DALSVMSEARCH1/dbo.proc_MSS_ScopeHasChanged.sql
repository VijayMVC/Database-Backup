/****** Object:  StoredProcedure [dbo].[proc_MSS_ScopeHasChanged]    Script Date: 5/15/2018 12:13:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_ScopeHasChanged(
    @ScopeID int,
    @ModifierName nvarchar( 60 ) )
AS
    DECLARE @LastError int
    UPDATE
        dbo.MSSScopesSystem
    SET
        LastChangeID = LastChangeID + 1
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
        RETURN @LastError
    DECLARE
        @LastChangeID int
    SELECT 
        @LastChangeID = LastChangeID
    FROM 
        dbo.MSSScopesSystem
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
        RETURN @LastError
    DECLARE
        @CompilationType smallint,
        @CompilationState smallint,
        @ConsumerID int
    SELECT
        @CompilationType = CompilationType,
        @CompilationState = CompilationState,
        @ConsumerID = ConsumerID
    FROM
        dbo.MSSScopes
    WHERE
        ScopeID = @ScopeID
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
        RETURN @LastError
    EXEC @LastError = dbo.proc_MSS_ConsumerHasChanged @ConsumerID
    IF @LastError <> 0
        RETURN @LastError
    UPDATE
        dbo.MSSScopes
    SET
        LastModifiedTime = GETUTCDATE(),
        LastModifiedBy = @ModifierName,
        LastChangeID = @LastChangeID
    WHERE
        ScopeID = @ScopeID
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
        RETURN @LastError
    DECLARE 
        @NumInclusions int
    SELECT
        @NumInclusions = COUNT(*)
    FROM
        dbo.MSSScopeRules
    WHERE
        ScopeID = @ScopeID AND
        ( FilterBehavior = 0 OR
          FilterBehavior = 1 )
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
        RETURN @LastError
    IF ( @NumInclusions = 0 )
    BEGIN
        UPDATE
            dbo.MSSScopes
        SET
            CompilationState = 0
        WHERE
            ScopeID = @ScopeID
        RETURN @@ERROR
    END
    IF ( @CompilationType = 0 )
    BEGIN
        DECLARE
            @NumRules int
        SELECT
            @NumRules = COUNT(*)
        FROM
            dbo.MSSScopeRules
        WHERE
            ScopeID = @ScopeID
        SELECT @LastError = @@ERROR
        IF @LastError <> 0
            RETURN @LastError
        IF ( @NumRules <= 24 )
        BEGIN
            UPDATE
                dbo.MSSScopes
            SET
                CompilationState = 2
            WHERE
                ScopeID = @ScopeID
            RETURN @@ERROR
        END
    END
    DECLARE        
        @NewCompilationState smallint
    IF ( @CompilationState = 0 OR
         @CompilationState = 2 )
        SET 
            @NewCompilationState = 3
    ELSE 
        BEGIN
        IF ( @CompilationState = 4 )
            SET
                @NewCompilationState = 5
        ELSE
            SET
                @NewCompilationState = @CompilationState
        END
    UPDATE
        dbo.MSSScopes
    SET 
        CompilationState = @NewCompilationState
    WHERE
        ScopeID = @ScopeID
    RETURN @@ERROR

GO
