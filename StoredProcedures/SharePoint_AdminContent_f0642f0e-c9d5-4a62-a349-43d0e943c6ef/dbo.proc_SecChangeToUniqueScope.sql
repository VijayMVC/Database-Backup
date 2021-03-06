/****** Object:  StoredProcedure [dbo].[proc_SecChangeToUniqueScope]    Script Date: 5/15/2018 12:12:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SecChangeToUniqueScope(
    @SiteId  uniqueidentifier,
    @WebId   uniqueidentifier,
    @OldScopeId uniqueidentifier,
    @CopyFromScopeId uniqueidentifier,
    @Url     nvarchar(260),
    @DocId   uniqueidentifier,
    @bIsWeb  bit,
    @UserId  int,
    @CopyAnonymousMask bit,
    @CopyRoleAssignments bit,
    @bBreakBySiteOwner bit,
    @ReturnAuditMask bit,
    @NewScopeId uniqueidentifier = NULL OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @DirName   nvarchar(256)
    DECLARE @LeafName  nvarchar(128)
    DECLARE @ListId    uniqueidentifier
    DECLARE @ThicketFlag bit
    DECLARE @ListBaseType int
    IF (@bBreakBySiteOwner = 1)
    BEGIN
        SELECT 
            @UserId = OwnerID
        FROM
            Sites
        WHERE
            Id = @SiteId
    END
    IF (@Url IS NOT NULL)
    BEGIN        
        EXEC proc_SplitUrl @Url, @DirName OUTPUT, @LeafName OUTPUT
        SELECT
            @ThicketFlag = ThicketFlag,
            @DocId  = Id,
            @ListId = ListId
        FROM
            Docs
        WHERE
            SiteId   = @SiteId      AND
            DirName  = @DirName     AND
            LeafName = @LeafName    AND
            WebId    = @WebId       AND
            ScopeId  = @OldScopeId
        IF @@ROWCOUNT = 0
        BEGIN
            RETURN 3
        END
    END
    ELSE
    BEGIN
        SELECT
            @ThicketFlag = ThicketFlag,
            @DirName = DirName,
            @LeafName = LeafName,
            @ListId = ListId,
            @Url = CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
        FROM
            Docs
        WHERE
            SiteId = @SiteId AND
            Id = @DocId
    END
    IF EXISTS (
        SELECT
            *
        FROM
            Perms
        WHERE
            SiteId = @SiteId AND
            DelTransId = 0x AND            
            ScopeUrl = @Url)
    BEGIN
        RETURN 3
    END
    DECLARE @UrlLike nvarchar(1024)
    EXEC proc_EscapeForLike @Url, @UrlLike OUTPUT
    DECLARE @OpCode int
    SET @OpCode = 4
    IF (@CopyRoleAssignments = 1)
        SET @OpCode = @OpCode + 16
    BEGIN TRAN
    SET @NewScopeId = NEWID()
    IF @bIsWeb = 0
    BEGIN
        SELECT 
            @ListBaseType = tp_BaseType 
        FROM
            Lists WITH (XLOCK)
        WHERE
            tp_WebId = @WebId AND
            tp_ID = @listId
        UPDATE Lists
        SET 
            tp_ScopeId = @NewScopeId
        WHERE
            tp_WebId = @WebId AND
            tp_ID    = @listId AND
            tp_RootFolder = @DocId AND
            tp_ScopeId = @OldScopeId
        UPDATE Webs SET CachedNavDirty = 1 WHERE SiteId = @SiteId
        EXEC proc_SecChangeSecurityScopeForFolderShared @SiteId, @WebId, @ListId, @ListBaseType, @DirName, @LeafName, @Url, @UrlLike, @ThicketFlag, @OldScopeId, @NewScopeId
        EXEC proc_SecUpdateDepsFromScope @SiteId, @NewScopeId
        UPDATE Webs
        SET 
            Flags = Flags | 0x400
        WHERE
            Id = @WebId
        EXEC proc_LogChange @SiteId, @WebId, NULL, NULL, NULL, NULL, NULL,
            NULL, 8192, 4, NULL
    END
    ELSE    
    BEGIN
        UPDATE Webs SET CachedNavDirty = 1 WHERE SiteId = @SiteId
        EXEC proc_SecResetAllInheritedSubwebs @SiteId, @WebId, @Url, @UrlLike, @OldScopeId, @NewScopeId, @UserId
    END
    EXEC proc_SecDupScope @SiteId, @CopyFromScopeId, @NewScopeId, @WebId, @Url, @UserId, @CopyAnonymousMask, @CopyRoleAssignments, NULL, 0
    EXEC proc_SecLogChange @SiteId, @WebId, @NewScopeId, @Url, NULL, @UserId, 524288, @OpCode
    EXEC proc_SecUpdateSiteLevelSecurityMetadata @SiteId, 0, 0
    COMMIT TRAN
    if @ReturnAuditMask = 1
        EXEC proc_GetWebIdAuditMask @SiteId, @WebId
    RETURN 0

GO
