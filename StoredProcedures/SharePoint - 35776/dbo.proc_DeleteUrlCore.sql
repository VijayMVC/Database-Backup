/****** Object:  StoredProcedure [dbo].[proc_DeleteUrlCore]    Script Date: 5/15/2018 12:11:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeleteUrlCore(
    @WebSiteId       uniqueidentifier,
    @WebId           uniqueidentifier,
    @Url             nvarchar(260),
    @UserId          int,
    @LogChange bit,
    @ItemName nvarchar(255) = NULL,
    @ListDeletedUrls bit = 1,
    @ListDeletedAliases bit = 0,
    @AttachmentsFlag tinyint = 0,
    @AttachmentOp    int = 3,
    @IgnoreCheckedOutFiles bit = 0,
    @DeleteOp        int = 3,
    @DeleteTransactionId varbinary(16) = 0x OUTPUT,
    @DeletingListItem bit = 0,
    @FailedUrl       nvarchar(260) = NULL OUTPUT,
    @Size            bigint = 0 OUTPUT,
    @eventData       image = NULL,
    @acl             image = NULL,
    @QueryAuditFlags bit = 0    
    )
AS
    DECLARE @DocParentId uniqueidentifier
    DECLARE @BaseType int
    DECLARE @ListId uniqueidentifier
    DECLARE @ListRowId int
    DECLARE @HasStream bit
    DECLARE @IsFile bit
    DECLARE @IsList bit
    DECLARE @DocFlags int
    DECLARE @IsListRoot bit
    DECLARE @ScopeId uniqueidentifier
    DECLARE @DeleteType tinyint
    DECLARE @DeleteThicketFlag bit
    DECLARE @DeleteDirName nvarchar(256)
    DECLARE @DeleteLeafName nvarchar(128)
    DECLARE @DeleteDirDirName nvarchar(256)
    DECLARE @DeleteDirLeafName nvarchar(128)
    DECLARE @FailedDirName nvarchar(256)
    DECLARE @FailedLeafName nvarchar(128)
    DECLARE @ProgId nvarchar(255)
    DECLARE @WantFlags int
    DECLARE @ReturnStatus int
    DECLARE @Published int
    SET @WantFlags = 0
    SET @ReturnStatus = 0
    SET @IsListRoot = 0
    DECLARE @ThumbnailDirName nvarchar(256)
    DECLARE @WebImageDirName nvarchar(256)
    DECLARE @SubImgLeafName nvarchar(128)
    DECLARE @DocId uniqueidentifier
    DECLARE @FreedSpace bigint
    SET @FreedSpace = 0
    DECLARE @NewDeleteTransaction bit
    SET @NewDeleteTransaction = 0
    DECLARE @ShowUserName bit
    SET @ShowUserName = 1
    DECLARE @UrlLike nvarchar(1024)
    EXEC proc_SplitUrl @Url, @DeleteDirName OUTPUT,
        @DeleteLeafName OUTPUT
    EXEC proc_EscapeForLike @Url, @UrlLike OUTPUT
    EXEC proc_SplitUrl @DeleteDirName, @DeleteDirDirName OUTPUT,
        @DeleteDirLeafName OUTPUT
    IF @ItemName IS NULL
       SET @ItemName = ''
    DECLARE @guidT uniqueidentifier
    SELECT
        @ListId = ListId,
        @DocId = Id
    FROM
        Docs WITH(NOLOCK)
    WHERE
        SiteId = @WebSiteId AND
        DirName = @DeleteDirName AND
        LeafName = @DeleteLeafName
    SET @IsList = 0
    IF @ListId IS NOT NULL
    BEGIN
        SELECT
            @guidT = tp_RootFolder
        FROM
            Lists WITH(NOLOCK)
        WHERE
            tp_WebId = @WebId AND
            tp_Id = @ListId
        IF (@guidT = @DocId)
        BEGIN
            SET @IsList = 1
            SELECT 
                @guidT = WebId
            FROM 
                Docs WITH(XLOCK)
            WHERE 
                SiteId = @WebSiteId AND
                DirName = @DeleteDirDirName AND
                LeafName = @DeleteDirLeafName
            SELECT
                @guidT = tp_WebId,
                @ShowUserName = CASE WHEN (tp_Flags & 0x1000) = 0 THEN 0 ELSE 1 END
            FROM
                Lists WITH(XLOCK)
            WHERE
                tp_WebId = @WebId AND
                tp_Id = @ListId
           SET @IsListRoot = 1
        END
        ELSE
        BEGIN
            SELECT
                @guidT = tp_WebId,
                @ShowUserName = CASE WHEN (tp_Flags & 0x1000) = 0 THEN 0 ELSE 1 END
            FROM
                Lists WITH(XLOCK)
            WHERE
                tp_WebId = @WebId AND
                tp_Id = @ListId
            SELECT
                @ListId = ListId
            FROM
                Docs WITH(XLOCK)
            WHERE
                SiteId = @WebSiteId AND
                DirName = @DeleteDirDirName AND
                LeafName = @DeleteDirLeafName
        END
    END
    SELECT
        @DeleteType = Type,
        @ListId = ListId,
        @ListRowId = DoclibRowId,
        @DeleteThicketFlag = ThicketFlag,
        @DocId = Id,
        @DocParentId = ParentId,
        @HasStream = HasStream,
        @IsFile = 
            CASE
            WHEN Type = 0 AND
                ((DocFlags & 256) = 256) THEN 1
            ELSE 0
            END,
        @DocFlags = DocFlags,
        @ScopeId = ScopeId,
        @ProgId = ProgId
    FROM
        Docs WITH(XLOCK)
    WHERE
        SiteId   = @WebSiteId AND
        DirName  = @DeleteDirName AND
        LeafName = @DeleteLeafName AND
        WebId    = @WebId
    IF @DeleteType IS NULL
    BEGIN
        SET @ReturnStatus = 3
        GOTO cleanup
    END
    IF @DeleteType = 2
    BEGIN
        SET @ReturnStatus = 50
        GOTO cleanup
    END
    If @DeleteOp = 4
    BEGIN
        SET
            @Published = CASE WHEN EXISTS(
            SELECT 
                *
            FROM
                Docs
            WHERE
                SiteId = @WebSiteId AND
                DirName = @DeleteDirName AND
                LeafName = @DeleteLeafName AND
                WebId = @WebId AND
                Level = 1)
            THEN 1 ELSE 0 END
    END
    IF (@QueryAuditFlags = 1)
    BEGIN
        DECLARE @AuditEventData nvarchar(4000)
        DECLARE @AuditType smallint
        SET @AuditType = 
            CASE
            WHEN @IsFile = 1 THEN 1
            WHEN @IsList = 1 THEN 4
            WHEN @DeleteType = 0 THEN 3
            ELSE 5
            END
        SET @AuditEventData = STUFF(STUFF('</>', 3, 0, 'Version'), 1, 0, STUFF('<AllVersions/>', 1, 0, STUFF('<>', 2, 0, 'Version')))
        IF (@DeleteOp = 3) SET @AuditEventData = @AuditEventData + '<Recycle>0<Recycle>'
        ELSE IF (@DeleteOp = 4) SET @AuditEventData = @AuditEventData + '<Recycle>1<Recycle>'
        EXEC @ReturnStatus = proc_AddAuditEntryFromSql
                @WebSiteId,
                @DeleteDirName,
                @DeleteLeafName,
                @AuditType,
                @UserId,                
                4,
                @AuditEventData,
                0x00000008
        IF @ReturnStatus <> 0 GOTO cleanup
    END
    IF @DeletingListItem = 0 AND @HasStream = 0 AND
       @DeleteType = 0 AND @ListRowId IS NOT NULL
    BEGIN
        DECLARE @FeatureId uniqueidentifier
        DECLARE @ServerTemplate int
        DECLARE @UseNvarchar1ItemName bit
        DECLARE @UserTitle nvarchar(255)
        SELECT
            @FeatureId = tp_FeatureId,
            @ServerTemplate = tp_ServerTemplate,
            @BaseType = tp_BaseType,
            @UseNvarchar1ItemName =
                CASE
                WHEN
                       @FeatureId IS NULL AND
                       (@ServerTemplate = 103 OR
                       @BaseType = 5)
                THEN
                       0
                ELSE
                       1
                END
        FROM
            Lists
        WHERE
            tp_WebId = @WebId AND
            tp_ID = @ListId
        EXEC @ReturnStatus = proc_DropListRecord
             @WebSiteId,
             @WebId,
             @ListId,
             @ServerTemplate,
             @ListRowId,
             @UseNvarchar1ItemName,
             0,
             @UserTitle,
             NULL,
             @UserId,
             0, 
             @BaseType,
             @DeleteOp,
             @eventData,
             @acl,
             @DeleteTransactionId OUTPUT,
             @Size OUTPUT
         IF @ListDeletedUrls = 1
         BEGIN
             SELECT
                 @Url, @DeleteType
         END
         IF @ListDeletedAliases = 1
         BEGIN
             SELECT
                 1, 2
             WHERE
                 1 = 0
         END
         GOTO cleanup
    END
    SELECT 
        @WebSiteId = SiteId 
    FROM
        Perms WITH (XLOCK)
    WHERE
        SiteId = @WebSiteId AND
        DelTransId = 0x AND
            (ScopeUrl = @Url OR ScopeUrl LIKE @UrlLike)
    IF (@Url = (SELECT
            ScopeUrl
        FROM
            Perms
        WHERE
            SiteId = @WebSiteId AND
            DelTransId = 0x AND
            ScopeId = @ScopeId))
    BEGIN
        SET @ScopeId = NULL
    END
    IF ((@DeleteType = 1 AND 
        (@AttachmentsFlag = 2 OR 
            @AttachmentsFlag = 3)))
    BEGIN                 
        DECLARE @IsAttachment  bit
        EXEC @IsAttachment = proc_TestAttachmentsFlag @WebSiteId, 
            @DeleteDirName, @AttachmentsFlag
        IF @IsAttachment = 1
        BEGIN
            SET @ReturnStatus = 50
            GOTO cleanup
        END
    END
    SET @ThumbnailDirName = N''
    SET @WebImageDirName = N''
    IF @DeleteType = 0
        EXEC proc_GetSubImageUrls
            @Url,
            @ThumbnailDirName OUTPUT,
            @WebImageDirName OUTPUT,
            @SubImgLeafName OUTPUT
    DECLARE @DeleteDTM datetime
    SET @DeleteDTM = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    UPDATE
        Docs
    SET
        NextToLastTimeModified = TimeLastModified,
        TimeLastModified = @DeleteDTM
    WHERE
        SiteId = @WebSiteId AND
        DirName = @DeleteDirDirName AND
        LeafName = @DeleteDirLeafName AND
        WebId = @WebId
    DECLARE @ItemCountDelta int
    SET @ItemCountDelta = 0
    DECLARE @BinId tinyint
    IF @DeleteOp = 4
        SET @BinId = 1
    IF @DeleteType = 1
    BEGIN
        IF @DeleteLeafName = N'Forms'
        BEGIN
            DECLARE @ContainingListId uniqueidentifier
            DECLARE @ContainingBaseType int
            DECLARE @ContainingExcludedType int
            SET @ContainingExcludedType = 0x00
            EXEC proc_GetContainingListOutput
                @WebSiteId, @WebId,
                @Url, 
                @ContainingListId OUTPUT,
                @ContainingBaseType OUTPUT,
                @ContainingExcludedType OUTPUT
            IF @ContainingExcludedType = 0x01
            BEGIN
                SET @ReturnStatus = 51
                GOTO cleanup
            END
        END
        SET @WantFlags = @WantFlags | 0x0080 | 0x0004
            | CASE
                WHEN
                    @IgnoreCheckedOutFiles = 1 OR @IsListRoot = 1 OR @DeleteType = 2
                THEN 0
                ELSE 
                    0x0010
                END
        EXEC @ReturnStatus = proc_CheckDirectoryTree
            @WebSiteId, @Url, @Url, @UserId, @WantFlags,
            @FailedDirName OUTPUT,
            @FailedLeafName OUTPUT
        IF @ReturnStatus <> 0
        BEGIN
            IF @FailedDirName IS NOT NULL AND @FailedLeafName IS NOT NULL
            BEGIN
                SET @FailedUrl = CASE WHEN (DATALENGTH(@FailedDirName) = 0) THEN @FailedLeafName WHEN (DATALENGTH(@FailedLeafName) = 0) THEN @FailedDirName ELSE @FailedDirName + N'/' + @FailedLeafName END
            END
            GOTO cleanup
        END
        EXEC @ReturnStatus = proc_DeleteDirInternal
            @WebSiteId,
            @WebId,
            @Url,
            @UserId,
            @ListDeletedUrls,
            @ListDeletedAliases,
            @DeleteOp,
            @ListId,
            @ListRowId,
            @DocId,
            @UrlLike,
            @DeleteDirName,
            @DeleteLeafName,
            @ItemName,
            @DeleteDTM,
            @ScopeId,
            @ProgId,
            @BinId,
            @ShowUserName,
            @DeleteTransactionId OUTPUT,
            @Size OUTPUT,
            @NewDeleteTransaction OUTPUT,
            @ItemCountDelta OUTPUT,
            @FreedSpace OUTPUT
        IF @ReturnStatus <> 0
            GOTO cleanup
        IF @ListRowId IS NOT NULL
            SET @ItemCountDelta = @ItemCountDelta + 1
    END
    IF @DeleteType = 0
    BEGIN
        SET @WantFlags = @WantFlags | 0x0008 | 0x0004
        EXEC @ReturnStatus = proc_CheckDirectoryTree
            @WebSiteId, @Url, @Url, @UserId, @WantFlags,
            @FailedDirName OUTPUT,
            @FailedLeafName OUTPUT
        IF @ReturnStatus <> 0
        BEGIN
            IF @FailedDirName IS NOT NULL AND @FailedLeafName IS NOT NULL
            BEGIN
                SET @FailedUrl = CASE WHEN (DATALENGTH(@FailedDirName) = 0) THEN @FailedLeafName WHEN (DATALENGTH(@FailedLeafName) = 0) THEN @FailedDirName ELSE @FailedDirName + N'/' + @FailedLeafName END
            END
            GOTO cleanup
        END
        DECLARE @AuthorId int
        SELECT
            @AuthorId = tp_Author
        FROM
            UserData
        WHERE
            tp_ListId = @ListId AND
            tp_ID = @ListRowId
        DECLARE @IsIssue bit
        IF @ListRowId IS NOT NULL AND @ListId IS NOT NULL
        BEGIN
            SELECT
                @BaseType = tp_BaseType,
                @IsIssue =
                    CASE WHEN @BaseType = 5 THEN 1 ELSE 0 END
            FROM
                Lists
            WHERE
                tp_WebId = @WebId AND
                tp_ID = @ListId                     
        END
        IF @ListDeletedUrls = 1
        BEGIN
            SELECT
                @Url, @DeleteType
        END
        IF @ListDeletedAliases = 1
        BEGIN
            SELECT
                1, 2
            WHERE
                1 = 0
        END
        EXEC proc_DirtyDependents @WebSiteId, 1, @Url
        IF @DocFlags & 1024 = 1024
        BEGIN
            EXEC proc_DTClearRelationshipFromParent @WebSiteId, @DeleteDirName, @DeleteLeafName
        END
        IF (@DeleteOp = 4) AND
            @DeleteTransactionId = 0x
        BEGIN
            DECLARE @ListDirName nvarchar(256)
            SELECT 
                @ListDirName = CASE WHEN (DATALENGTH(DirName) = 0) THEN LeafName WHEN (DATALENGTH(LeafName) = 0) THEN DirName ELSE DirName + N'/' + LeafName END
            FROM 
                Docs 
            WHERE 
                SiteId = @WebSiteId AND 
                Id = (SELECT tp_RootFolder FROM Lists WHERE 
                    tp_WebId = @WebId AND tp_Id = @ListId)
            DECLARE @AttachListItemId int
            IF (@DeleteType = 0 AND
                @AttachmentsFlag = 1)
            BEGIN
                IF (@ListRowId IS NOT NULL)
                BEGIN
                    SET @ReturnStatus = 1359
                    GOTO cleanup
                END
                DECLARE @AttachSubFolder nvarchar(256)
                EXEC proc_SplitUrl  @DeleteDirName, NULL,
                    @AttachSubFolder OUTPUT
                SET @AttachListItemId = CAST(@AttachSubFolder AS int)
            END
            SET @NewDeleteTransaction = 1
            SET @DeleteTransactionId = NEWID()
            INSERT INTO RecycleBin (
                SiteId,
                WebId,
                BinId,
                DeleteUserId,
                DeleteTransactionId,
                DeleteDate,
                ItemType,
                ListId,
                DocId,
                DocVersionId,
                ListItemId,
                Title,
                DirName,
                LeafName,
                AuthorId,
                Size,
                ListDirName,
                ScopeId,
                ProgId)
            VALUES (
                @WebSiteId,
                @WebId,
                @BinId,
                @UserId,
                @DeleteTransactionId,
                @DeleteDTM,
                CASE 
                    WHEN @AttachListItemId IS NOT NULL THEN 7 
                    WHEN @IsFile = 1 THEN 1
                    ELSE 3
                END,
                @ListId,
                @DocId,
                NULL,
                ISNULL(@AttachListItemId, @ListRowId),
                CASE
                    WHEN (@HasStream = 1 OR @BaseType = 1) THEN @DeleteLeafName
                    ELSE @ItemName
                END,
                @DeleteDirName,
                @DeleteLeafName,
                CASE WHEN @ShowUserName = 1 THEN @AuthorId ELSE NULL END,
                CASE 
                    WHEN @HasStream = 1 THEN 0
                    ELSE @Size
                END,
                @ListDirName,
                @ScopeId,
                @ProgId)
        END
        IF @DeleteOp = 3
        BEGIN
            DELETE FROM
                WebPartLists
            WHERE
                tp_SiteId = @WebSiteId AND
                tp_PageUrlId = @DocId
            DELETE FROM
                WebParts
            WHERE
                tp_SiteId = @WebSiteId AND
                tp_PageUrlId = @DocId
        END
        ELSE
        BEGIN
            SET @Size = @Size + (
                SELECT
                    (ISNULL((SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT))),0))
                FROM
                    Personalization
                WHERE    
                    tp_SiteId = @WebSiteId AND
                    tp_PageUrlId = @DocId)
            SET @Size = @Size + (
                SELECT
                    (ISNULL((SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT))),0))
                FROM
                    WebParts
                WHERE    
                    tp_SiteId = @WebSiteId AND
                    tp_PageUrlId = @DocId)
            UPDATE
                Personalization
            SET
                tp_Deleted = 1
            WHERE
                tp_SiteId = @WebSiteId AND
                tp_PageUrlId = @DocId
            UPDATE
                WebParts
            SET
                tp_Deleted = 1
            WHERE
                tp_SiteId = @WebSiteId AND
                tp_PageUrlId = @DocId
        END
        DELETE FROM
            ComMd
        WHERE
            SiteId = @WebSiteId AND
            DocId = @DocId
        DELETE
        FROM
            Categories
        WHERE
            DocId = @DocId
        EXEC proc_NavStructDeleteNodesByUrlDir @WebSiteId, @DeleteDirName,
            @DeleteLeafName, NULL, NULL
        IF (@DeleteOp = 3)
        BEGIN
            EXEC proc_DeleteFromNVP @WebSiteId, @ListId, @ListRowId
            DELETE FROM
                UserDataVersioned
            WHERE
                tp_ListId = @ListId AND
                tp_ID = @ListRowId
        END
        ELSE
        BEGIN
            SET @Size = @Size + (
                SELECT
                    (ISNULL((SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT))),0))
                FROM
                    UserDataVersioned
                WHERE
                    tp_ListId = @ListId AND
                    tp_ID = @ListRowId)
            UPDATE
                UserDataVersioned
            SET
                tp_DeleteTransactionId = @DeleteTransactionId
            WHERE
                tp_ListId = @ListId AND
                tp_ID = @ListRowId
        END
        IF @@ROWCOUNT <> 0
        BEGIN
            IF (@DeleteOp = 3)
            BEGIN
                DELETE FROM
                    ImmedSubscriptions
                WHERE
                    SiteId = @WebSiteId AND
                    ListId = @ListId AND
                    ItemId = @ListRowId
                DELETE FROM
                    SchedSubscriptions
                WHERE
                    SiteId = @WebSiteId AND
                    ListId = @ListId AND
                    ItemId = @ListRowId
            END
            ELSE
            BEGIN
                UPDATE
                    ImmedSubscriptions
                SET
                    Deleted = 1
                WHERE
                    SiteId = @WebSiteId AND
                    ListId = @ListId AND
                    ItemId = @ListRowId
                UPDATE
                    SchedSubscriptions
                SET
                    Deleted = 1
                WHERE
                    SiteId = @WebSiteId AND
                    ListId = @ListId AND
                    ItemId = @ListRowId
            END
            DECLARE @EventType int
            SET @EventType = 
            CASE
                WHEN @Published > 0 THEN 16388
                ELSE 16384
            END
            EXEC proc_AddEventToCacheForDeleteRestore
                @WebSiteId, 
                @WebId, 
                @ListId,
                @ListRowId,
                @ItemName,
                @Url,
                @DocId,
                @EventType,
                @UserId,
                @DeleteDTM,
                @eventData,
                @acl
        END
        IF @DeleteThicketFlag = 1
        BEGIN
            DECLARE @ThicketFolder nvarchar(260)
            EXEC proc_GetThicketFolder @WebSiteId, @DeleteDirName, @DeleteLeafName, NULL, @ThicketFolder OUTPUT
            IF @ThicketFolder IS NOT NULL
            BEGIN
                EXEC @ReturnStatus = proc_DeleteUrlCore
                    @WebSiteId,
                    @WebId,
                    @ThicketFolder,
                    @UserId,
                    @LogChange,
                    NULL,
                    0,
                    0,
                    0,
                    3,
                    0,
                    @DeleteOp,
                    @DeleteTransactionId,
                    0,
                    NULL,
                    @Size OUTPUT
                IF @ReturnStatus <> 0
                BEGIN
                    GOTO cleanup
                END
            END
        END
        IF @DeleteOp = 3
        BEGIN
            DELETE FROM
                AllDocVersions
            WHERE
                SiteId = @WebSiteId AND
                Id = @DocId
            DELETE FROM
                AllUserDataJunctions
            WHERE
                tp_SiteId = @WebSiteId AND
                tp_DeleteTransactionId = 0x AND
                tp_IsCurrentVersion = CAST(1 as bit) AND
                tp_DirName = @DeleteDirName AND
                tp_LeafName = @DeleteLeafName
            DELETE FROM
                AllUserDataJunctions
            WHERE
                tp_SiteId = @WebSiteId AND
                tp_DeleteTransactionId = 0x AND
                tp_IsCurrentVersion = CAST(0 as bit) AND
                tp_DirName = @DeleteDirName AND
                tp_LeafName = @DeleteLeafName
        END
        ELSE
        BEGIN
            SET @Size = @Size + (
                SELECT
                    (ISNULL((SUM(CAST((ISNULL(Size, 0) + ISNULL(MetaInfoSize, 0)) AS BIGINT))),0))
                FROM
                    DocVersions
                WHERE
                    SiteId = @WebSiteId AND
                    Id = @DocId)
            UPDATE
                DocVersions
            SET
                DeleteTransactionId = @DeleteTransactionId
            WHERE
                SiteId = @WebSiteId AND
                Id = @DocId
            UPDATE
                AllUserDataJunctions
            SET
                tp_DeleteTransactionId = @DeleteTransactionId
            WHERE
                tp_SiteId = @WebSiteId AND
                tp_DeleteTransactionId = 0x AND
                tp_IsCurrentVersion = CAST(1 as bit) AND
                tp_DirName = @DeleteDirName AND
                tp_LeafName = @DeleteLeafName
            UPDATE
                AllUserDataJunctions
            SET
                tp_DeleteTransactionId = @DeleteTransactionId
            WHERE
                tp_SiteId = @WebSiteId AND
                tp_DeleteTransactionId = 0x AND
                tp_IsCurrentVersion = CAST(0 as bit) AND
                tp_DirName = @DeleteDirName AND
                tp_LeafName = @DeleteLeafName
        END
        IF @DeleteOp = 3
        BEGIN
            SET @FreedSpace = @FreedSpace + ISNULL((
                SELECT
                    SUM(Size)
                FROM
                    RecycleBin
                WHERE
                    SiteId = @WebSiteId AND
                    WebId = @WebId AND
                    (BinId = 1) AND
                    DocId = @DocId),0)
            DELETE FROM
                RecycleBin
            WHERE
                SiteId = @WebSiteId AND
                WebId = @WebId AND
                DocId = @DocId
        END
        IF @ListRowId IS NOT NULL
            SET @ItemCountDelta = 1
        IF @ListRowId IS NULL AND @LogChange = 1
        BEGIN
            EXEC proc_LogChange @WebSiteId, @WebId, NULL, NULL, @DocId,
                NULL, NULL, @Url, 16384,
                16, @DeleteDTM
        END    
    END
    IF (@FreedSpace > 0)
    BEGIN
        SET @FreedSpace = -@FreedSpace
        EXEC proc_AppendSiteQuota
            @WebSiteId, @FreedSpace, 1
        SET @FreedSpace = 0
    END
    ELSE
    BEGIN
        EXEC proc_AppendSiteQuota
            @WebSiteId, 0, 1
    END
    IF @DeleteOp = 3
    BEGIN
        DELETE FROM
            Docs
        WHERE
            SiteId = @WebSiteId AND
            DirName = @DeleteDirName AND
            LeafName = @DeleteLeafName
        DELETE FROM
            DocStreams
        WHERE
            SiteId = @WebSiteId AND
            ParentId = @DocParentId AND
            Id = @DocId
        DELETE FROM 
            BuildDependencies
         WHERE
            SiteId = @WebSiteId AND
            DirName = @DeleteDirName AND
            LeafName = @DeleteLeafName
    END
    ELSE
    BEGIN
        SET @Size = @Size + ISNULL((
            SELECT
                SUM(CAST(ISNULL(Size, 0) AS BIGINT) +
                    CAST(ISNULL(MetaInfoSize, 0) AS BIGINT) +
                    CAST(ISNULL(UnVersionedMetaInfoSize, 0) AS BIGINT) +
                    CAST(152 AS BIGINT))
            FROM
                Docs
            WHERE
                SiteId = @WebSiteId AND
                DirName = @DeleteDirName AND
                LeafName = @DeleteLeafName),0)
        UPDATE
            Docs
        SET
            DeleteTransactionId = CAST(@DeleteTransactionId AS varbinary(16)),
            BuildDependencySet = NULL
        WHERE
            SiteId = @WebSiteId AND
            DirName = @DeleteDirName AND
            LeafName = @DeleteLeafName
        UPDATE
            DocStreams
        SET
            DeleteTransactionId = CAST(@DeleteTransactionId AS varbinary(16))
        WHERE
            SiteId = @WebSiteId AND
            ParentId = @DocParentId AND
            Id = @DocId
        DELETE FROM 
            BuildDependencies
         WHERE
            SiteId = @WebSiteId AND
            DirName = @DeleteDirName AND
            LeafName = @DeleteLeafName
    END
    EXEC proc_UpdateChildCount @WebSiteId, @DeleteDirName, @DeleteLeafName,
                               @ListRowId, 0, @DeleteType, -1
    DECLARE @SubImgUrl nvarchar(260)
    IF NOT ((DATALENGTH(@ThumbnailDirName) = 0) AND (DATALENGTH(@SubImgLeafName) = 0))
    BEGIN
        SET @SubImgUrl = CASE WHEN (DATALENGTH(@ThumbnailDirName) = 0) THEN @SubImgLeafName WHEN (DATALENGTH(@SubImgLeafName) = 0) THEN @ThumbnailDirName ELSE @ThumbnailDirName + N'/' + @SubImgLeafName END
        EXEC proc_DeleteUrlCore
            @WebSiteId,
            @WebId,
            @SubImgUrl,
            @UserId,
            @LogChange,
            NULL,
            0,
            0,
            0,
            3,
            1,
            @DeleteOp,
            @DeleteTransactionId,
            0,
            NULL,
            @Size OUTPUT
    END
    IF NOT ((DATALENGTH(@WebImageDirName) = 0) AND (DATALENGTH(@SubImgLeafName) = 0))
    BEGIN
        SET @SubImgUrl = CASE WHEN (DATALENGTH(@WebImageDirName) = 0) THEN @SubImgLeafName WHEN (DATALENGTH(@SubImgLeafName) = 0) THEN @WebImageDirName ELSE @WebImageDirName + N'/' + @SubImgLeafName END
        EXEC proc_DeleteUrlCore
            @WebSiteId,
            @WebId,
            @SubImgUrl,
            @UserId,
            @LogChange,
            NULL,
            0,
            0,
            0,
            3,
            1,
            @DeleteOp,
            @DeleteTransactionId,
            0,
            NULL,
            @Size OUTPUT
    END
    IF @ListRowId IS NOT NULL AND @DeleteType = 0
    BEGIN
        DECLARE @ItemDirName nvarchar(256)
        DECLARE @DirName nvarchar(256)
        DECLARE @AttachmentSubfolderUrl   nvarchar(260)
        SELECT 
            @DirName = Docs.DirName,
            @ItemDirName = CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END,
            @AttachmentSubfolderUrl = 
            CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END +
            N'/'+N'Attachments'+N'/' + CAST(@ListRowId AS NVARCHAR(10))
        FROM Docs, Lists
        WHERE
            Lists.tp_WebId      = @WebId AND
            Lists.tp_ID         = @ListId AND
            Lists.tp_RootFolder = Docs.Id
        EXEC proc_DeleteUrlCore @WebSiteId, @WebId,
            @AttachmentSubfolderUrl, @UserId, @LogChange, NULL, 0, 0, 0,
            3, 1, @DeleteOp,
            @DeleteTransactionId, 0, NULL, @Size OUTPUT
    END
    IF @DeleteType = 1
    BEGIN
        IF @DeleteOp = 3
        BEGIN
            DELETE FROM
                Links
            WHERE
                SiteId = @WebSiteId AND
                (DirName = @Url OR
                    DirName LIKE @UrlLike)
        END
        ELSE
        BEGIN
            UPDATE
                Links
            SET
                DeleteTransactionId = @DeleteTransactionId
            WHERE
                SiteId = @WebSiteId AND
                (DirName = @Url OR
                    DirName LIKE @UrlLike)
        END
        EXEC proc_ResyncWelcomeLinks @WebSiteId, @Url, NULL, NULL
    END
    IF @DeleteType = 0
    BEGIN
        IF @DeleteOp = 3
        BEGIN
            DELETE FROM
                Links
            WHERE
                SiteId = @WebSiteId AND
                DirName = @DeleteDirName AND
                LeafName = @DeleteLeafName
        END
        ELSE
        BEGIN
            UPDATE
                Links
            SET
                DeleteTransactionId = @DeleteTransactionId
            WHERE
                SiteId = @WebSiteId AND
                DirName = @DeleteDirName AND
                LeafName = @DeleteLeafName
        END
        EXEC proc_ResyncWelcomeLinks @WebSiteId, @DeleteDirName,
            @DeleteLeafName, NULL
    END
    IF @DeleteType = 1
    BEGIN
        IF @DeleteOp = 3
        BEGIN
            DELETE FROM
                Deps
            WHERE
                SiteId = @WebSiteId AND
                DeleteTransactionId = 0x AND
                FullUrl LIKE @UrlLike
        END
        ELSE
        BEGIN
            UPDATE
                Deps
            SET
                DeleteTransactionId = @DeleteTransactionId
            WHERE
                SiteId = @WebSiteId AND
                DeleteTransactionId = 0x AND
                FullUrl LIKE @UrlLike
        END
    END
    IF @DeleteOp = 3
    BEGIN
        DELETE FROM
            Deps
        WHERE
            SiteId = @WebSiteId AND
            DeleteTransactionId = 0x AND
            FullUrl = @Url
    END
    ELSE
    BEGIN
        UPDATE
            Deps
        SET
            DeleteTransactionId = @DeleteTransactionId
        WHERE
            SiteId = @WebSiteId AND
            DeleteTransactionId = 0x AND
            FullUrl = @Url
    END
    IF @DeleteOp = 3
    BEGIN
        DELETE RoleAssignment
        FROM RoleAssignment, Perms
        WHERE
            RoleAssignment.SiteId = @WebSiteId AND
            RoleAssignment.ScopeId = Perms.ScopeId AND
            Perms.SiteId = @WebSiteId AND
            DelTransId = 0x AND
                (ScopeUrl = @Url OR ScopeUrl LIKE @UrlLike)
        DELETE FROM
            Perms
        WHERE
            SiteId = @WebSiteId AND
            DelTransId = 0x AND
                (ScopeUrl = @Url OR ScopeUrl LIKE @UrlLike)
    END
    ELSE
    BEGIN
        UPDATE 
            Perms
        SET
            DelTransId = @DeleteTransactionId
        WHERE
            SiteId = @WebSiteId AND
            DelTransId = 0x AND
                (ScopeUrl = @Url OR ScopeUrl LIKE @UrlLike)
    END
    IF (@DeleteType = 0 AND
        @AttachmentsFlag = 1)
        EXEC proc_UpdateAttachmentsFlag 
            @WebSiteId, @DeleteDirName, @UserId, @AttachmentOp
    DECLARE @DtmNow DateTime
    SET @DtmNow = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    UPDATE
        Lists
    SET
        tp_ItemCount = tp_ItemCount - @ItemCountDelta,
        tp_Modified = @DtmNow,
        tp_LastDeleted = @DtmNow
    WHERE
        tp_WebId = @WebId AND
        tp_Id = @ListId
    IF @NewDeleteTransaction = 1
    BEGIN
        UPDATE
            RecycleBin
        SET
            Size = @Size
        WHERE
            SiteId = @WebSiteId AND
            WebId = @WebId AND
            BinId = @BinId AND
            DeleteUserId = @UserId AND
            DeleteTransactionId = @DeleteTransactionId
    END
cleanup:
    RETURN @ReturnStatus

GO
