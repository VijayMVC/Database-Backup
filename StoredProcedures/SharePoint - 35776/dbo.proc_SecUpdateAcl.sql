/****** Object:  StoredProcedure [dbo].[proc_SecUpdateAcl]    Script Date: 5/15/2018 12:12:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecUpdateAcl(
    @SiteId       uniqueidentifier,
    @RoleDefWebId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @ScopeId    uniqueidentifier
    DECLARE curScopeId CURSOR FOR SELECT ScopeId 
    FROM 
        Perms 
    WHERE
        SiteId = @SiteId AND
        RoleDefWebId  = @RoleDefWebId
    OPEN curScopeId
    FETCH NEXT FROM curScopeId INTO @ScopeId
    WHILE (@@FETCH_STATUS = 0)
    BEGIN
        EXEC proc_SecUpdateAclForScope @SiteId, @ScopeId
        FETCH NEXT FROM curScopeId INTO @scopeId
    END
    CLOSE curScopeId
    DEALLOCATE curScopeId
    RETURN 0

GO
