/****** Object:  StoredProcedure [dbo].[proc_SecRemoveUserFromSiteGroupByLogin]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecRemoveUserFromSiteGroupByLogin(
    @SiteId             uniqueidentifier,
    @GroupId            int,
    @LoginName          nvarchar(255),
    @UserID             int,
    @SiteAdmin          bit,
    @BelongsToGroup     bit,
    @GroupOwnerId       int, 
    @CurrentUserIsOwner bit)
AS
    SET NOCOUNT ON
    DECLARE @Ret int
    DECLARE @UserIDToBeDeleted int
    SELECT
        @UserIDToBeDeleted = UserInfo.tp_Id
    FROM
        UserInfo
    WHERE
        UserInfo.tp_SiteId = @SiteId AND
        UserInfo.tp_Login = @LoginName AND
        UserInfo.tp_Deleted = 0
    IF @UserIDToBeDeleted IS NOT NULL
    BEGIN
        EXEC @Ret = proc_SecRemoveUserFromSiteGroup @SiteId, @GroupId, 
            @UserIDToBeDeleted, @UserID, @SiteAdmin, @BelongsToGroup,
            @GroupOwnerId, @CurrentUserIsOwner
    END
    ELSE
    BEGIN
        SET @Ret = 1317
    END
    RETURN @Ret

GO
