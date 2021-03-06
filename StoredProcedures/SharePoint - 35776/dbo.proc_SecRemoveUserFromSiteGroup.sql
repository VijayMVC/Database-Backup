/****** Object:  StoredProcedure [dbo].[proc_SecRemoveUserFromSiteGroup]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecRemoveUserFromSiteGroup(
    @SiteId             uniqueidentifier,
    @GroupId            int,
    @UserIDToBeDeleted  int,
    @UserID             int,
    @SiteAdmin          bit,
    @BelongsToGroup     bit,
    @GroupOwnerId       int,
    @CurrentUserIsOwner bit)
AS
    SET NOCOUNT ON
    IF dbo.fn_CanUserEditMembershipOfGroup(
        @SiteId,
        @UserId,
        @SiteAdmin,
        @GroupId,
        @BelongsToGroup,
        @GroupOwnerId,
        @CurrentUserIsOwner,        
        @UserIDToBeDeleted) = 0
    BEGIN
        RETURN 5
    END
    DECLARE @DomainGroup bit
    SELECT 
        @DomainGroup = tp_DomainGroup
    FROM 
        UserInfo
    WHERE
        tp_SiteId = @SiteId AND
        tp_Id = @UserIDToBeDeleted
    DELETE FROM
        GroupMembership
    WHERE
        SiteID   = @SiteId AND
        MemberID = @UserIDToBeDeleted AND
        GroupID  = @GroupId
    EXEC proc_SecUpdateUserToken @SiteId, @UserIDToBeDeleted
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, @DomainGroup
    EXEC proc_LogChange @SiteId, NULL, NULL, @UserIDToBeDeleted, NULL, NULL, @GroupId,
        NULL, 4194304, 256, NULL
    DECLARE @data nvarchar(255)
    SET @data = N'<groupid>' + CONVERT(nvarchar(64), @GroupId) + 
               N'</groupid><user>' + CONVERT(nvarchar(64), @UserIDToBeDeleted)
               + N'</user>'    
    EXEC proc_AddSiteAuditEntryFromSql 
        @SiteId, 
        @UserID, 
        33,
        @data,
        0x00000100    
    RETURN 0

GO
