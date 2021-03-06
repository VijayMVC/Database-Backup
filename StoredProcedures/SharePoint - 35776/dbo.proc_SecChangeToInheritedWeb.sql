/****** Object:  StoredProcedure [dbo].[proc_SecChangeToInheritedWeb]    Script Date: 5/15/2018 12:12:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecChangeToInheritedWeb(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @ParentWebPermAncestor uniqueidentifier
    DECLARE @WebFullUrl nvarchar(256)
    DECLARE @RoleDefWebId uniqueidentifier
    DECLARE @NewScopeId uniqueidentifier
    DECLARE @OldScopeId uniqueidentifier
    DECLARE @LastSecurityChange datetime
    SELECT
        @WebFullUrl = Webs1.FullUrl,
        @RoleDefWebId = Perms.RoleDefWebId,
        @OldScopeId = Webs1.ScopeId,
        @NewScopeId = Webs2.ScopeId,
        @ParentWebPermAncestor = Webs2.FirstUniqueAncestorWebId
    FROM
        Webs Webs1, Webs Webs2, Perms
    WHERE
        Webs1.SiteId = @SiteId AND
        Webs1.Id = @WebId AND
        Webs1.Id = Webs1.FirstUniqueAncestorWebId AND
        Webs2.SiteId = @SiteId AND
        Webs2.Id = Webs1.ParentWebId AND
        Perms.SiteId = @SiteId AND
        Webs1.ScopeId = Perms.ScopeId
    IF @ParentWebPermAncestor IS NULL
    BEGIN
        RETURN 3
    END
    DECLARE @DirName   nvarchar(256)
    DECLARE @LeafName  nvarchar(128)
    DECLARE @WebFullUrlLike nvarchar(1024)
    EXEC proc_EscapeForLike @WebFullUrl, @WebFullUrlLike OUTPUT
    EXEC proc_spliturl @WebFullUrl, @DirName OUTPUT, @LeafName OUTPUT
    SET @LastSecurityChange = GETUTCDATE()
    BEGIN TRAN
    UPDATE Webs SET CachedNavDirty =1 WHERE SiteId = @SiteId    
    EXEC proc_SecLogChange @SiteId, @WebId, @OldScopeId, NULL, NULL, NULL,
                33554432, 1
    IF @RoleDefWebId = @WebId
    BEGIN
        UPDATE
            Webs
        SET
            FirstUniqueAncestorWebId = @WebId,
            ScopeId = @OldScopeId
        FROM
            Webs, Perms
        WHERE
            Webs.SiteId  = @SiteId AND
            Webs.ScopeId = Perms.ScopeId AND
            Perms.SiteId = @SiteId AND
            Perms.RoleDefWebId = @WebId
    END
    UPDATE 
        Docs
    SET 
        ScopeId = @NewScopeId
    FROM
        Docs
    WHERE 
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND 
        Docs.LeafName = @LeafName
    UPDATE 
        Docs
    SET 
        ScopeId = @NewScopeId
    FROM
        Docs
    WHERE 
        Docs.SiteId = @SiteId AND
        Docs.DirName = @WebFullUrl AND
        (Docs.WebId = @WebId OR Docs.ScopeId = @OldScopeId)
    UPDATE 
        Docs
    SET 
        ScopeId = @NewScopeId
    FROM
        Docs, Webs
    WHERE 
        Docs.SiteId = @SiteId AND
        Docs.DirName LIKE @WebFullUrlLike AND
        Docs.WebId = Webs.Id AND
        Webs.FirstUniqueAncestorWebId = @WebId AND
        Webs.SiteId = @SiteId
    UPDATE
        Lists
    SET
        tp_LastSecurityChange = @LastSecurityChange,
        tp_ScopeId = @NewScopeId
    FROM
        Lists, Webs
    WHERE
        Lists.tp_WebId = Webs.Id AND
        Webs.FirstUniqueAncestorWebId = @WebId AND
        Webs.SiteId = @SiteId
    DECLARE @COUNT int
    SELECT
        @COUNT = COUNT(*)
    FROM
        Webs WITH (XLOCK)
    WHERE
        FirstUniqueAncestorWebId = @WebId AND
        SiteId = @SiteId
    DELETE FROM
        WebMembers
    WHERE
        WebId = @WebId
    IF @RoleDefWebId = @WebId
    BEGIN
        DELETE
            Roles
        WHERE
            SiteId = @SiteId AND
            WebId  = @WebId
        DELETE
            RoleAssignment
        FROM
            RoleAssignment, Perms
        WHERE
            RoleAssignment.SiteId  = @SiteId AND
            RoleAssignment.ScopeId = Perms.ScopeId AND
            Perms.SiteId           = @SiteId AND
            Perms.RoleDefWebId     = @WebId
        DELETE
            Perms
        WHERE
            Perms.SiteId       = @SiteId AND
            Perms.RoleDefWebId = @WebId
    END
    ELSE    
    BEGIN
        DELETE
            RoleAssignment
        FROM
            RoleAssignment, Perms, Webs
        WHERE
            RoleAssignment.SiteId  = @SiteId AND
            RoleAssignment.ScopeId = Perms.ScopeId AND
            Perms.SiteId           = @SiteId AND
            Perms.WebId            = Webs.Id AND
            Webs.FirstUniqueAncestorWebId = @WebId AND
            Webs.SiteId  = @SiteId
        DELETE
            Perms
        FROM
            Perms, Webs
        WHERE
            Perms.SiteId = @SiteId AND
            Perms.WebId =  Webs.Id AND
            Webs.ScopeId = @OldScopeId
    END
    UPDATE
        Webs
    SET
        FirstUniqueAncestorWebId = @ParentWebPermAncestor,
        ScopeId = @NewScopeId
    FROM
        Webs
    WHERE
        Webs.FirstUniqueAncestorWebId = @WebId
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 0, 0
    COMMIT TRAN
    SELECT
        ScopeId,
        @ParentWebPermAncestor
    FROM
        Perms
    WHERE
        SiteId = @SiteId AND
        ScopeId = @NewScopeId
    EXEC proc_GetWebIdAuditMask @SiteId, @WebId
    RETURN 0

GO
