/****** Object:  StoredProcedure [dbo].[proc_SecChangeToInheritedList]    Script Date: 5/15/2018 12:12:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecChangeToInheritedList(
    @WebId uniqueidentifier,
    @ListId uniqueidentifier)
AS
    SET NOCOUNT ON
    DECLARE @WebScopeId uniqueidentifier
    DECLARE @ListScopeId uniqueidentifier
    DECLARE @SiteId uniqueidentifier
    DECLARE @ListRootFolderUrl nvarchar(260)
    SELECT 
        @WebScopeId = ScopeId
    FROM
        Webs
    WHERE
        Id = @WebId
    SELECT
        @SiteId = SiteId
    FROM
        Webs
    WHERE
        Id = @WebId
    SELECT
        @ListScopeId = tp_ScopeId,
        @ListRootFolderUrl = dbo.fn_GetFullUrl(DirName, LeafName)
    FROM
        Lists, Docs
    WHERE
        tp_WebId = @WebId AND
        tp_Id = @ListId AND
        Docs.SiteId = @SiteId AND
        tp_RootFolder = Docs.Id
    IF NOT EXISTS (SELECT * FROM Perms WHERE SiteId = @SiteId AND ScopeId = @ListScopeId AND ScopeUrl = @ListRootFolderUrl)
        RETURN 3
    BEGIN TRAN
    EXEC proc_SecLogChange @SiteId, @WebId, @ListScopeId, NULL, NULL, NULL, 
                33554432, 1
    UPDATE
        Lists
    SET
        tp_Flags = tp_Flags & (~ CAST (0x200 AS INT)),
        tp_ScopeId = @WebScopeId,
        tp_LastSecurityChange = GETUTCDATE()
    WHERE
        tp_WebId = @WebId AND
        tp_ID = @ListId
    DELETE
        RoleAssignment
    WHERE
        RoleAssignment.SiteId = @SiteId AND
        RoleAssignment.ScopeId = @ListScopeId
    DELETE FROM
        Perms
    WHERE
        Perms.SiteId = @SiteId AND
        Perms.ScopeId = @ListScopeId
    UPDATE Webs SET CachedNavDirty =1 WHERE SiteId = @SiteId    
    UPDATE 
        Docs
    SET 
        ScopeId = @WebScopeId
    FROM
        Docs
    WHERE 
        Docs.SiteId = @SiteId AND
        Docs.WebId  = @WebId AND
        Docs.ListId = @ListId AND
        Docs.ScopeId = @ListScopeId
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 0, 0
    COMMIT TRAN
    EXEC proc_GetWebIdAuditMask @SiteId, @WebId
    RETURN 0

GO
