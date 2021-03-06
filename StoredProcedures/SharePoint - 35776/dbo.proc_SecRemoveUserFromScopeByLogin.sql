/****** Object:  StoredProcedure [dbo].[proc_SecRemoveUserFromScopeByLogin]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecRemoveUserFromScopeByLogin(
    @SiteId     uniqueidentifier,
    @WebId      uniqueidentifier,
    @WebScopeId uniqueidentifier,
    @ScopeId    uniqueidentifier,
    @LoginName  nvarchar(255),
    @RoleId     int = NULL)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    DECLARE @UserId int
    SELECT
        @UserId = UserInfo.tp_Id
    FROM
        UserInfo
    WHERE
        UserInfo.tp_SiteId = @SiteId AND
        UserInfo.tp_Login = @LoginName AND
        UserInfo.tp_Deleted = 0
    IF @UserId IS NOT NULL
    BEGIN
        EXEC @Ret = proc_SecRemovePrincipalFromScope 
            @SiteId, @WebId, @WebScopeId, @ScopeId, @UserId, @RoleId
    END
    ELSE
    BEGIN
        SET @Ret = 1317
    END
    RETURN @Ret

GO
