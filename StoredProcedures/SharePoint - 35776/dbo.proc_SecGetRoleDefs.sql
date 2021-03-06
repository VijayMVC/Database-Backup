/****** Object:  StoredProcedure [dbo].[proc_SecGetRoleDefs]    Script Date: 5/15/2018 12:12:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetRoleDefs(
    @SiteId     uniqueidentifier,
    @ScopeId    uniqueidentifier)
AS
    SELECT 
        Roles.RoleId,
        Roles.Title,
        Roles.Description,
        Roles.Hidden,
        Roles.RoleOrder,
        Roles.Type,
        Roles.WebId,
        dbo.fn_GetHighBytes(Roles.PermMask),
        dbo.fn_GetLowBytes(Roles.PermMask),
        Roles.WebGroupId
    FROM
        Roles, Perms
    WHERE
        Roles.SiteId = @SiteId AND
        Roles.WebId = Perms.RoleDefWebId AND
        Perms.SiteId = @SiteId AND
        Perms.ScopeId = @ScopeId
    ORDER BY
        Roles.RoleOrder asc, Roles.Type desc

GO
