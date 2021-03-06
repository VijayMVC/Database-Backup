/****** Object:  StoredProcedure [dbo].[proc_MSS_AddScopeRule]    Script Date: 5/15/2018 12:11:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_AddScopeRule(
    @ScopeID  int,
    @FilterBehavior smallint,
    @RuleType smallint,   
    @UrlRuleType smallint,
    @PropertyID int,        
    @UserValueString nvarchar( 2048 ),
    @ModifierName nvarchar( 60 ),
    @RuleID int OUTPUT )
AS
    BEGIN TRAN
    DECLARE @LastError int

    INSERT INTO
        dbo.MSSScopeRules
    VALUES (
        @ScopeID,
        @FilterBehavior,
        @RuleType,
        @UrlRuleType,
        @PropertyID,
        @UserValueString
    )

    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN
        ROLLBACK TRANSACTION
        RETURN @LastError
    END

    SET
        @RuleID = @@IDENTITY

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
