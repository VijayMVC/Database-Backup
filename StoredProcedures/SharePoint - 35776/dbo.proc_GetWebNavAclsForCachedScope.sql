/****** Object:  StoredProcedure [dbo].[proc_GetWebNavAclsForCachedScope]    Script Date: 5/15/2018 12:12:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetWebNavAclsForCachedScope(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @NavParentWebId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @Size int
    SELECT @Size = DATALENGTH(CachedNavScope) FROM Webs WHERE Id = @WebId
    IF (@Size > 1800)
    BEGIN
            SELECT NULL, NULL, NULL
            RETURN 0
    END
    IF @NavParentWebId IS NOT NULL
    BEGIN
         SELECT @Size = DATALENGTH(CachedNavScope) FROM Webs 
             WHERE SiteId = @SiteId AND Id = @NavParentWebId
        IF (@Size > 1800)
        BEGIN
                SELECT NULL, NULL, NULL
                RETURN 0
        END
   END
    DECLARE @ExecStr nvarchar(4000)
    DECLARE @NavParentScopeId uniqueidentifier
    SET @ExecStr = N'
SELECT
  Perms.ScopeId,
  Perms.Acl,
  Perms.AnonymousPermMask
FROM
  Perms
WHERE
  Perms.SiteId=@SiteId AND (Perms.ScopeId IN '
    SELECT
        @ExecStr = @ExecStr +
            CAST(ISNULL(CachedNavScope, N'(NULL)') AS varchar(1900))
    FROM
        Webs
    WHERE
        SiteId = @SiteId AND
        Id = @WebId
    IF @NavParentWebId IS NOT NULL
    BEGIN
        SET @ExecStr = @ExecStr +
            N' OR Perms.ScopeId=@NavParentScopeId OR Perms.ScopeId IN '
        SELECT
            @NavParentScopeId = ScopeId,
            @ExecStr = @ExecStr +
                CAST(ISNULL(CachedNavScope, N'(NULL)') AS varchar(1900))
        FROM
            Webs
        WHERE
            SiteId = @SiteId AND
            Id = @NavParentWebId
    END
    SET @ExecStr = @ExecStr + N')'
    EXEC sp_executesql @ExecStr,
                       N'@SiteId uniqueidentifier,@NavParentScopeId uniqueidentifier',
                       @SiteId, @NavParentScopeId
    RETURN 0 

GO
