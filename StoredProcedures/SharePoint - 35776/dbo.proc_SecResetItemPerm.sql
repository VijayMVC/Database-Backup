/****** Object:  StoredProcedure [dbo].[proc_SecResetItemPerm]    Script Date: 5/15/2018 12:12:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecResetItemPerm(
    @SiteId     uniqueidentifier,
    @WebId      uniqueidentifier,
    @OldScopeId uniqueidentifier,
    @Url        nvarchar(260),
    @DocId      nvarchar(260),
    @NewScopeId uniqueidentifier = NULL OUTPUT)
AS
    SET NOCOUNT ON
    IF NOT EXISTS (
        SELECT
            *
        FROM
            Perms
        WHERE
            SiteId = @SiteId AND
            ScopeId = @OldScopeId AND
            WebId = @WebId AND
            ScopeUrl = @Url)
    BEGIN
        RETURN 3
    END
    DECLARE @DirName  nvarchar(256)
    DECLARE @LeafName nvarchar(128)
    DECLARE @ParentDirName  nvarchar(256)
    DECLARE @ParentLeafName nvarchar(128)
    DECLARE @UrlLike nvarchar(1024)
    DECLARE @ListId     uniqueidentifier
    DECLARE @ThicketFlag bit
    DECLARE @ListBaseType int
    IF (@Url IS NOT NULL)
    BEGIN
        EXEC proc_SplitUrl @Url, @DirName OUTPUT, @LeafName OUTPUT
        SELECT
            @ThicketFlag = ThicketFlag
        FROM
            Docs
        WHERE
            SiteId   = @SiteId AND
            DirName  = @DirName AND
            LeafName = @LeafName
    END
    ELSE
    BEGIN
        SELECT
            @ThicketFlag = ThicketFlag,
            @DirName = DirName,
            @LeafName = LeafName,
            @Url = CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
        FROM
            Docs
        WHERE
            SiteId = @SiteId AND
            ID = @DocId
    END
    EXEC proc_EscapeForLike @Url, @UrlLike OUTPUT
    EXEC proc_SplitUrl @DirName, @ParentDirName OUTPUT, @ParentLeafName OUTPUT
    SELECT 
        @NewScopeId = ScopeId,
        @ListId     = ListId
    FROM
        Docs
    WHERE
        SiteId   = @SiteId AND
        DirName  = @ParentDirName AND
        LeafName = @ParentLeafName
    IF @@ROWCOUNT = 0 OR @ListId IS NULL 
    BEGIN
        RETURN 3
    END
    BEGIN TRAN
    SELECT 
        @ListBaseType = tp_BaseType 
    FROM
        Lists WITH (XLOCK)
    WHERE
        tp_WebId = @WebId AND
        tp_ID = @listId
    UPDATE Webs SET CachedNavDirty =1 WHERE SiteId = @SiteId    
    DELETE
        RoleAssignment
    WHERE
        RoleAssignment.ScopeId = @OldScopeId AND
        RoleAssignment.SiteId = @SiteId
    EXEC proc_SecUpdateDepsFromScope @SiteId, @OldScopeId
    EXEC proc_SecLogChange @SiteId, @WebId, @OldScopeId, NULL, NULL, NULL, 
            33554432, 1
    EXEC proc_SecChangeSecurityScopeForFolderShared @SiteId, @WebId, @ListId, @ListBaseType, @DirName, @LeafName, @Url, @UrlLike, @ThicketFlag, @OldScopeId, @NewScopeId
    DELETE FROM Perms
    WHERE
        SiteId = @SiteId AND
        Perms.ScopeId = @OldScopeId
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 1, 0
    COMMIT TRAN
    EXEC proc_GetWebIdAuditMask @SiteId, @WebId
    RETURN 0

GO
