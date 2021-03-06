/****** Object:  StoredProcedure [dbo].[proc_MSS_DropScopeRule]    Script Date: 5/15/2018 12:11:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DropScopeRule(
    @RuleID int,
    @ModifierName nvarchar( 300 ) )
AS
    BEGIN TRAN
    DECLARE @LastError int

    DECLARE
        @ScopeID int
    SELECT
        @ScopeID = ScopeID
    FROM
        dbo.MSSScopeRules
    WHERE
        RuleID = @RuleID

    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN
        ROLLBACK TRANSACTION
        RETURN @LastError
    END

    DELETE FROM
        dbo.MSSScopeRules
    WHERE
        RuleID = @RuleID

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

    COMMIT TRAN
    RETURN 0

GO
