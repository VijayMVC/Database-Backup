/****** Object:  StoredProcedure [dbo].[proc_SecRemovePrincipalFromAllAcls]    Script Date: 5/15/2018 12:12:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecRemovePrincipalFromAllAcls(
    @SiteId       uniqueidentifier,
    @PrincipalId  int)
AS
    SET NOCOUNT ON
    BEGIN TRAN
    DECLARE @ScopeList table (ScopeId uniqueidentifier)
    INSERT
        INTO @ScopeList
    SELECT DISTINCT
        ScopeId
    FROM
        RoleAssignment
    WHERE
        RoleAssignment.SiteId = @SiteId AND
        RoleAssignment.PrincipalId = @PrincipalId
    DELETE
        RoleAssignment
    WHERE
        SiteId = @SiteId AND
        PrincipalId = @PrincipalId
    DECLARE @ScopeId      uniqueidentifier
    DECLARE curScopeId CURSOR FOR SELECT ScopeId
    FROM @ScopeList
    OPEN curScopeId
    FETCH NEXT FROM curScopeId INTO @ScopeId
    WHILE (@@FETCH_STATUS = 0)
    BEGIN
        EXEC proc_SecUpdateAclForScope @SiteId, @ScopeId
        FETCH NEXT FROM curScopeId INTO @scopeId
    END
    CLOSE curScopeId
    DEALLOCATE curScopeId
    COMMIT TRAN
    RETURN 0

GO
