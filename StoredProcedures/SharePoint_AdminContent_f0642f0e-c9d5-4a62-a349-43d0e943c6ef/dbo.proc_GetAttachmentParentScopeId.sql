/****** Object:  StoredProcedure [dbo].[proc_GetAttachmentParentScopeId]    Script Date: 5/15/2018 12:12:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_GetAttachmentParentScopeId(
    @SiteId      uniqueidentifier, 
    @DirName     nvarchar(256), 
    @ScopeId     uniqueidentifier OUTPUT)
AS
    DECLARE @ScopeIdT           uniqueidentifier
    DECLARE @ListID             uniqueidentifier
    DECLARE @AttachFolder       nvarchar(256)
    DECLARE @AttachSubFolder    nvarchar(128)
    DECLARE @AttachDirName      nvarchar(256)
    DECLARE @AttachLeafName     nvarchar(128)
    EXEC proc_SplitUrl  @DirName, @AttachFolder OUTPUT,
        @AttachSubFolder OUTPUT
    SET @AttachFolder = LEFT(@AttachFolder, LEN(@AttachFolder) -
        12)
    EXEC proc_SplitUrl  @AttachFolder, @AttachDirName OUTPUT,
        @AttachLeafName OUTPUT
    SELECT
        @ListID = Docs.ListId
    FROM
        Docs, Lists
    WHERE
        Docs.SiteId  = @SiteID AND
        Docs.DirName = @AttachDirName AND
        Docs.LeafName = @AttachLeafName AND
        Docs.WebId   = Lists.tp_WebId AND
        Docs.ListId  = Lists.tp_ID AND
        Docs.Id      = Lists.tp_RootFolder AND
        Lists.tp_BaseType <> 1  AND
        Lists.tp_BaseType <> 4 AND
        Lists.tp_Flags & 0x08 = 0
    IF (@ListID IS NULL)
        RETURN 0
    DECLARE @AttachFolderLike nvarchar(1024)
    EXEC proc_EscapeForLike @AttachFolder, @AttachFolderLike OUTPUT
    SELECT
        @ScopeIdT = ScopeId
    FROM
        Docs
    WHERE
        SiteId  = @SiteID AND
        ListId = @ListId AND
        (DirName = @AttachFolder OR DirName LIKE @AttachFolderLike) AND 
        DoclibRowId = CAST(@AttachSubFolder AS INT)
    IF (@ScopeIdT IS NULL)
        RETURN 0
    SET @ScopeId = @ScopeIdT

GO
