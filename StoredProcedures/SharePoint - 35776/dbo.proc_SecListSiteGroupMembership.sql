/****** Object:  StoredProcedure [dbo].[proc_SecListSiteGroupMembership]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecListSiteGroupMembership(
    @SiteId uniqueidentifier,
    @GroupId int,
    @CurrentUserId int,
    @SiteAuditor bit,
    @BelongsToGroup bit,
    @GroupOwnerId int,
    @CurrentUserIsOwner bit)
AS
    SET NOCOUNT ON
    DECLARE @Visible bit
    SET @Visible = dbo.fn_CanUserViewMembershipOfGroup(
        @SiteId, 
        @CurrentUserId, 
        @SiteAuditor, 
        @GroupId,
        @BelongsToGroup,
        @GroupOwnerId,
        @CurrentUserIsOwner)
    SELECT
        tp_ID,
        tp_SystemID,
        tp_Title,
        tp_Login,
        tp_Email,
        tp_Notes,
        tp_SiteAdmin,
        tp_DomainGroup
    FROM
        UserInfo
    INNER JOIN
        GroupMembership
    ON
        UserInfo.tp_SiteId = @SiteId AND
        UserInfo.tp_ID = GroupMembership.MemberId
    WHERE
        UserInfo.tp_Deleted = 0 AND
        GroupMembership.SiteId = @SiteId AND
        GroupMembership.GroupID = @GroupId AND
        @Visible = 1
    IF @Visible = 0
        RETURN 5
    RETURN 0

GO
