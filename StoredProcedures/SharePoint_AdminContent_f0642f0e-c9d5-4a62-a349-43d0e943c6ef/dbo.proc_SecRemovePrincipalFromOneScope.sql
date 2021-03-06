/****** Object:  StoredProcedure [dbo].[proc_SecRemovePrincipalFromOneScope]    Script Date: 5/15/2018 12:12:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecRemovePrincipalFromOneScope(
    @SiteId         uniqueidentifier,
    @ScopeId        uniqueidentifier,
    @PrincipalId    int,
    @RoleId         int = NULL)
AS
    DELETE FROM
        RoleAssignment
    WHERE
        SiteId      = @SiteId AND
        ScopeId     = @ScopeId AND
        PrincipalId = @PrincipalId AND
        (@RoleId IS NULL OR RoleId = @RoleId)
    IF @@ROWCOUNT <> 0
    BEGIN
        EXEC proc_SecUpdateAclForScope @SiteId, @ScopeId
        RETURN 1
    END
    ELSE
        RETURN 0

GO
