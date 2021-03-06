/****** Object:  StoredProcedure [dbo].[proc_SecRemoveGroup]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecRemoveGroup(
    @SiteId       uniqueidentifier,
    @GroupId      int,
    @UserID       int,
    @SiteAdmin    bit,
    @GroupOwnerId   int,
    @CurrentUserIsOwner bit)    
AS
    SET NOCOUNT ON
    DECLARE @RootWebId uniqueidentifier
    DECLARE @UserInfoListId uniqueidentifier
    DECLARE @UserInfoListServerTemplate int
    DECLARE @GroupTitle nvarchar(255)
    IF dbo.fn_CanUserManageGroup(@SiteId, @UserId, @SiteAdmin, @GroupId, @GroupOwnerId, @CurrentUserIsOwner) = 0 RETURN 5
    SELECT 
        @RootWebId = RootWebId,
        @UserInfoListId = UserInfoListId
    FROM
        Sites
    WHERE
        Id = @SiteId
    SELECT 
        @UserInfoListServerTemplate = Lists.tp_ServerTemplate
    FROM
        Lists
    WHERE
        Lists.tp_WebId = @RootWebId AND
        Lists.tp_ID = @UserInfoListId
    BEGIN TRAN
    DECLARE @UserList table (UserId int)
    INSERT
        INTO @UserList
    SELECT
        MemberID
    FROM
        GroupMembership
    WHERE
        SiteId  = @SiteId AND
        GroupID = @GroupId
    DELETE FROM
        GroupMembership
    WHERE
        SiteID = @SiteId AND
        GroupID = @GroupId
    SELECT
        @GroupTitle = Title
    FROM
        Groups
    WHERE
        SiteID = @SiteId AND
        ID = @GroupId
    SELECT
        DLAlias
    FROM
        Groups
    WHERE
        SiteID = @SiteId AND
        ID = @GroupId AND
        DLAlias IS NOT NULL AND
        DLAlias != ''
    DELETE FROM
        Groups
    WHERE
        SiteID = @SiteId AND
        ID = @GroupId
    EXEC proc_DropListRecord
        @SiteId,
        @RootWebId,
        @UserInfoListId,
        @UserInfoListServerTemplate,
        @GroupId,
        1,     
        0,     
        NULL   
    UPDATE
        Groups
    SET
        Owner = @UserID,
        OwnerIsUser = 1
    WHERE
        SiteID = @SiteId AND
        Owner = @GroupId
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, 1
    EXEC proc_SecRemovePrincipalFromAllAcls @SiteId, @GroupId
    DECLARE @uid    int
    DECLARE curUid CURSOR FOR SELECT UserId
    FROM @UserList
    OPEN curUid
    FETCH NEXT FROM curUid INTO @uid
    WHILE (@@FETCH_STATUS = 0)
    BEGIN
        EXEC proc_SecUpdateUserToken @SiteId, @uid
        FETCH NEXT FROM curUid INTO @uid
    END
    CLOSE curUid
    DEALLOCATE curUid
    EXEC proc_LogChange @SiteId, NULL, NULL, NULL, NULL, NULL, @GroupId,
        NULL, 16384, 256, NULL, @GroupTitle
    COMMIT TRAN
    DECLARE @data nvarchar(255)
    SET @data = N'<groupid>' + CONVERT(nvarchar(64), @GroupId) + N'</groupid>'
    EXEC proc_AddSiteAuditEntryFromSql 
        @SiteId, 
        @UserID, 
        31,
        @data,
        0x00000100    
    RETURN 0

GO
