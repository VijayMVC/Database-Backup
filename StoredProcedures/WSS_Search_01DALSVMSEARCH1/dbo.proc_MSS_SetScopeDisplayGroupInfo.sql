/****** Object:  StoredProcedure [dbo].[proc_MSS_SetScopeDisplayGroupInfo]    Script Date: 5/15/2018 12:13:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_SetScopeDisplayGroupInfo(
    @DisplayGroupID int,
    @Name nvarchar( 60 ),
    @Description nvarchar( 300 ),
    @DisplayInAdminUI bit,
    @Undeletable bit,
    @DefaultScopeID int,
    @ModifierName nvarchar( 60 ) )
AS
    BEGIN TRANSACTION
    DECLARE @LastError int
    UPDATE
        dbo.MSSScopeDisplayGroups
    SET
        Name = @Name,
        Description = @Description,
        DisplayInAdminUI = @DisplayInAdminUI,
        Undeletable = @Undeletable,
        DefaultScopeID = @DefaultScopeID,
        LastModifiedTime = GETUTCDATE(),
        LastModifiedBy = @ModifierName
    WHERE
        DisplayGroupID = @DisplayGroupID
    SELECT @LastError = @@ERROR
    IF @@ROWCOUNT = 0
    BEGIN
        ROLLBACK TRANSACTION
        RETURN 1
    END
    IF @LastError <> 0
    BEGIN 
        ROLLBACK TRANSACTION
        RETURN @LastError
    END
    DECLARE
        @ConsumerID int
    SET
        @ConsumerID = ( SELECT ConsumerID 
                        FROM dbo.MSSScopeDisplayGroups 
                        WHERE DisplayGroupID = @DisplayGroupID )
    EXEC
        @LastError = dbo.proc_MSS_ConsumerHasChanged @ConsumerID
    IF @LastError <> 0
    BEGIN
        ROLLBACK TRANSACTION
        RETURN @LastError
    END
    COMMIT TRANSACTION
    RETURN 0

GO
