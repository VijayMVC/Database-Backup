/****** Object:  StoredProcedure [dbo].[proc_CloneDoc]    Script Date: 5/15/2018 12:11:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CloneDoc(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @NewInstanceID int = NULL,
    @NewItemID     int = NULL OUTPUT,
    @Now datetime = NULL,
    @OldLevel int = NULL,
    @NewLevel int = NULL,
    @EnableMinorVersions bit = NULL,
    @IsModerated bit = NULL,
    @UserId int = NULL,
    @NewLeafName nvarchar(128) = NULL
    )
AS
    SET NOCOUNT ON
    DECLARE @WebId uniqueidentifier
    DECLARE @ListID  uniqueidentifier
    DECLARE @ParentId uniqueidentifier
    DECLARE @OldItemId int
    DECLARE @OldDocId uniqueidentifier
    DECLARE @NewDocId uniqueidentifier
    DECLARE @HasStream bit
    DECLARE @CreateNewLevel bit
    DECLARE @ReturnCode int
    DECLARE @ModerationStatus int
    DECLARE @IsFile bit
    DECLARE @OldUIVersion int
    DECLARE @NewUIVersion int
    DECLARE @cbDelta int
    DECLARE @FullUrl nvarchar(260)
    IF (@EnableMinorVersions = 1 AND @NewLevel = 2)
        SET @ModerationStatus = 3
    ELSE IF (@IsModerated = 0 AND @NewLevel = 2)
        SET @ModerationStatus = 2
    IF @EnableMinorVersions = 1  AND @NewLevel = 255
        SET @ModerationStatus = 3
    ELSE IF (@IsModerated = 1 AND @NewLevel = 255)
        SET @ModerationStatus = 2    
    SET @NewLeafName = COALESCE(@NewLeafName, @LeafName)
    SET @CreateNewLevel =
                        CASE
                        WHEN
                                @NewLevel IS NULL OR
                                @OldLevel IS NULL OR
                                @OldLevel = @NewLevel
                        THEN
                                0
                        ELSE
                                1
                        END
    IF @CreateNewLevel = 0
    BEGIN
        EXEC @ReturnCode = proc_GetUniqueFileName
             @SiteId,
             @DirName,
             @NewLeafName OUTPUT
        IF 0 <> @ReturnCode
        BEGIN           
            RETURN @ReturnCode
        END
        IF @NewLevel = 2 AND
            @UserId IS NULL
            return 160
    END
    SELECT TOP 1
        @WebId = WebId,
        @ListID = ListId,
        @OldItemId = DoclibRowId,
        @OldDocId = Id,
        @ParentId = ParentId,
        @HasStream = HasStream,
        @IsFile = CASE 
            WHEN Docs.Type = 0
            THEN 1
            ELSE 0
            END,
        @OldLevel = COALESCE(Level, 1),
        @OldUIVersion = UIVersion,
        @cbDelta = ISNULL(Size, 0) + ISNULL(MetaInfoSize, 0)
                + ISNULL(UnVersionedMetaInfoSize, 0) 
                + 152
    FROM 
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND
        (Docs.Level = @OldLevel OR
        @OldLevel IS NULL)
    ORDER BY
        Docs.Level DESC
    DECLARE @quotaOrLockStatus int
    SELECT  @quotaOrLockStatus =
        dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
    IF (@quotaOrLockStatus = 1)
    BEGIN
        RETURN 1816
    END
    ELSE IF (@quotaOrLockStatus > 1)
    BEGIN
        RETURN 212
    END
    IF @IsFile = 0 AND @ModerationStatus = 3
        SET @ModerationStatus = 2
    DECLARE @Error int
    SET @NewDocId = CASE WHEN @CreateNewLevel = 1 THEN @OldDocId ELSE NEWID() END
    SET @NewLevel = COALESCE(@NewLevel, @OldLevel, 1)
    SET @NewUIVersion = 
        CASE WHEN @CreateNewLevel = 1 THEN
            CASE 
                WHEN @EnableMinorVersions = 1
                THEN @OldUIVersion+1
                ELSE (@OldUIVersion/512+1)*512
            END
        ELSE
            CASE 
                WHEN @EnableMinorVersions = 1
                THEN 1
                ELSE 512
            END
        END
    IF @Now IS NULL
        SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    IF (@ListID IS NOT NULL) AND (@OldItemID IS NOT NULL)
    BEGIN
        SELECT
            @cbDelta = tp_Size + @cbDelta
        FROM 
            UserData
        WHERE
            tp_ListId = @ListID AND
            tp_ID = @OldItemID AND
            tp_Level = @OldLevel
        IF @NewLevel = 2
        BEGIN
            UPDATE
                UserData
            SET 
                tp_DraftOwnerId = @UserId            
            WHERE
                tp_ListId = @ListID AND
                tp_ID = @OldItemID AND
                tp_Level = @OldLevel
        END
        IF @NewLevel = 255
        BEGIN
            EXEC proc_UpdateItemInNameValuePair
                @SiteId, NULL, @ListID, @OldItemID, NULL,
                '{3881510a-4e4a-4ee8-b102-8ee8e2d0dd4b}', @UserId
            UPDATE
                UserData
            SET 
                tp_CheckoutUserId = @UserId            
            WHERE
                tp_ListId = @ListID AND
                tp_ID = @OldItemID
        END
        EXEC @Error = proc_CloneUserDataEntry
            @SiteId,
            @WebId,
            @ListID,
            @OldItemID,
            @NewInstanceID,
            @NewItemID OUTPUT,
            @Now,
            @OldLevel,
            @NewLevel,
            @OldUIVersion,
            @NewUIVersion,
            @NewLeafName,
            @ModerationStatus,
            @UserId
        IF @Error <> 0
            RETURN @Error
    END
    ELSE
    BEGIN
        SET @NewItemID = @OldItemID
    END
    IF (@CreateNewLevel = 1)
    BEGIN
        UPDATE
            Docs
        SET
            IsCurrentVersion = 0,               
            DraftOwnerId =
            CASE
                WHEN @NewLevel = 255
                THEN DraftOwnerId
                ELSE @UserId
            END
        WHERE 
            Docs.SiteId = @SiteId AND
            Docs.DirName = @DirName AND
            Docs.LeafName = @LeafName AND 
            Docs.Level = @OldLevel
    END
    INSERT INTO AllDocs(
        Id,
        Level,
        SiteId,
        ParentId,
        DirName,
        LeafName,
        WebId,
        ListId,
        DoclibRowId,
        Type,
        Size,
        MetaInfo,
        MetaInfoSize,
        Version,
        UIVersion,
        Dirty,
        TimeCreated,
        TimeLastModified,
        CacheParseId,
        NextToLastTimeModified,
        MetaInfoTimeLastModified,
        TimeLastWritten,
        DocFlags,
        ThicketFlag,
        CharSet,
        ProgId,
        VirusVendorID,
        VirusStatus,
        VirusInfo,
        CheckoutUserId,
        CheckoutDate,
        CheckoutExpires,
        CheckinComment,
        SetupPathVersion,
        SetupPath,
        SetupPathUser,
        UnVersionedMetaInfo,
        UnVersionedMetaInfoSize,
        UnVersionedMetaInfoVersion,
        ScopeId,
        AuditFlags,
        DraftOwnerId,
        ctoOffset)
    SELECT
        @NewDocId,
        @NewLevel,
        SiteId,
        ParentId,
        DirName,
        @NewLeafName,
        WebId,
        ListId,
        @NewItemID,
        Type,
        Size,
        MetaInfo,
        MetaInfoSize,
        CASE WHEN @CreateNewLevel = 1 THEN Version ELSE 1 END,
        @NewUIVersion,
        Dirty,
        CASE WHEN @CreateNewLevel = 1 THEN TimeCreated ELSE @Now END,
        CASE WHEN @CreateNewLevel = 1 THEN TimeLastModified ELSE @Now END,
        CacheParseId,
        CASE WHEN @CreateNewLevel = 1 THEN NextToLastTimeModified ELSE NULL END,
        CASE WHEN @CreateNewLevel = 1 THEN MetaInfoTimeLastModified ELSE @Now END,
        CASE WHEN @CreateNewLevel = 1 THEN TimeLastWritten ELSE @Now END,
        DocFlags,
        ThicketFlag,
        CharSet,
        ProgId,
        VirusVendorID,
        VirusStatus,
        VirusInfo,
        CheckoutUserId,
        CheckoutDate,
        CheckoutExpires,
        CheckinComment,
        SetupPathVersion,
        SetupPath,
        SetupPathUser,
        UnVersionedMetaInfo,
        UnVersionedMetaInfoSize,
        UnVersionedMetaInfoVersion,
        ScopeId,
        AuditFlags,
        DraftOwnerId,
        ctoOffset
    FROM
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND
        Docs.Level = @OldLevel
   IF @@ROWCOUNT <> 1
        RETURN 87
    IF @HasStream = 1
    BEGIN
        INSERT INTO AllDocStreams(
            Id,
            SiteId,
            ParentId,
            Level,
            Content,
            Size)
        SELECT
            @NewDocId,
            SiteId,
            ParentId,
            @NewLevel,
            Content,
            Size
        FROM
            DocStreams
        WHERE
            DocStreams.SiteId = @SiteId AND
            DocStreams.ParentId = @ParentId AND
            DocStreams.Id = @OldDocId AND
            DocStreams.Level = @OldLevel
    END
    INSERT INTO Links (
        SiteId,
        DirName,
        LeafName,
        Level,
        WebPartId,
        FieldId,
        LinkNumber,
        TargetDirName,
        TargetLeafName,
        Type,
        Security,
        Dynamic,
        ServerRel,
        PointsToDir)
    SELECT
        SiteId,
        DirName,
        @NewLeafName,
        @NewLevel,
        WebPartId,
        FieldId,
        LinkNumber,
        TargetDirName,
        TargetLeafName,
        Type,
        Security,
        Dynamic,
        ServerRel,
        PointsToDir
    FROM
        Links
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @LeafName AND
        Level = @OldLevel
    SET @FullUrl = CASE WHEN (DATALENGTH(@DirName) = 0) THEN @LeafName WHEN (DATALENGTH(@LeafName) = 0) THEN @DirName ELSE @DirName + N'/' + @LeafName END
    INSERT INTO Deps(
        SiteId,
        DeleteTransactionId,
        FullUrl,
        DepType,       
        DepDesc,
        Level)
    SELECT
        SiteId,
        0x,
        FullUrl,
        DepType,
        DepDesc,
        @NewLevel       
    FROM
        Deps
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = 0x AND
        FullUrl = @FullUrl AND
        Level = @OldLevel             
    EXEC proc_CloneForWebPart @SiteId, @OldDocId, @NewDocId, @OldLevel, @NewLevel
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbDelta, 0
    RETURN 0

GO
