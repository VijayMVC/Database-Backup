/****** Object:  StoredProcedure [dbo].[proc_CreateList]    Script Date: 5/15/2018 12:11:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CreateList(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @DirName nvarchar(256),
    @FolderNameBase nvarchar(50),
    @bAlternateUrlOnCollision bit,
    @Title nvarchar(255),
    @Version int,
    @Author int,
    @BaseType int,
    @bCreateAttachmentsSubFolder bit,
    @FeatureId uniqueidentifier,
    @ServerTemplate int,
    @DocLibTemplate uniqueidentifier,
    @ImageUrl nvarchar(255),
    @ReadSecurity int,
    @WriteSecurity int,
    @Description ntext,
    @MajorVersionCount int,
    @MinorVersionCount int,
    @Fields ntext,
    @Direction int,
    @Flags bigint,
    @ThumbnailSize int,
    @WebImageWidth int,
    @WebImageHeight int,
    @bParentFolderChecked bit,
    @OnRestore bit,
    @EventSinkAssembly nvarchar(255),
    @EventSinkClass nvarchar(255),
    @EventSinkData nvarchar(255),
    @ContentTypes ntext,
    @RootFolderId uniqueidentifier = NULL,
    @FolderFullUrlRet nvarchar(256) = NULL OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @cDocsInsert int 
    DECLARE @cbDelta int 
    DECLARE @DocId uniqueidentifier
    DECLARE @ScopeId uniqueidentifier
    DECLARE @WebTemplate int 
    SELECT
        @WebTemplate = WebTemplate,
        @ScopeId = ScopeId
    FROM
        Webs
    WHERE
        Id = @WebId
    SET @cDocsInsert = 0
    DECLARE @quotaOrLockStatus int
    SELECT  @quotaOrLockStatus = dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
    IF (@quotaOrLockStatus = 1)
    BEGIN
        RETURN 1816
    END
    ELSE IF (@quotaOrLockStatus > 1)
    BEGIN
        RETURN 212
    END
    DECLARE @Now datetime
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    DECLARE @FolderName nvarchar(256)
    DECLARE @FolderFullUrl nvarchar(256)
    DECLARE @FolderParentId uniqueidentifier
    DECLARE @iRet int
    DECLARE @DirId uniqueidentifier
    IF @RootFolderId IS NULL OR @RootFolderId = '00000000-0000-0000-0000-000000000000'
    BEGIN
        EXEC @iRet = proc_PrepareForListCreation 
            @SiteId, 
            @WebId,
            @FeatureId,
            @Title,
            @DirName OUTPUT,
            @FolderNameBase,
            @bAlternateUrlOnCollision,
            @FolderName OUTPUT,  
            @FolderParentId OUTPUT,
            @ScopeId OUTPUT,
            @bParentFolderChecked
        IF @iRet <> 0
            RETURN @iRet
        SET @FolderFullUrl = CASE WHEN (DATALENGTH(@DirName) = 0) THEN @FolderName WHEN (DATALENGTH(@FolderName) = 0) THEN @DirName ELSE @DirName + N'/' + @FolderName END
        SET @DirId = NEWID()
        INSERT INTO AllDocs (
            Id,
            ParentId,
            SiteId,
            DirName,
            LeafName,
            WebId,
            ListId,
            Type,
            TimeCreated,
            TimeLastModified,
            ScopeId)
        VALUES (
            @DirId,
            @FolderParentId,
            @SiteId,
            @DirName,
            @FolderName,
            @WebId,
            @ListId,
            1,
            @Now,
            @Now,
            @ScopeId)
        SET @cDocsInsert = @cDocsInsert + 1
    END
    ELSE
    BEGIN
        IF (@bParentFolderChecked = 0) AND
            (EXISTS(SELECT * FROM Lists WHERE tp_WebId = @WebId AND
                tp_Title = @Title))
        BEGIN
            RETURN 80
        END
        SET @DirId = @RootFolderId
        EXEC @iRet = proc_DeplFixupListDirectories 
            @SiteId,
            @ListId, 
            @RootFolderId    
        IF @iRet <> 0
            RETURN @iRet
        SELECT 
            @DirName = DirName,
            @FolderName = LeafName
        FROM Docs
        WHERE Id = @DirId
        SET @FolderFullUrl = CASE WHEN (DATALENGTH(@DirName) = 0) THEN @FolderName WHEN (DATALENGTH(@FolderName) = 0) THEN @DirName ELSE @DirName + N'/' + @FolderName END
    END
    IF @FolderFullUrlRet IS NOT NULL
    BEGIN
        SET @FolderFullUrlRet = @FolderFullUrl
    END
    INSERT INTO Lists (
        tp_WebId,
        tp_ID,
        tp_Title,
        tp_Modified,
        tp_Created,
        tp_LastDeleted,
        tp_Version,
        tp_Author,
        tp_BaseType,
        tp_FeatureId,
        tp_ServerTemplate,
        tp_RootFolder,
        tp_Template,
        tp_ImageUrl,
        tp_ReadSecurity,
        tp_WriteSecurity,
        tp_Description,
        tp_Fields,
        tp_Direction, 
        tp_Subscribed,
        tp_Flags,
        tp_ThumbnailSize,
        tp_WebImageWidth,
        tp_WebImageHeight,
        tp_ItemCount,
        tp_NextAvailableId,
        tp_EventSinkAssembly,
        tp_EventSinkClass,
        tp_EventSinkData,
        tp_ContentTypes,
        tp_ScopeId,
        tp_MaxMajorVersionCount,
        tp_MaxMajorwithMinorVersionCount)
    VALUES (
        @WebId,
        @ListId,
        @Title,
        @Now,
        @Now,
        @Now,
        @Version,
        @Author,
        @BaseType,
        @FeatureId,
        @ServerTemplate,
        @DirId,
        @DocLibTemplate,
        @ImageUrl,
        @ReadSecurity,
        @WriteSecurity,
        @Description,
        @Fields,
        @Direction,
        0,
        @Flags,
        @ThumbnailSize,
        @WebImageWidth,
        @WebImageHeight,
        0,
        1,
        @EventSinkAssembly,
        @EventSinkClass,
        @EventSinkData,
        @ContentTypes,
        @ScopeId,
        @MajorVersionCount,
        @MinorVersionCount)
    EXEC proc_LogChange @SiteId, @WebId, @ListId, NULL, NULL, NULL, NULL, NULL,
        4096, 2, @Now
    IF (@ReadSecurity IS NOT NULL AND @ReadSecurity = 0x00000002)
    BEGIN
        EXEC proc_LogChange @SiteId, @WebId, NULL, NULL, NULL, NULL, NULL,
            NULL, 8192, 4, NULL
        UPDATE Webs
        SET 
            Flags = Flags | 0x400
        WHERE
            Id = @WebId
    END
    IF @BaseType = 1 
    BEGIN        
        IF @RootFolderId IS NULL OR @RootFolderId = '00000000-0000-0000-0000-000000000000'
        BEGIN
            SET @DocId = NEWID()
            INSERT INTO AllDocs (
                Id,
                SiteId,
                ParentId,
                DirName,
                LeafName,
                WebId,
                ListId,
                Type,
                TimeCreated,
                TimeLastModified,
                ScopeId)
            VALUES (
                @DocId,
                @SiteId,
                @DirId,
                @FolderFullUrl,
                N'Forms',
                @WebId,
                @ListId,
                1,
                @Now,
                @Now,
                @ScopeId)
            SET @cDocsInsert = @cDocsInsert + 1
            IF @OnRestore <> 1
            BEGIN
                IF @WebTemplate = 2
                BEGIN
                    EXEC proc_CreateMtgInstSubFoldersForDocLib
                        @SiteId,
                        @WebId,
                        @FolderFullUrl,
                        @Flags,
                        0      
                END
            END
            IF (@cDocsInsert > 0)
            BEGIN
                SET @cbDelta = @cDocsInsert * 152
                EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
                    @SiteId, @cbDelta, 1
            END
        END
        EXEC proc_GetListMetaData @WebId, @ListId, 0
    END
    ELSE
    BEGIN
        IF (@bCreateAttachmentsSubFolder = 1)
        BEGIN
        SET @DocId = NEWID()
        INSERT INTO AllDocs (
            Id,
            SiteId,
            ParentId,
            DirName,
            LeafName,
            WebId,
            ListId,
            Type,
            TimeCreated,
            TimeLastModified,
            ScopeId)
        VALUES (
            @DocId,
            @SiteId,
            @DirId,
            @FolderFullUrl,
            N'Attachments',
            @WebId,
            @ListId,
            1,
            @Now,
            @Now,
            @ScopeId)
            SET @cDocsInsert = @cDocsInsert + 1
        END
        IF (@cDocsInsert > 0)
        BEGIN
            SET @cbDelta = @cDocsInsert * 152
            EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
                @SiteId, @cbDelta, 1
        END
        SELECT
            @ListId,
            @FolderFullUrl      
    END

GO
