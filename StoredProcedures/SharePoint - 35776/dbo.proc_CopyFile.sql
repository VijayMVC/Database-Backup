/****** Object:  StoredProcedure [dbo].[proc_CopyFile]    Script Date: 5/15/2018 12:11:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CopyFile(
    @SiteId          uniqueidentifier,
    @SubWebId        uniqueidentifier,
    @SubWebUrl       nvarchar(256),
    @OldUrl          nvarchar(260),
    @NewUrl          nvarchar(260),
    @NewDocParentId  uniqueidentifier,
    @UserId          int,
    @RenameFlags     int = 0,
    @PutFlags        int = 0,
    @ReturnFlags     int = 0,
    @AttachmentOp    int = 3,
    @ParseDocsNow    bit OUTPUT,
    @FailedDirName   nvarchar(256) OUTPUT,
    @FailedLeafName  nvarchar(128) OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @OldDocID uniqueidentifier
    DECLARE @NewDocID uniqueidentifier
    DECLARE @cbSize bigint
    SET @cbSize = 0
    DECLARE @OldUrlDirName nvarchar(256)
    DECLARE @NewUrlDirName nvarchar(256)
    DECLARE @OldUrlLeafName nvarchar(128)
    DECLARE @NewUrlLeafName nvarchar(128)
    DECLARE @OldUrlBaseName nvarchar(128)
    DECLARE @OldUrlExtension nvarchar(128)
    DECLARE @NewUrlBaseName nvarchar(128)
    DECLARE @NewUrlExtension nvarchar(128)
    DECLARE @OldListId uniqueidentifier
    DECLARE @OldBaseType int
    DECLARE @OldDoclibRowId int
    DECLARE @OldDoclibExcludedType int
    DECLARE @OldDocParentId uniqueidentifier
    DECLARE @NewListId uniqueidentifier
    DECLARE @NewBaseType int
    DECLARE @NewListFlag bigint
    DECLARE @NewUIVersion int
    DECLARE @NewModerationStatus int
    DECLARE @NewLevel tinyint
    DECLARE @NewDoclibRowId int
    DECLARE @NewDoclibExcludedType int
    DECLARE @NewDocFlags int
    DECLARE @IgnoreWebId bit
    DECLARE @WebId uniqueidentifier
    DECLARE @FetchLevel tinyint
    DECLARE @Level tinyint
    DECLARE @NewDraftOwnerId int
    IF (@RenameFlags & 512) <> 0
        SET @IgnoreWebId = 1
    ELSE
        SET @IgnoreWebId = 0
    IF (@RenameFlags & 1024) <> 0
        SET @FetchLevel = 2
    ELSE
        SET @FetchLevel = 1
    SET @OldDoclibExcludedType = 0x00
    SET @NewDoclibExcludedType = 0x00
    DECLARE @OldDocSize int
    DECLARE @RetVal int
    SET @RetVal = 0
    DECLARE @tp_GUID uniqueidentifier
    SET @tp_GUID = NEWID()
    DECLARE @MaxNewListRowOrd int
    DECLARE @Now datetime
    SELECT @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE());
        DECLARE @quotaOrLockStatus int
        SELECT @quotaOrLockStatus = dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
        IF (@quotaOrLockStatus = 1)
        BEGIN
            RETURN 1816
        END
        ELSE IF (@quotaOrLockStatus > 1)
        BEGIN
            RETURN 212
        END
    EXEC proc_SplitUrl
        @OldUrl,
        @OldUrlDirName OUTPUT,
        @OldUrlLeafName OUTPUT
    EXEC proc_SplitUrl
        @NewUrl,
        @NewUrlDirName OUTPUT,
        @NewUrlLeafName OUTPUT
    EXEC proc_SplitLeafName
        @OldUrlLeafName,
        @OldUrlBaseName OUTPUT,
        @OldUrlExtension OUTPUT
    EXEC proc_SplitLeafName
        @NewUrlLeafName,
        @NewUrlBaseName OUTPUT,
        @NewUrlExtension OUTPUT
    EXEC @RetVal = proc_CanonicalDirNameFromUserInput
        @SiteId,
        @SubWebId,
        @NewUrlDirName OUTPUT,
        @NewDocParentId OUTPUT,
        null,
        @IgnoreWebId
    IF 0 <> @RetVal
    BEGIN
        RETURN @RetVal
    END
    SET @NewUrl = CASE WHEN (DATALENGTH(@NewUrlDirName) = 0) THEN @NewUrlLeafName WHEN (DATALENGTH(@NewUrlLeafName) = 0) THEN @NewUrlDirName ELSE @NewUrlDirName + N'/' + @NewUrlLeafName END
    EXEC @RetVal = proc_ValidateCopyFile @SiteId, @SubWebId,
        @SubWebUrl, @OldUrl, @NewUrl, @UserId, @RenameFlags,
        @OldListId OUTPUT, @OldBaseType OUTPUT,
        @OldDoclibExcludedType OUTPUT,
        @NewListId OUTPUT, @NewBaseType OUTPUT,
        @NewDoclibExcludedType OUTPUT, @FailedDirName OUTPUT,
        @FailedLeafName OUTPUT
    IF @RetVal <> 0
    BEGIN
        RETURN @RetVal
    END
    SELECT TOP 1
        @OldDocSize = Docs.Size,
        @OldDoclibRowId = Docs.DoclibRowId,
        @OldDocParentId = Docs.ParentId,
        @OldDocID = Docs.Id,
        @NewDocFlags = Docs.DocFlags
    FROM
        Docs WITH (REPEATABLEREAD)
    WHERE
        SiteId = @SiteId AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName AND
        WebId = @SubWebId AND
        Type = 0
    IF @@ROWCOUNT <> 1
    BEGIN
        RETURN 1150
    END
    EXEC proc_GetLevel  
        @SiteId, 
        @OldUrlDirName, 
        @OldUrlLeafName, 
        @UserId,
        @FetchLevel,
        @Level OUTPUT
    IF (@RenameFlags & 1024) = 0 AND @Level = 2
    BEGIN
        RETURN 2
    END          
    IF (@ReturnFlags & 0x01) = 0x01
    BEGIN
        SELECT
            @OldUrlDirName, @OldUrlLeafName,
            @NewUrlDirName, @NewUrlLeafName, 0
    END
    IF @OldUrlExtension <> @NewUrlExtension
    BEGIN
        SET @NewDocFlags = @NewDocFlags &
            ~(0 | 4 | 8)
        IF @RenameFlags & 64 =
            64
        BEGIN
            SET @NewDocFlags = @NewDocFlags | 4
        END
        IF @RenameFlags & 128 =
            128
        BEGIN
            SET @NewDocFlags = @NewDocFlags | 8
        END
        SET @ParseDocsNow = 1 
    END
    SET @NewDoclibRowId = NULL
    SET @NewDocID = NEWID()
    SET @NewUIVersion = 512
    SET @NewModerationStatus = 0
    SET @NewLevel = 1
    SET @NewDraftOwnerId = NULL
    IF @NewListId IS NOT NULL AND
            @NewBaseType = 1
    BEGIN
        SELECT 
            @NewListFlag = tp_Flags
        FROM
            Lists
        WHERE
            tp_WebId = @SubWebId AND
            tp_ID = @NewListId
        IF  (@NewListFlag & 0x80000 <> 0)
        BEGIN
            SET @NewUIVersion = 1
            IF (@NewListFlag & 0x400 <> 0)             
                SET @NewModerationStatus = 3
            ELSE
                SET @NewModerationStatus = 2
        END
        ELSE
        BEGIN
            SET @NewUIVersion = 512
            IF (@NewListFlag & 0x400 <> 0)             
                SET @NewModerationStatus = 2
            ELSE
                SET @NewModerationStatus = 0
        END
        IF @NewModerationStatus <> 0
        BEGIN
            SET @NewLevel = 2
            SET @NewDraftOwnerId = @UserID
        END
    END
    IF @OldListId IS NOT NULL OR @NewListId IS NOT NULL
    BEGIN
        IF (@OldListId IS NULL OR
            @OldBaseType <> 1) AND
            @NewListId IS NOT NULL AND
            @NewBaseType = 1 AND
            @NewDoclibExcludedType <> 0x01 AND
            (@RenameFlags & 512) = 0
        BEGIN
            SET @ParseDocsNow = 1
            EXEC @NewDoclibRowId =
                proc_GenerateNextId @SubWebId, @NewListId
            INSERT INTO AllUserData(
                tp_ID,
                tp_Level,
                tp_ListId,
                tp_SiteId,
                tp_DirName,
                tp_LeafName,
                tp_RowOrdinal,
                tp_Version,
                tp_Author,
                tp_Editor,
                tp_DraftOwnerId,
                tp_Created,
                tp_Modified,
                tp_Ordering,
                tp_ItemOrder,
                tp_InstanceID,
                tp_Size,                
                tp_ModerationStatus)
            VALUES (
                @NewDoclibRowId,
                @NewLevel,
                @NewListId,
                @SiteId,
                @NewUrlDirName,
                @NewUrlLeafName,
                0,
                0,
                @UserID,
                @UserID,
                @NewDraftOwnerId,
                @Now,
                @Now,
                NULL,
                NULL,
                NULL,
                0,
                @NewModerationStatus)
            IF @@ROWCOUNT <> 1
                RETURN 87
            SELECT 
                @MaxNewListRowOrd = tp_MaxRowOrdinal
            FROM 
                Lists
            WHERE
                tp_WebID = @SubWebID AND
                tp_ID = @NewListID
            DECLARE @rowOrdCount int
            SET @rowOrdCount = 1
            IF @MaxNewListRowOrd > 0
            BEGIN
                WHILE  @rowOrdCount  <= @MaxNewListRowOrd
                BEGIN
                    INSERT INTO AllUserData(
                        tp_ID,
                        tp_Level,
                        tp_ListId,
                        tp_SiteId,
                        tp_DirName,
                        tp_LeafName,
                        tp_RowOrdinal,
                        tp_Version,
                        tp_Author,
                        tp_Editor,
                        tp_DraftOwnerId,                        
                        tp_Created,
                        tp_Modified,
                        tp_Ordering,
                        tp_ItemOrder,
                        tp_InstanceID,
                        tp_Size,
                        tp_ModerationStatus)
                    VALUES (
                        @NewDoclibRowId,
                        @NewLevel,
                        @NewListId,
                        @SiteId,
                        @NewUrlDirName,
                        @NewUrlLeafName,
                        @rowOrdCount,
                        0,
                        @UserID,
                        @UserID,
                        @NewDraftOwnerId,
                        @Now,
                        @Now,
                        NULL,
                        NULL,
                        NULL,
                        0,
                        @NewModerationStatus)
                      SET @rowOrdCount = @rowOrdCount + 1
                END               
            END
            UPDATE
                Lists
            SET
                tp_ItemCount = tp_ItemCount + 1,
                tp_Modified = @Now
            WHERE
                tp_WebID = @SubWebID AND
                tp_ID = @NewListID
        END
        IF (@OldListId IS NOT NULL AND
            @OldBaseType = 1 AND
            @OldDoclibRowId IS NOT NULL AND
            @NewListId IS NOT NULL AND
            @NewBaseType = 1)
        BEGIN
            DECLARE @FullUrl nvarchar(260)
            SET @FullUrl = CASE WHEN (DATALENGTH(@OldUrlDirName) = 0) THEN N'_t' WHEN (DATALENGTH(N'_t') = 0) THEN @OldUrlDirName ELSE @OldUrlDirName + N'/' + N'_t' END
            IF EXISTS (SELECT *
                FROM Docs
                WHERE 
                    SiteId = @SiteId AND
                    DirName = @FullUrl AND
                    Type = 0 )
            BEGIN
                SET @ParseDocsNow = 1
            END
            EXEC @NewDoclibRowId =
                proc_GenerateNextId @SubWebId, @NewListId
            IF @OldListId = @NewListId
            BEGIN
                INSERT INTO AllUserData(
                    tp_ID,
                    tp_Level,
                    tp_GUID,
                    tp_ListId,
                    tp_SiteId,
                    tp_DirName,
                    tp_LeafName,
                    tp_RowOrdinal, 
                    tp_Version,
                    tp_Author,
                    tp_Editor,
                    tp_DraftOwnerId,                    
                    tp_Created,
                    tp_Modified,                    
                    tp_Ordering,
                    tp_ThreadIndex,
                    tp_ItemOrder,
                    tp_InstanceID,
                    tp_Size,
                    tp_ModerationStatus,
                    tp_UIVersion,
                    tp_ContentType,
                    tp_ContentTypeId,
                    nvarchar1,
                    nvarchar2,
                    nvarchar3,
                    nvarchar4,
                    nvarchar5,
                    nvarchar6,
                    nvarchar7,
                    nvarchar8,
                    nvarchar9,
                    nvarchar10,
                    nvarchar11,
                    nvarchar12,
                    nvarchar13,
                    nvarchar14,
                    nvarchar15,
                    nvarchar16,
                    nvarchar17,
                    nvarchar18,
                    nvarchar19,
                    nvarchar20,
                    nvarchar21,
                    nvarchar22,
                    nvarchar23,
                    nvarchar24,
                    nvarchar25,
                    nvarchar26,
                    nvarchar27,
                    nvarchar28,
                    nvarchar29,
                    nvarchar30,
                    nvarchar31,
                    nvarchar32,
                    nvarchar33,
                    nvarchar34,
                    nvarchar35,
                    nvarchar36,
                    nvarchar37,
                    nvarchar38,
                    nvarchar39,
                    nvarchar40,
                    nvarchar41,
                    nvarchar42,
                    nvarchar43,
                    nvarchar44,
                    nvarchar45,
                    nvarchar46,
                    nvarchar47,
                    nvarchar48,
                    nvarchar49,
                    nvarchar50,
                    nvarchar51,
                    nvarchar52,
                    nvarchar53,
                    nvarchar54,
                    nvarchar55,
                    nvarchar56,
                    nvarchar57,
                    nvarchar58,
                    nvarchar59,
                    nvarchar60,
                    nvarchar61,
                    nvarchar62,
                    nvarchar63,
                    nvarchar64,
                    int1,
                    int2,
                    int3,
                    int4,
                    int5,
                    int6,
                    int7,
                    int8,
                    int9,
                    int10,
                    int11,
                    int12,
                    int13,
                    int14,
                    int15,
                    int16,
                    float1,
                    float2,
                    float3,
                    float4,
                    float5,
                    float6,
                    float7,
                    float8,
                    float9,
                    float10,
                    float11,
                    float12,
                    datetime1,
                    datetime2,
                    datetime3,
                    datetime4,
                    datetime5,
                    datetime6,
                    datetime7,
                    datetime8,
                    bit1,
                    bit2,
                    bit3,
                    bit4,
                    bit5,
                    bit6,
                    bit7,
                    bit8,
                    bit9,
                    bit10,
                    bit11,
                    bit12,
                    bit13,
                    bit14,
                    bit15,
                    bit16,
                    uniqueidentifier1,
                    ntext1,
                    ntext2,
                    ntext3,
                    ntext4,
                    ntext5,
                    ntext6,
                    ntext7,
                    ntext8,
                    ntext9,
                    ntext10,
                    ntext11,
                    ntext12,
                    ntext13,
                    ntext14,
                    ntext15,
                    ntext16,
                    ntext17,
                    ntext18,
                    ntext19,
                    ntext20,
                    ntext21,
                    ntext22,
                    ntext23,
                    ntext24,
                    ntext25,
                    ntext26,
                    ntext27,
                    ntext28,
                    ntext29,
                    ntext30,
                    ntext31,
                    ntext32,
                    sql_variant1,
                    sql_variant2,
                    sql_variant3,
                    sql_variant4,
                    sql_variant5,
                    sql_variant6,
                    sql_variant7,
                    sql_variant8)
                SELECT
                    @NewDoclibRowId,
                    @NewLevel,
                    @tp_GUID,
                    @NewListID,
                    @SiteId,
                    @NewUrlDirName,
                    @NewUrlLeafName,
                    tp_RowOrdinal,
                    0,
                    tp_Author,
                    @UserID,
                    @NewDraftOwnerId,
                    tp_Created,
                    @Now,
                    tp_Ordering,
                    tp_ThreadIndex,
                    tp_ItemOrder,
                    tp_InstanceID,
                    tp_Size,
                    @NewModerationStatus,
                    @NewUIVersion,
                    tp_ContentType,
                    tp_ContentTypeId,
                    nvarchar1,
                    nvarchar2,
                    nvarchar3,
                    nvarchar4,
                    nvarchar5,
                    nvarchar6,
                    nvarchar7,
                    nvarchar8,
                    nvarchar9,
                    nvarchar10,
                    nvarchar11,
                    nvarchar12,
                    nvarchar13,
                    nvarchar14,
                    nvarchar15,
                    nvarchar16,
                    nvarchar17,
                    nvarchar18,
                    nvarchar19,
                    nvarchar20,
                    nvarchar21,
                    nvarchar22,
                    nvarchar23,
                    nvarchar24,
                    nvarchar25,
                    nvarchar26,
                    nvarchar27,
                    nvarchar28,
                    nvarchar29,
                    nvarchar30,
                    nvarchar31,
                    nvarchar32,
                    nvarchar33,
                    nvarchar34,
                    nvarchar35,
                    nvarchar36,
                    nvarchar37,
                    nvarchar38,
                    nvarchar39,
                    nvarchar40,
                    nvarchar41,
                    nvarchar42,
                    nvarchar43,
                    nvarchar44,
                    nvarchar45,
                    nvarchar46,
                    nvarchar47,
                    nvarchar48,
                    nvarchar49,
                    nvarchar50,
                    nvarchar51,
                    nvarchar52,
                    nvarchar53,
                    nvarchar54,
                    nvarchar55,
                    nvarchar56,
                    nvarchar57,
                    nvarchar58,
                    nvarchar59,
                    nvarchar60,
                    nvarchar61,
                    nvarchar62,
                    nvarchar63,
                    nvarchar64,
                    int1,
                    int2,
                    int3,
                    int4,
                    int5,
                    int6,
                    int7,
                    int8,
                    int9,
                    int10,
                    int11,
                    int12,
                    int13,
                    int14,
                    int15,
                    int16,
                    float1,
                    float2,
                    float3,
                    float4,
                    float5,
                    float6,
                    float7,
                    float8,
                    float9,
                    float10,
                    float11,
                    float12,
                    datetime1,
                    datetime2,
                    datetime3,
                    datetime4,
                    datetime5,
                    datetime6,
                    datetime7,
                    datetime8,
                    bit1,
                    bit2,
                    bit3,
                    bit4,
                    bit5,
                    bit6,
                    bit7,
                    bit8,
                    bit9,
                    bit10,
                    bit11,
                    bit12,
                    bit13,
                    bit14,
                    bit15,
                    bit16,
                    uniqueidentifier1,
                    ntext1,
                    ntext2,
                    ntext3,
                    ntext4,
                    ntext5,
                    ntext6,
                    ntext7,
                    ntext8,
                    ntext9,
                    ntext10,
                    ntext11,
                    ntext12,
                    ntext13,
                    ntext14,
                    ntext15,
                    ntext16,
                    ntext17,
                    ntext18,
                    ntext19,
                    ntext20,
                    ntext21,
                    ntext22,
                    ntext23,
                    ntext24,
                    ntext25,
                    ntext26,
                    ntext27,
                    ntext28,
                    ntext29,
                    ntext30,
                    ntext31,
                    ntext32,
                    sql_variant1,
                    sql_variant2,
                    sql_variant3,
                    sql_variant4,
                    sql_variant5,
                    sql_variant6,
                    sql_variant7,
                    sql_variant8
            FROM
                UserData
            WHERE
                tp_ListId = @OldListId AND
                tp_ID = @OldDoclibRowId AND
                tp_Level = @Level
            IF @@ROWCOUNT = 0
            BEGIN
                RETURN 87
            END
            EXEC proc_CloneItemInNameValuePair
                @SiteId,
                @OldListId,
                @OldDoclibRowId,
                @NewDoclibRowId,
                @Level,
                @NewLevel
            EXEC proc_UpdateItemInNameValuePair
                @SiteId, NULL, @OldListId, @NewDoclibRowId, @NewLevel,
                '{d31655d1-1d5b-4511-95a1-7a09e9b75bf2}', @UserID,
                '{28cf69c5-fa48-462a-b5cd-27b6f9d2bd5f}', @Now,
                '{7841bf41-43d0-4434-9f50-a673baef7631}', @NewUIVersion
            SELECT
                @cbSize = @cbSize + ISNULL(tp_Size,0)
            FROM
                UserData
            WHERE
                tp_ListId = @OldListId AND
                tp_ID = @OldDoclibRowId AND
                tp_Level = @Level
            UPDATE
                Lists
            SET
                tp_ItemCount = tp_ItemCount + 1,
                tp_Modified = @Now
            WHERE
                tp_WebID = @SubWebID AND
                tp_ID = @NewListID
            END
            ELSE
            BEGIN
                SET @ParseDocsNow = 1
                INSERT INTO AllUserData (
                    tp_ID,
                    tp_Level,
                    tp_ListId,
                    tp_SiteId,
                    tp_DirName,
                    tp_LeafName,
                    tp_RowOrdinal,
                    tp_Version,
                    tp_Author,
                    tp_Editor,
                    tp_DraftOwnerId,
                    tp_Created,
                    tp_Modified,
                    tp_Ordering,
                    tp_ItemOrder,
                    tp_InstanceID,
                    tp_Size,
                    tp_ModerationStatus)
                SELECT 
                    @NewDoclibRowId,
                    @NewLevel,
                    @NewListId,
                    @SiteId,
                    @NewUrlDirName,
                    @NewUrlLeafName,
                    0,
                    0,
                    tp_Author,
                    @UserID,
                    @NewDraftOwnerId,
                    tp_Created,
                    @Now,
                    NULL,
                    NULL,
                    NULL,
                    0,
                    @NewModerationStatus
                FROM
                    UserData
                WHERE
                    tp_ListId = @OldListId AND
                    tp_ID = @OldDoclibRowId AND
                    tp_RowOrdinal = 0 AND
                    tp_Level = @Level
                IF @@ROWCOUNT <> 1
                BEGIN
                    RETURN 87
                END
                SELECT 
                    @MaxNewListRowOrd = tp_MaxRowOrdinal
                FROM 
                    Lists
                WHERE
                    tp_WebID = @SubWebID AND
                    tp_ID = @NewListID
                SET @rowOrdCount = 1
                IF @MaxNewListRowOrd > 0
                BEGIN
                    WHILE  @rowOrdCount  <= @MaxNewListRowOrd
                    BEGIN
                        INSERT INTO AllUserData (
                            tp_ID,
                            tp_ListId,
                            tp_SiteId,
                            tp_DirName,
                            tp_LeafName,
                            tp_RowOrdinal,
                            tp_Version,
                            tp_Author,
                            tp_Editor,
                            tp_DraftOwnerId,
                            tp_Created,
                            tp_Modified,
                            tp_Ordering,
                            tp_ItemOrder,
                            tp_InstanceID,
                            tp_Size,
                            tp_Level,
                            tp_ModerationStatus)
                        SELECT 
                            tp_ID,
                            tp_ListId,
                            tp_SiteId,
                            tp_DirName,
                            tp_LeafName,
                            @rowOrdCount,
                            tp_Version,
                            tp_Author,
                            tp_Editor,
                            @NewDraftOwnerId,
                            tp_Created,
                            tp_Modified,
                            tp_Ordering,
                            tp_ItemOrder,
                            tp_InstanceID,
                            tp_Size,
                            @NewLevel,
                            @NewModerationStatus
                        FROM
                            UserData
                        WHERE
                            tp_ListId = @NewListId AND
                            tp_ID =  @NewDoclibRowId AND
                            tp_RowOrdinal = 0 AND
                            tp_Level = @Level
                          SET @rowOrdCount = @rowOrdCount + 1
                    END
                END
                UPDATE
                    Lists
                SET
                    tp_ItemCount = tp_ItemCount + 1,
                    tp_Modified = @Now
                WHERE
                    tp_WebID = @SubWebID AND
                    tp_ID = @NewListID
        END
        END
    END
    DECLARE @DstScopeId uniqueidentifier
    DECLARE @DstFolderId int
    EXEC proc_GetFolderInfo @SiteId, @NewUrlDirName, @DstScopeId OUTPUT, @WebId OUTPUT, @DstFolderId OUTPUT
    IF (@NewListId is NULL) AND (@WebID != @SubWebId)
    BEGIN
        EXEC proc_GetContainingListOutput @SiteId, @WebId, @NewUrl, @NewListID OUTPUT
    END
    INSERT INTO AllDocs  (Id,
        Level,
        SiteId,
        ParentId,
        DirName, 
        LeafName,
        WebId,
        Type, 
        Size, 
        MetaInfoSize,
        Version, 
        UIVersion,
        Dirty,
        CacheParseId,
        DocFlags,
        TimeCreated,
        TimeLastModified,
        MetaInfoTimeLastModified,
        TimeLastWritten,
        MetaInfo,
        ThicketFlag,
        CharSet,
        ProgId,
        SetupPathVersion,
        SetupPath,
        SetupPathUser,
        ListId,
        DoclibRowId,
        ScopeId,
        DraftOwnerId)
    SELECT
        @NewDocID,
        @NewLevel,
        SiteId,
        @NewDocParentId,
        @NewUrlDirName,
        @NewUrlLeafName,
        @WebId,
        Type,
        Size,
        MetaInfoSize,
        1,
        @NewUIVersion,
        CASE
        WHEN
            @NewDocFlags & 4 = 4
        THEN
            1
        WHEN
            Dirty IS NOT NULL
        THEN
            0
        ELSE
            Dirty
        END,
        NULL,
        @NewDocFlags & ~32 & ~512,
        TimeCreated,
        TimeLastModified = CASE
            WHEN
                TimeLastModified IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        MetaInfoTimeLastModified =
        CASE
            WHEN
                MetaInfoTimeLastModified IS NULL
            THEN
                NULL
            ELSE
                @Now
        END,
        TimeLastWritten = CASE
            WHEN
                TimeLastWritten IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,                          
        MetaInfo,
        ThicketFlag,
        CharSet,
        ProgId,
        SetupPathVersion,
        SetupPath,
        SetupPathUser,
        @NewListId,
        @NewDoclibRowId,
        @DstScopeId,
        @NewDraftOwnerId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName AND
        Level = @Level
    IF (@@ERROR <> 0)
    BEGIN
        RETURN 1150
    END
    INSERT INTO AllDocStreams  (Id,
        SiteId,
        ParentId,
        Level,
        Size, 
        Content)
    SELECT
        @NewDocID,
        SiteId,
        @NewDocParentId,
        @NewLevel,
        Size,
        Content
    FROM
        DocStreams
    WHERE
        SiteId = @SiteId AND
        ParentId = @OldDocParentId AND
        Id = @OldDocID AND
        Level = @Level
    IF (@@ERROR <> 0)
    BEGIN
        RETURN 1150
    END
    SELECT 
        @cbSize = @cbSize + 152 + ISNULL(Size, 0) +
            ISNULL(MetaInfoSize, 0) +
            ISNULL(UnVersionedMetaInfoSize, 0)
    FROM 
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName AND
        Level = @Level
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbSize, 1
    INSERT INTO Links  (SiteId,
        DirName, 
        LeafName,
        Level,
        FieldId,
        TargetDirName, 
        TargetLeafName, 
        Type, 
        Security, 
        Dynamic, 
        ServerRel,
        PointsToDir,
        LinkNumber)
    SELECT
        @SiteId,
        @NewUrlDirName,
        @NewUrlLeafName,
        @NewLevel,
        FieldId,
        TargetDirName,
        CASE
        WHEN (TargetDirName = @OldUrlDirName AND
            TargetLeafName = @OldUrlLeafName)
        THEN
            @NewUrlLeafName
        ELSE
            TargetLeafName
        END AS NewTargetLeafName,
        Type,
        Security,
        Dynamic,
        ServerRel,
        PointsToDir,
        LinkNumber
    FROM
        Links
    WHERE
        SiteId = @SiteId AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName AND
        Level = @Level AND
        WebPartId IS NULL   
    IF (@@ERROR <> 0)
    BEGIN
        RETURN 1150
    END
    INSERT INTO Deps (SiteId,
        FullUrl,
        Level,
        DepType,
        DepDesc)
    SELECT
        @SiteId,
        STUFF(FullUrl, 1, LEN(@OldUrl), @NewUrl),
        @NewLevel,
        DepType,
        DepDesc
    FROM
        Deps                        
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = 0x AND
        FullUrl = @OldUrl AND
        Level = @Level
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    EXEC @retval = proc_CopyWebParts @SiteId,
        @OldDocID, 
        @OldUrlDirName, 
        @OldUrlLeafName, 
        @NewDocID,
        @NewUrlDirName,
        @NewUrlLeafName,
        0,                   
        @Level,
        @NewLevel
    IF (@retval <> 0 )
    BEGIN
        RETURN @retval
    END
    EXEC proc_ResyncWelcomeLinks @SiteId, @NewUrlDirName,
        @NewUrlLeafName, NULL
    IF @AttachmentOp <> 0
        EXEC proc_UpdateAttachmentsFlag @SiteId, 
            @NewUrlDirName,
            @UserId, 
            @AttachmentOp
    EXEC proc_CopyFileJunctions
        @SiteId,
        @OldUrlDirName,
        @OldUrlLeafName,
        @NewUrlDirName,
        @NewUrlLeafName,
        @NewLevel
    EXEC proc_CopyEventReceivers
        @SiteId,
        @SubWebId,
        @OldDocID,
        @NewDocID

GO
