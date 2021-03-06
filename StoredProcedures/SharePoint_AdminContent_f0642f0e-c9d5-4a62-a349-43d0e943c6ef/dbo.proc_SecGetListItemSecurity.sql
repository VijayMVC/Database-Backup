/****** Object:  StoredProcedure [dbo].[proc_SecGetListItemSecurity]    Script Date: 5/15/2018 12:12:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecGetListItemSecurity(
    @SiteId uniqueidentifier,
    @ListId uniqueidentifier,
    @ListRootFolderUrl nvarchar(260),
    @ItemId int)
AS
    SET NOCOUNT ON
    DECLARE @ListRootFolderUrlLike nvarchar(1024)
    EXEC proc_EscapeForLike @ListRootFolderUrl, @ListRootFolderUrlLike OUTPUT
    SELECT TOP 1
        Perms.Acl,
        Perms.AnonymousPermMask
    FROM 
        Docs
    INNER JOIN Perms ON
        Docs.SiteId = Perms.SiteId AND
        Docs.ScopeId = Perms.ScopeId
    WHERE
        Docs.SiteId = @SiteId AND
        (Docs.DirName = @ListRootFolderUrl OR Docs.DirName LIKE @ListRootFolderUrlLike) AND
        Docs.ListId = @ListId AND
        Docs.DoclibRowId = @ItemId 

GO
