/****** Object:  StoredProcedure [dbo].[proc_SecGetRoleBindingsForAllPrincipals]    Script Date: 5/15/2018 12:12:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetRoleBindingsForAllPrincipals(
    @SiteId     uniqueidentifier,
    @ScopeId    uniqueidentifier)
AS
    DECLARE @RoleDefWebId uniqueidentifier
    SET NOCOUNT ON
    SELECT 
        @RoleDefWebId = RoleDefWebId
    FROM
        Perms
    WHERE
        SiteId = @SiteId AND
        ScopeId = @ScopeId
    SELECT
        RoleId, 
        PrincipalId
    FROM
        RoleAssignment
    INNER JOIN
        UserInfo
    ON
        RoleAssignment.PrincipalId = UserInfo.tp_ID
    WHERE
        RoleAssignment.SiteId = @SiteId AND
        RoleAssignment.ScopeId = @ScopeId AND
        UserInfo.tp_SiteID = @SiteId AND
        UserInfo.tp_Deleted = 0
    UNION
    SELECT
        RoleId, 
        PrincipalId
    FROM
        RoleAssignment
    INNER JOIN
        Groups
    ON
        RoleAssignment.PrincipalId = Groups.ID
    WHERE
        RoleAssignment.SiteId = @SiteId AND
        RoleAssignment.ScopeId = @ScopeId AND
        Groups.SiteId = @SiteId
    ORDER BY
        RoleAssignment.PrincipalId

GO
