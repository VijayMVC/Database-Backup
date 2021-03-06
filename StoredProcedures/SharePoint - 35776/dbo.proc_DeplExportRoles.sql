/****** Object:  StoredProcedure [dbo].[proc_DeplExportRoles]    Script Date: 5/15/2018 12:11:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplExportRoles(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @RoleIdCur int)
AS
    SET NOCOUNT ON
    SELECT TOP 100
        Roles.SiteId,
        Webs.Id,
        Roles.RoleId,
        Roles.Title,
        Roles.Description,
        Roles.PermMask,
        Roles.Hidden,
        Roles.RoleOrder,
        Roles.Type
    FROM
        Roles
    JOIN
        Perms
    ON
        Perms.SiteId = Roles.SiteId AND
        Perms.RoleDefWebId = Roles.WebId
    JOIN
        Webs
    ON
        Roles.SiteId = Webs.SiteId AND
        Perms.ScopeId = Webs.ScopeId
    WHERE
        Roles.SiteId = @SiteId AND
        Webs.Id = @WebId AND
        Roles.RoleId > @RoleIdCur
    ORDER BY
        Roles.SiteId, Webs.Id, Roles.RoleId

GO
