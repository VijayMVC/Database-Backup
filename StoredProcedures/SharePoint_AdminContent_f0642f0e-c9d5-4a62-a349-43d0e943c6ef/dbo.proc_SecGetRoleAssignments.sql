/****** Object:  StoredProcedure [dbo].[proc_SecGetRoleAssignments]    Script Date: 5/15/2018 12:12:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetRoleAssignments(
	@SiteId uniqueidentifier,
	@ScopeId uniqueidentifier)
AS
    SET NOCOUNT ON
    SELECT 
        RoleAssignment.PrincipalId, 
        Roles.PermMask
    FROM
        RoleAssignment
    INNER JOIN
        Roles
    ON
        RoleAssignment.SiteId = Roles.SiteId AND
        RoleAssignment.RoleId = Roles.RoleId
    INNER JOIN
        Perms
    ON
        Roles.SiteId = Perms.SiteId  AND
        Roles.WebId = Perms.RoleDefWebId 
    WHERE 
        RoleAssignment.SiteId = @SiteId AND
        RoleAssignment.ScopeId = @ScopeId AND
        Perms.ScopeId = @ScopeId AND
        Perms.SiteId = @SiteId
    ORDER BY
        RoleAssignment.PrincipalId  

GO
