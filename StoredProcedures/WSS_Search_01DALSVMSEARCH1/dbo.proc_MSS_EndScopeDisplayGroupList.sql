/****** Object:  StoredProcedure [dbo].[proc_MSS_EndScopeDisplayGroupList]    Script Date: 5/15/2018 12:13:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_EndScopeDisplayGroupList(
    @DisplayGroupID int )
AS
    BEGIN TRAN
    DECLARE @LastError int
    DELETE FROM
        dbo.MSSScopeDisplayGroupMemberships
    WHERE
        DisplayGroupID = @DisplayGroupID AND
        Rank >= 0
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN
        ROLLBACK TRANSACTION
        RETURN @LastError
    END
    UPDATE
        dbo.MSSScopeDisplayGroupMemberships
    SET
        Rank = -1 - Rank
    WHERE
        DisplayGroupID = @DisplayGroupID
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN
        ROLLBACK TRAN
        RETURN @LastError
    END
    UPDATE
        dbo.MSSScopeDisplayGroups
    SET
        LastModifiedTime = GETUTCDATE()
    WHERE
        DisplayGroupID = @DisplayGroupID
    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN
        ROLLBACK TRAN
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
        ROLLBACK TRAN
        RETURN @LastError
    END
    COMMIT TRAN
    RETURN 0

GO
