/****** Object:  StoredProcedure [dbo].[proc_SecAddUserToSiteGroup]    Script Date: 5/15/2018 12:12:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecAddUserToSiteGroup(
    @SiteId uniqueidentifier,
    @GroupId            int,
    @UserIDToBeAdded    int,
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
        @UserIDToBeAdded) = 0
    BEGIN
        RETURN 5
    END
    BEGIN TRAN
    DECLARE @DomainGroup bit
    IF NOT EXISTS (
        SELECT
            *
        FROM
            GroupMembership
        WHERE
            SiteId = @SiteId AND
            GroupId = @GroupId AND
            MemberId = @UserIDToBeAdded)
    BEGIN
        INSERT INTO GroupMembership(
            SiteID,
            GroupID,
            MemberID)
        VALUES(
            @SiteId,
            @GroupId,
            @UserIDToBeAdded)
        EXEC proc_SecAddWebMembershipByGroup @SiteId, @GroupId, @UserIDToBeAdded
        SELECT 
            @DomainGroup = tp_DomainGroup
        FROM 
            UserInfo
        WHERE
            tp_SiteId = @SiteId AND
            tp_Id = @UserIDToBeAdded
        EXEC proc_SecUpdateUserToken @SiteId, @UserIDToBeAdded
        EXEC proc_SecUpdateUserActiveStatus @SiteId, @UserIDToBeAdded
        EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, @DomainGroup
        EXEC proc_LogChange @SiteId, NULL, NULL, @UserIDToBeAdded, NULL, NULL, @GroupId,
            NULL, 2097152, 256, NULL
    END
    COMMIT
    DECLARE @data nvarchar(255)
    SET @data = N'<groupid>' + CONVERT(nvarchar(64), @GroupId) + 
                N'</groupid><user>' + CONVERT(nvarchar(64), @UserIDToBeAdded) 
                + N'</user>'
    EXEC proc_AddSiteAuditEntryFromSql 
        @SiteId, 
        @UserID, 
        32,
        @data,
        0x00000100    

GO
