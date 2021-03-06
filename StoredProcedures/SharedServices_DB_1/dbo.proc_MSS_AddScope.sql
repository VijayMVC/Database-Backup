/****** Object:  StoredProcedure [dbo].[proc_MSS_AddScope]    Script Date: 5/15/2018 12:11:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_AddScope(
    @Name nvarchar( 60 ),
    @Description nvarchar( 300 ),
    @ConsumerName nvarchar( 60 ),   
    @DisplayInAdminUI bit,
    @AlternateResultsPageUrl nvarchar( 2048 ) = NULL,
    @CompilationType smallint,        
    @ModifierName nvarchar( 60 ),
    @ScopeID int OUTPUT )
AS
    DECLARE @LastError int

    DECLARE
        @ConsumerID int
    SELECT
        @ConsumerID = ConsumerID
    FROM
        dbo.MSSRegisteredConsumers
    WHERE
        ConsumerName = @ConsumerName

    IF @@ROWCOUNT = 0
        RETURN 1
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
        RETURN @LastError

    BEGIN TRAN

    INSERT INTO
        dbo.MSSScopes
    VALUES (
        @Name,
        @Description,
        @ConsumerID,
        @DisplayInAdminUI,
        @AlternateResultsPageUrl,
        @CompilationType,
        0,
        NULL,
        GETUTCDATE(),
        @ModifierName,
        0
    )

    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN
        ROLLBACK TRANSACTION
        RETURN @LastError
    END

    SET
        @ScopeID = @@IDENTITY

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
