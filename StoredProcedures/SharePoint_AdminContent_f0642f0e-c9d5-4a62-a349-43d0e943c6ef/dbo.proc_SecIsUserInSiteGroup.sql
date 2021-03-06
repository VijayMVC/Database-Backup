/****** Object:  StoredProcedure [dbo].[proc_SecIsUserInSiteGroup]    Script Date: 5/15/2018 12:12:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecIsUserInSiteGroup(
    @SiteId uniqueidentifier,
    @Login nvarchar(255),
    @GroupTitle nvarchar(255))
AS
    SET NOCOUNT ON
    IF EXISTS (
        SELECT 
            *
        FROM
            UserInfo
        INNER JOIN GroupMembership ON 
            UserInfo.tp_SiteID = GroupMembership.SiteId AND 
            UserInfo.tp_ID = GroupMembership.MemberId
        INNER JOIN Groups ON 
            GroupMembership.SiteId = Groups.SiteId AND 
            Groups.Id = GroupMembership.GroupId
        WHERE
            tp_SiteId = @SiteId AND            
            tp_Login = @Login AND
            Groups.Title = @GroupTitle AND
            tp_Deleted = 0)
    RETURN 1
    ELSE
    RETURN 0

GO
