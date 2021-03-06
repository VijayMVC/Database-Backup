/****** Object:  StoredProcedure [dbo].[proc_MSS_DropScopeDisplayGroup]    Script Date: 5/15/2018 12:11:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_MSS_DropScopeDisplayGroup(
    @DisplayGroupID int )
AS
    BEGIN TRANSACTION
    DECLARE @LastError int

    IF NOT EXISTS ( SELECT * FROM dbo.MSSScopeDisplayGroups WHERE DisplayGroupID = @DisplayGroupID )
        RETURN 1

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

    DELETE FROM
        dbo.MSSScopeDisplayGroups
    WHERE
        DisplayGroupID = @DisplayGroupID

    SELECT @LastError = @@ERROR
    IF @LastError <> 0
    BEGIN 
        ROLLBACK TRANSACTION
        RETURN @LastError
    END

    COMMIT TRANSACTION
    RETURN 0

GO
