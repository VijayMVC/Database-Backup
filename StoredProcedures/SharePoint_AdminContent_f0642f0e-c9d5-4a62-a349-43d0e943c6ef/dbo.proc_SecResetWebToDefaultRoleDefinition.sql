/****** Object:  StoredProcedure [dbo].[proc_SecResetWebToDefaultRoleDefinition]    Script Date: 5/15/2018 12:12:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecResetWebToDefaultRoleDefinition(
    @WebId                      uniqueidentifier,
    @AuthorID                   int,
    @AdminsName                 nvarchar(255),
    @AdminsDescription          nvarchar(512),
    @AdminsPermMask             tPermMask,
    @AuthorsName                nvarchar(255),
    @AuthorsDescription         nvarchar(512),
    @AuthorsPermMask            tPermMask,
    @ContributorsName           nvarchar(255),
    @ContributorsDescription    nvarchar(512),
    @ContributorsPermMask       tPermMask,
    @BrowsersName               nvarchar(255),
    @BrowsersDescription        nvarchar(512),
    @BrowsersPermMask           tPermMask,
    @GuestsName                 nvarchar(255),
    @GuestsDescription          nvarchar(512),
    @GuestsPermMask             tPermMask,
    @AnonymousPermMask          tPermMask,
    @ScopeId                    uniqueidentifier OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @WebFullUrl nvarchar(256)
    DECLARE @SiteId uniqueidentifier
    DECLARE @FirstUniqueAncestor uniqueidentifier
    DECLARE @RoleDefWebId uniqueidentifier
    DECLARE @DirName nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    SELECT
        @SiteId = Webs.SiteId,
        @FirstUniqueAncestor = Webs.FirstUniqueAncestorWebId,
        @ScopeId = Webs.ScopeId,
        @RoleDefWebId = Perms.RoleDefWebId,
        @WebFullUrl = Webs.FullUrl
    FROM
        Webs, Perms
    WHERE
        Webs.Id = @WebId AND
        Webs.ScopeId = Perms.ScopeId AND
        Perms.RoleDefWebId <> @WebId
    IF @WebFullUrl IS NULL
    BEGIN
        RETURN 3
    END
    EXEC proc_SplitUrl @WebFullUrl, @DirName output, @LeafName output
    BEGIN TRAN
    IF @WebId <> @FirstUniqueAncestor
    BEGIN
        SELECT @ScopeId = NEWID()
        EXEC proc_SecAddPermScopeForWeb @SiteId, @ScopeId, @WebId, @WebId, @AnonymousPermMask, @WebFullUrl
    END
    ELSE
    BEGIN
        UPDATE
            Perms
        SET
            RoleDefWebId = @WebId
        WHERE
            SiteId = @SiteId AND
            ScopeId = @ScopeId
        DELETE
            RoleAssignment
        WHERE
            SiteId = @SiteId AND
            ScopeId = @ScopeId
    END
    UPDATE
        Webs
    SET
        NextWebGroupId = 1073741824 + 100
    WHERE
        Webs.SiteId  = @SiteId AND
        Webs.Id = @WebId
    EXEC proc_CreateDefaultRoles 
        @SiteId, @WebId, @ScopeId,
        @AuthorID, NULL,
        @AdminsName, @AdminsDescription, @AdminsPermMask,
        @AuthorsName,@AuthorsDescription, @AuthorsPermMask,
        @ContributorsName,@ContributorsDescription, @ContributorsPermMask,
        @BrowsersName, @BrowsersDescription, @BrowsersPermMask,
        @GuestsName, @GuestsDescription, @GuestsPermMask
    EXEC proc_SecResetAllSubwebsWithOldRoleDefs @SiteId, @WebId, @WebFullUrl, @ScopeId, @RoleDefWebId
    EXEC proc_SecLogChange @SiteId, @WebId, @ScopeId, @WebFullUrl, NULL, @AuthorID,
                262144, 2
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 0, 0
    COMMIT TRAN
    RETURN 0

GO
