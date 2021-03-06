/****** Object:  StoredProcedure [dbo].[proc_MSS_DropScope]    Script Date: 5/15/2018 12:13:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DropScope(
    @ScopeID int,
    @ModifierName nvarchar( 300 ) )
AS
    BEGIN TRAN
    DECLARE @LastError int
    DECLARE
        @ChangeID int
    SET 
        @ChangeID = ( SELECT LastChangeID 
                      FROM dbo.MSSScopes
                      WHERE ScopeID = @ScopeID )
    IF ( @ChangeID IS NULL )
    BEGIN
        COMMIT TRAN
        RETURN
    END
    DELETE FROM
        dbo.MSSScopes
    WHERE
        ScopeID = @ScopeID 
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN 
        ROLLBACK TRAN
        RETURN @LastError
    END
    INSERT INTO
        dbo.MSSDeletedScopes
    VALUES (
        @ScopeID,
        @ChangeID
    )
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN 
        ROLLBACK TRAN
        RETURN @LastError
    END
    EXEC
        @LastError = dbo.proc_MSS_ScopeHasChanged @ScopeID, @ModifierName
    IF @LastError <> 0
    BEGIN 
        ROLLBACK TRAN
        RETURN @LastError
    END
    UPDATE
        dbo.MSSScopeDisplayGroups
    SET
        DefaultScopeID = -1
    WHERE
        DefaultScopeID = @ScopeID
    IF @LastError <> 0
    BEGIN 
        ROLLBACK TRAN
        RETURN @LastError
    END
    COMMIT TRAN
    RETURN 0

GO
