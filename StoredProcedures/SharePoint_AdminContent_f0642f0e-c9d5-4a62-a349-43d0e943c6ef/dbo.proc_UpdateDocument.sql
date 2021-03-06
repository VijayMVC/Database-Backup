/****** Object:  StoredProcedure [dbo].[proc_UpdateDocument]    Script Date: 5/15/2018 12:13:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateDocument(
    @DocSiteId  uniqueidentifier,
    @DocWebId   uniqueidentifier,
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @DocContent image,
    @DocMetaInfo image,
    @DocSize int,
    @DocMetainfoSize int,
    @DocDirty bit,
    @DocVersion int,
    @DocFlags int,
    @DocIncomingCreatedDTM datetime,
    @DocIncomingDTM datetime,
    @ThicketMainFile bit,
    @GetWebListForNormalization bit,
    @VersioningEnabled bit,
    @EnableMinorVersions bit,
    @UserId int,
    @AttachmentOp int,
    @PutFlags int,
    @UpdateFlags int,
    @CharSet int,
    @ProgId nvarchar(255),
    @AuditMask bit,
    @WebParts bit,
    @Comment nvarchar(1023),
    @IsForceCheckout bit,
    @IsModerate bit,
    @NeedsDraftOwnerRestriction bit,
    @WelcomePageUrl nvarchar(260),
    @WelcomePageParameters ntext,
    @VirusVendorID int,
    @VirusStatus int,
    @VirusInfo nvarchar(255),       
    @LockTimeout int,
    @RefreshLock bit,
    @@DocId uniqueidentifier OUTPUT,
    @@Level tinyint OUTPUT, 
    @@DoclibRowId int OUTPUT,
    @@DocDTM datetime OUTPUT,
    @@DocUIVersion int OUTPUT,
    @@DocFlagsOut int OUTPUT,
    @ChunkSize int,
    @@DocTextptr varbinary(16) OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @PutOpt_Checkin bit
    DECLARE @PutOpt_KeepCheckedOut bit
    DECLARE @PutOpt_VersionShortTerm bit
    DECLARE @PutOpt_Publish bit
    DECLARE @PutOpt_UpDateNoVersion bit
    DECLARE @PutOpt_PreserveItemVersion bit
    DECLARE @PutOpt_MigratePublish bit   
    DECLARE @PutOpt_Migrate bit 
    DECLARE @CheckoutUserId int
    DECLARE @ShortTermCheckout bit
    DECLARE @LongTermCheckout bit
    DECLARE @VersionCreatedSinceSTCheckout bit
    DECLARE @cbDelta int
    DECLARE @cbOld int
    DECLARE @cbOldMetaInfo int
    DECLARE @CanCreateVersion bit
    DECLARE @CreateVersion bit
    DECLARE @PurgeOldData bit
    DECLARE @SystemUpdate bit
    DECLARE @Now datetime
    DECLARE @cbCheckinMetaInfo int
    DECLARE @cbCheckin int
    DECLARE @CheckinVersionLevel tinyint
    DECLARE @CheckinVersion int
    DECLARE @ItemId int
    DECLARE @ListId uniqueidentifier
    DECLARE @DraftOwner int
    DECLARE @IsCurrentVersion bit
    DECLARE @HasStream bit
    DECLARE @Unghosting bit
    DECLARE @DocParentId uniqueidentifier
    DECLARE @bChunked bit
    DECLARE @IsFile bit
    DECLARE @RowsUpdated int
    DECLARE @iRet int
    DECLARE @NewUIVersion int
    DECLARE @OldDocFlags int
    DECLARE @OldListFlags bigint
    DECLARE @KeepCheckedOutToLocal bit
    SET @PutOpt_UpdateNoVersion =
        CASE WHEN (@PutFlags & 131072 = 131072) 
        THEN 1
        ELSE 0
        END
    SET @PutOpt_PreserveItemVersion =
        CASE WHEN (@PutFlags & 8388608 = 8388608) 
        THEN 1
        ELSE 0
        END
    SET @PutOpt_Checkin =
        CASE WHEN (@PutFlags & 32 = 32)
        THEN 1
        ELSE 0
        END
    SET @PutOpt_Publish =
        CASE WHEN (@PutFlags & 65536 = 65536)
        THEN 1
        ELSE 0
        END
    SET @PutOpt_MigratePublish =
        CASE WHEN (@PutFlags & 8192 = 8192) AND
                             @PutOpt_Publish = 1
        THEN 1
        ELSE 0
        END
    SET @PutOpt_Migrate =
        CASE WHEN (@PutFlags & 8192 = 8192)
        THEN 1
        ELSE 0
        END
    SET @PutOpt_KeepCheckedOut =
        CASE WHEN (@PutFlags & 8 =
            8)
        THEN 1
        ELSE 0
        END
    SET @PutOpt_VersionShortTerm =
        CASE WHEN (@PutFlags & 4096 =
            4096)
        THEN 1
        ELSE 0
        END
    SET @PurgeOldData =
        CASE WHEN (@UpdateFlags & 1 =
            1)
        THEN 1
        ELSE 0
        END
    SET @SystemUpdate =
        CASE WHEN (@PutFlags & 1048576 = 1048576)
        THEN 1
        ELSE 0
        END
    SET @KeepCheckedOutToLocal =
        CASE WHEN (@PutFlags & 33554432 = 33554432)
        THEN 1
        ELSE 0
        END
    SET @bChunked =
        CASE
            WHEN @DocContent IS NOT NULL AND @DocSize > @ChunkSize THEN 1
            ELSE 0
        END
    SELECT @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    IF @DocIncomingDTM IS NULL
    BEGIN
        SET @@DocDTM = @Now
    END
    ELSE
    BEGIN
        SET @@DocDTM = @DocIncomingDTM
    END
    DECLARE @guidT uniqueidentifier
    SELECT
        @guidT = Docs.ListId
    FROM
        Docs WITH(NOLOCK)
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName
    SELECT
        @guidT = Lists.tp_Id,
        @OldListFlags = Lists.tp_Flags
    FROM
        Lists WITH(XLOCK)
    WHERE
        Lists.tp_WebId = @DocWebId AND
        Lists.tp_Id = @guidT        
    DECLARE @DocumentId uniqueidentifier
    DECLARE @CtoOffset int
    SELECT
        @DocumentId = Id,
        @guidT = Docs.ListId,
        @ListId = Docs.ListId,
        @ItemId = Docs.DoclibRowId,
        @CtoOffset = Docs.CtoOffset
    FROM
        Docs WITH(XLOCK)
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName
    SELECT
        @CheckoutUserId = CASE
            WHEN Docs.CheckoutDate IS NOT NULL
            THEN Docs.CheckoutUserId
            ELSE NULL
            END,
        @LongTermCheckout = CASE
            WHEN LTCheckoutUserId IS NULL
            THEN 0
            ELSE 1
            END,
        @ShortTermCheckout = CASE
            WHEN Docs.CheckoutExpires IS NOT NULL AND
                @Now < Docs.CheckoutExpires
            THEN 1
            ELSE 0
            END,
        @VersionCreatedSinceSTCheckout = VersionCreatedSinceSTCheckout,
        @OldDocFlags = ISNULL(DocFlags,0),
        @DocFlags = @DocFlags | ISNULL((DocFlags & (64|1024)),0),
        @cbOld = ISNULL(Docs.Size, 0),
        @cbOldMetaInfo = ISNULL(Docs.MetaInfoSize, 0),
        @CanCreateVersion = CASE
            WHEN Docs.Version IS NOT NULL
            THEN 1
            ELSE 0
            END,
        @IsFile = CASE 
            WHEN Docs.Type = 0
            THEN 1
            ELSE 0
            END,
        @IsCurrentVersion = IsCurrentVersion,
        @DocParentId = ParentId,
        @HasStream = HasStream,
        @ItemId = DoclibRowId,
        @DraftOwner = DraftOwnerId
    FROM
        Docs    
    WHERE
        SiteId = @DocSiteId AND
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        WebId = @DocWebId AND
        Level = @@Level
    IF ((@OldDocFlags & 512) = 512 AND (@KeepCheckedOutToLocal = 1 OR @SystemUpdate = 1))
    BEGIN
        SET @DocFlags = @DocFlags | 512
    END
    IF @cbOld IS NULL
        RETURN 3
    IF @DraftOwner IS NOT NULL AND @NeedsDraftOwnerRestriction = 1 AND
        @DraftOwner <> @UserId
       RETURN 5 
    IF @ItemId  IS NULL
    BEGIN
        SET @IsForceCheckout = 0
        SET @EnableMinorVersions = 0
        SET @IsModerate = 0
        SET @VersioningEnabled = 0
    END
    SET @Unghosting = CASE
                      WHEN
                           @HasStream = 0 AND @DocContent IS NOT NULL
                      THEN 1
                      ELSE 0
                      END
    IF (@IsCurrentVersion = 0 AND @SystemUpdate = 0)
    BEGIN
        IF @LongTermCheckout = 1
            RETURN 212
        ELSE
            RETURN 288
    END
    IF @LongTermCheckout = 1
    BEGIN    
        SELECT TOP 1
            @cbCheckin = ISNULL(Docs.Size, 0),
            @cbCheckinMetaInfo = ISNULL(Docs.MetaInfoSize, 0),
            @CheckinVersionLevel = Level,
            @CheckinVersion = UIVersion,
            @DraftOwner = DraftOwnerId
        FROM
            Docs
        WHERE
            SiteId = @DocSiteId AND
            DirName = @DocDirName AND
            LeafName = @DocLeafName AND
            WebId = @DocWebId AND
            Level <> 255
        ORDER BY
            Level DESC
        IF @@RowCount = 0
        BEGIN
            SET @cbCheckin = 0
            SET @cbCheckinMetaInfo = 0
            SET @CheckinVersion = 0
            SET @DraftOwner = NULL
            SET @CheckinVersionLevel = 1            
        END        
    END
    ELSE
    BEGIN
        SET @CheckinVersionLevel = @@Level
    END
    IF @ItemId IS NULL
    BEGIN
        SET @EnableMinorVersions = 0
    END
    IF (@CheckinVersionLevel = 1 AND 
        @PutOpt_Checkin = 1 OR
        @@Level =  1 ) AND
       (@EnableMinorVersions =1 OR @IsModerate = 1) AND
       @PutOpt_UpdateNoVersion = 1 AND @SystemUpdate = 0 AND
       @PutOpt_Migrate = 0
    BEGIN
       RETURN 212
    END
    IF (@ShortTermCheckout = 0 AND
        @LongTermCheckout = 0)
    BEGIN
        SET @CheckoutUserId = NULL
    END
    IF @CheckoutUserId IS NULL
    BEGIN
        SET @ShortTermCheckout = 0
        SET @LongTermCheckout = 0
        SET @PutOpt_Checkin = 1
        SET @PutOpt_KeepCheckedOut = 0
    END
    SET @CreateVersion = CASE
        WHEN @CanCreateVersion = 0
        THEN 0
        WHEN @PutOpt_UpdateNoVersion = 1
        THEN 0
        WHEN @VersioningEnabled = 0
        THEN 0
        WHEN (@IsModerate = 1 OR (@EnableMinorVersions = 1 AND @IsFile = 1)) AND
        @@Level = 1 AND @PutOpt_MigratePublish = 0
        THEN 0
        WHEN @LongTermCheckout = 1 AND @PutOpt_Checkin = 1
        AND (@CheckinVersionLevel = 2 OR 
        @IsModerate = 0 AND @EnableMinorVersions = 0)
        THEN 1
        WHEN (@cbOld = 0 AND @IsFile = 1) OR
            (@cbOldMetaInfo = 0 AND @IsFile = 0)
        THEN 0
        WHEN @LongTermCheckout = 1
        THEN 0
        WHEN @VersionCreatedSinceSTCheckout = 0
        THEN 1
        WHEN @PutOpt_VersionShortTerm = 1
        THEN 1
        WHEN @ShortTermCheckout = 1
        THEN 0
        ELSE 1
        END
    SET @cbDelta = @DocMetainfoSize - @cbOldMetaInfo
    IF @DocContent IS NOT NULL
        SET @cbDelta = @cbDelta + @DocSize - @cbOld
    IF @CreateVersion = 1
    BEGIN
        IF @PutOpt_Checkin = 1 AND @LongTermCheckout = 1 
            SET @cbDelta = @cbDelta + @cbCheckin + @cbCheckinMetaInfo 
        ELSE
            SET @cbDelta = @cbDelta + @cbOld + @cbOldMetaInfo
    END
    IF @PutOpt_Checkin = 1 AND @LongTermCheckout = 1 
    BEGIN      
        SET @cbDelta = @cbDelta - @cbCheckin - @cbCheckinMetaInfo 
            - 152
    END
    IF @cbDelta > 0
    BEGIN
        DECLARE @quotaOrLockStatus int
        SELECT  @quotaOrLockStatus =
            dbo.fn_IsOverQuotaOrWriteLocked(@DocSiteId)
        IF (@quotaOrLockStatus = 1)
        BEGIN
            RETURN 1816
        END
        ELSE IF (@quotaOrLockStatus > 1)
        BEGIN
            RETURN 212
        END
    END
    IF @PutOpt_Checkin = 1 AND @LongTermCheckout = 1 
    BEGIN      
        SET @cbDelta = @cbDelta + @cbCheckin + @cbCheckinMetaInfo 
            + 152
    END
    IF @GetWebListForNormalization = 1
    BEGIN
        SELECT
            Webs.FullUrl
        FROM
            Webs
        WHERE
            Webs.SiteId = @DocSiteId AND
            Webs.ParentWebId = @DocWebId 
    END
    IF @CreateVersion = 1
        EXEC proc_CreateDocVersion @DocSiteId, 
            @DocDirName, 
            @DocLeafName, 
            @ListId,
            @ItemId,
            @CheckinVersionLevel 
    IF  (@IsModerate = 1 OR (@EnableMinorVersions = 1 AND @IsFile = 1) ) AND
        @@Level = 1 AND @SystemUpdate = 0 AND
         (@PutOpt_MigratePublish = 0)
    BEGIN
        EXEC @iRet =  proc_CloneDoc  @DocSiteId,
                   @DocDirName,
                   @DocLeafName,
                   NULL,
                   NULL,
                   NULL,
                   @@Level,
                   2,
                   @EnableMinorVersions,
                   @IsModerate,
                   @UserId,
                   NULL
        IF @iRet <> 0
                RETURN @iRet           
        SET @@Level = 2
    END
    SELECT
        @@DocUIVersion = Docs.UIVersion
    FROM
        Docs
    WHERE
        SiteId = @DocSiteId AND 
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        Level = @@Level
    SET @@DocUIVersion =
        CASE
            WHEN @CreateVersion = 1 AND 
            (@PutOpt_Checkin = 0 OR @LongTermCheckout = 0)
            THEN
                CASE 
                    WHEN @EnableMinorVersions = 0 OR 
                    (@PutOpt_MigratePublish = 1 AND @@Level = 1)
                    THEN (@@DocUIVersion/512+1)*512
                    ELSE @@DocUIVersion+1
                END
            WHEN @PutOpt_Checkin = 1 AND
                @LongTermCheckout = 1 AND
                @CheckinVersion <> 0 AND
                (@PutOpt_UpdateNoVersion = 1 OR 
                @VersioningEnabled = 0 AND 
                (@IsModerate = 0  OR 
                @CheckinVersionLevel = 2))                        
            THEN @CheckinVersion  
            WHEN @EnableMinorVersions = 0 AND @@DocUIVersion%512 <> 0
            THEN (@@DocUIVersion/512+1)*512
            WHEN @EnableMinorVersions = 1 AND @@DocUIVersion%512 = 0 AND
                @@Level <> 1
            THEN @@DocUIVersion+1
            ELSE @@DocUIVersion
        END
    DECLARE @NewCtoOffset int
    IF (@DocFlags & 8192 <> 0 AND
        @OldDocFlags & 8192 = 0)
    BEGIN
        SET @NewCtoOffset = DATALENGTH(CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END)/2
        EXEC proc_ReplaceCtoOffset @DocSiteId, @DocDirName, @DocLeafName, @CtoOffset, @NewCtoOffset
    END
    ELSE IF (@DocFlags & 8192 = 0 AND
        @OldDocFlags & 8192 <> 0)
    BEGIN
        DECLARE @DirDirName nvarchar(256)
        DECLARE @DirLeafName nvarchar(128)
        EXEC proc_SplitUrl @DocDirName, @DirDirName OUTPUT, @DirLeafName OUTPUT
        SELECT
            @NewCtoOffset = CtoOffset
        FROM
            Docs
        WHERE
            SiteId = @DocSiteId AND
            DirName = @DirDirName AND
            LeafName = @DirLeafName AND
            ListId = @ListId
        IF @@ROWCOUNT = 0
            SET @NewCtoOffset = NULL
        EXEC proc_ReplaceCtoOffset @DocSiteId, @DocDirName, @DocLeafName, @CtoOffset, @NewCtoOffset
    END
    UPDATE
        Docs
    SET
        Size = 
            CASE 
                WHEN @DocContent IS NOT NULL
                THEN @DocSize
                ELSE Size
            END,
        Dirty = @DocDirty,
        NextToLastTimeModified = CASE
                WHEN (@@DocDTM = TimeLastModified OR @SystemUpdate = 1) THEN
                NextToLastTimeModified ELSE TimeLastModified END,
        TimeLastModified = CASE
                WHEN (@SystemUpdate = 1) THEN
                TimeLastModified ELSE @@DocDTM END,
        MetaInfoTimeLastModified = CASE
                WHEN Type = 0 THEN @Now ELSE
                Docs.MetaInfoTimeLastModified END,
        TimeLastWritten = CASE WHEN @DocContent IS NULL THEN
                            TimeLastWritten ELSE @Now END,           
        TimeCreated = ISNULL(@DocIncomingCreatedDTM, TimeCreated),
        CacheParseId = NULL,
        ThicketFlag = CASE WHEN @ThicketMainFile IS NULL OR
                        ThicketFlag IS NULL THEN NULL
                        WHEN @ThicketMainFile = 1 OR ThicketFlag = 1
                        THEN 1 ELSE 0 END,
        DocFlags =
            CASE
                WHEN @LongTermCheckout = 0 OR
                    (@PutOpt_Checkin = 1 AND @PutOpt_KeepCheckedOut = 0)
                THEN @DocFlags & ~32 & ~512
                ELSE @DocFlags | 32
            END,
        CharSet = @CharSet,
        ProgId = @ProgId,
        CheckoutUserId = 
            CASE
                WHEN @PutOpt_Checkin = 1 AND @PutOpt_KeepCheckedOut = 0 AND
                    @ShortTermCheckout = 0
                THEN NULL
                ELSE CheckoutUserId
            END,
        CheckoutDate =
            CASE
                WHEN @PutOpt_Checkin = 1 AND @PutOpt_KeepCheckedOut = 0 AND
                    @ShortTermCheckout = 0
                THEN NULL
                ELSE CheckoutDate
            END,
        CheckoutExpires =
            CASE
                WHEN @ShortTermCheckout = 0
                THEN NULL
                ELSE CheckoutExpires
            END,
        WelcomePageUrl = @WelcomePageUrl,
        WelcomePageParameters = @WelcomePageParameters,
        VersionCreatedSinceSTCheckout = CASE
            WHEN @CreateVersion = 1
            THEN 1
            ELSE VersionCreatedSinceSTCheckout
            END,
        VirusVendorID = @VirusVendorID,
        VirusStatus = @VirusStatus,
        VirusInfo = @VirusInfo,            
        MetaInfo = @DocMetaInfo,
        MetaInfoSize = @DocMetainfoSize,                        
        Version = CASE WHEN (Version IS NULL OR @PutOpt_PreserveItemVersion = 1) Then Docs.Version ELSE
                @DocVersion + 1 END,
        UIVersion = @@DocUIVersion,     
        DraftOwnerId = 
            CASE WHEN @PutOpt_Checkin = 1 AND
                    @LongTermCheckout = 1 AND
                    @CheckinVersionLevel = 1 AND 
                    @PutOpt_Publish = 0 AND 
                    (@IsModerate = 1 OR @EnableMinorVersions = 1)
                THEN @UserId
                ELSE DraftOwnerId
            END,
        CheckinComment = @Comment
    WHERE
        SiteId = @DocSiteId AND
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        WebId    = @DocWebId AND
        (Version IS NULL OR Version = @DocVersion) AND
        Level = @@Level
    SET @RowsUpdated = @@ROWCOUNT
    IF @DocContent IS NOT NULL
    BEGIN
        IF @RowsUpdated = 1
        BEGIN
            IF @DocFlags & 256 = 0
            BEGIN
                RETURN 80
            END
            ELSE
            BEGIN
                IF @Unghosting = 1
                BEGIN
                    INSERT INTO AllDocStreams(
                        Id,
                        Level,
                        SiteId,
                        ParentId,
                        Content,
                        Size)
                    SELECT
                        Id,
                        @@Level,
                        SiteId,
                        ParentId,
                        @DocContent,
                        @DocSize
                    FROM
                        Docs
                    WHERE
                        SiteId = @DocSiteId AND
                        DirName = @DocDirName AND
                        LeafName = @DocLeafName AND
                        Level = @@Level
                    SET @RowsUpdated = @@ROWCOUNT
                END
                ELSE
                BEGIN    
                    UPDATE
                        DocStreams
                    SET           
                        Content = @DocContent,
                        Size = @DocSize
                    WHERE
                        SiteId = @DocSiteId AND
                        ParentId = @DocParentId AND
                        Id = @DocumentId AND
                        Level = @@Level
                    SET @RowsUpdated = @@ROWCOUNT
                END
            END
        END
    END
    IF @RowsUpdated = 1
    BEGIN
        UPDATE
            UserData
        SET
            tp_CheckoutUserId = 
            CASE
                WHEN @PutOpt_Checkin = 1 AND @PutOpt_KeepCheckedOut = 0
                THEN NULL
                ELSE tp_CheckoutUserId
            END,
            tp_UIVersion = CASE
                WHEN tp_Level = @@Level 
                THEN @@DocUIVersion 
                ELSE tp_UIVersion
            END   
        WHERE
            tp_SiteId = @DocSiteId AND 
            tp_DirName = @DocDirName AND
            tp_LeafName = @DocLeafName
        EXEC proc_UpdateItemInNameValuePairByUrl
            @DocSiteId, @DocDirName, @DocLeafName, NULL,
            '{3881510a-4e4a-4ee8-b102-8ee8e2d0dd4b}', NULL,
            '{7841bf41-43d0-4434-9f50-a673baef7631}', NULL,
            NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            1
        IF @PutOpt_UpdateNoVersion = 1
        BEGIN
            EXEC proc_DTClearRelationshipFromChild @DocSiteId, @DocDirName, @DocLeafName
        END
        IF @VersioningEnabled = 0 AND @OldDocFlags & 1024 = 1024
        BEGIN
            EXEC proc_DTClearRelationshipFromParent @DocSiteId, @DocDirName, @DocLeafName
        END
        DECLARE @FullUrl nvarchar(260)
        Set @FullUrl = CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END
        IF @@Level = 255 AND @KeepCheckedOutToLocal = 0 AND @SystemUpdate = 0
        BEGIN
            UPDATE     
                Docs
            SET
                DocFlags = DocFlags &  ~512               
            WHERE
                Docs.SiteId = @DocSiteId AND
                Docs.DirName = @DocDirName AND
                Docs.LeafName = @DocLeafName                                
        END
        IF ((@PutOpt_Checkin = 1) OR (@PutOpt_KeepCheckedOut = 1)) AND
            (@LongTermCheckout = 1)
        BEGIN
            DECLARE @bNeedCreateVersion bit
            SET @bNeedCreateVersion = 0
            IF (@PutOpt_Publish = 1 AND @IsModerate = 0) OR
                @PutOpt_MigratePublish = 1
            BEGIN
                IF @CheckinVersionLevel <> 1 OR
                   @EnableMinorVersions = 1                  
                BEGIN                
                    SET @CheckinVersionLevel = 1
                    IF @VersioningEnabled = 1
                        SET @bNeedCreateVersion = 1
                END
            END
            ELSE IF (@IsModerate = 1 OR @EnableMinorVersions = 1)
            BEGIN
                UPDATE     
                    Docs
                SET
                    DraftOwnerId =  
                    CASE
                        WHEN @CheckinVersionLevel = 1
                        THEN @UserId
                        ELSE DraftOwnerId
                    END,
                    DocFlags =
                    CASE
                        WHEN @PutOpt_KeepCheckedOut = 0
                        THEN DocFlags & ~32 & ~512
                        ELSE DocFlags | 32
                    END,
                    CheckoutUserId = 
                    CASE
                        WHEN @PutOpt_KeepCheckedOut = 0 AND
                            @ShortTermCheckout = 0
                        THEN NULL
                        ELSE CheckoutUserId
                    END,
                    CheckoutDate =
                        CASE
                            WHEN @PutOpt_KeepCheckedOut = 0 AND
                                @ShortTermCheckout = 0
                            THEN NULL
                            ELSE CheckoutDate
                        END,
                    CheckoutExpires =
                        CASE
                            WHEN @ShortTermCheckout = 0
                            THEN NULL
                            ELSE CheckoutExpires
                        END
                WHERE
                    Docs.SiteId = @DocSiteId AND
                    Docs.DirName = @DocDirName AND
                    Docs.LeafName = @DocLeafName
                IF @PutOpt_KeepCheckedOut = 0
                BEGIN
                    EXEC proc_UpdateItemInNameValuePairByUrl
                        @DocSiteId, @DocDirName, @DocLeafName, NULL,
                        '{3881510a-4e4a-4ee8-b102-8ee8e2d0dd4b}', NULL
                END
                UPDATE
                    UserData
                SET
                    tp_DraftOwnerId =  
                    CASE
                        WHEN @CheckinVersionLevel = 1
                        THEN @UserId
                        ELSE tp_DraftOwnerId
                    END
                WHERE
                    tp_SiteId = @DocSiteId AND 
                    tp_DirName = @DocDirName AND
                    tp_LeafName = @DocLeafName
                SET @CheckinVersionLevel = 2
            END
            EXEC @iRet = proc_ApproveCheckinDoc @DocSiteId,
                 @DocDirName,
                 @DocLeafName,
                 @@Level OUTPUT,
                 @CheckinVersionLevel,
                 @EnableMinorVersions,
                 @bNeedCreateVersion
            IF @iRet <> 0
                RETURN @iRet
        END
        IF (@@Level = 2) AND ((@IsModerate = 0) AND
        (@EnableMinorVersions = 0 OR  @IsFile = 0)       OR
        @PutOpt_MigratePublish = 1)
        BEGIN
            EXEC @iRet = proc_ApproveCheckinDoc @DocSiteId,
                 @DocDirName,
                 @DocLeafName,
                 @@Level OUTPUT,
                 1,
                 @EnableMinorVersions,
                 @VersioningEnabled
            IF @iRet <> 0
                RETURN @iRet
        END
        SELECT
            @@DocTextptr =
                CASE
                    WHEN @bChunked = 1 THEN TEXTPTR(AllDocStreams.Content)
                    ELSE NULL
                END,
            @@DocFlagsOut = Docs.DocFlags,
            @@DocUIVersion = Docs.UIVersion,
            @@DocId = Docs.Id,
            @@DoclibRowId = Docs.DoclibRowId,
            @NewUIVersion = Docs.UIVersion
        FROM
            Docs LEFT OUTER JOIN AllDocStreams
        ON
            Docs.SiteId = AllDocStreams.SiteId AND
            Docs.DeleteTransactionId = AllDocStreams.DeleteTransactionId AND
            Docs.ParentId = AllDocStreams.ParentId AND
            Docs.Id = AllDocStreams.Id AND
            Docs.Level = AllDocStreams.Level
        WHERE
            Docs.SiteId = @DocSiteId AND 
            Docs.DirName = @DocDirName AND
            Docs.LeafName = @DocLeafName AND
            Docs.Level = @@Level
        IF @EnableMinorVersions = 1 AND 
           @@Level <> 1 AND
           @NewUIVersion%512 = 0
            RETURN 154     
        IF @@DoclibRowId IS NULL
        BEGIN
            DECLARE @TimeLastModifiedLog datetime
            IF (@PutOpt_Migrate = 1)
            BEGIN
                SET @TimeLastModifiedLog = NULL
            END
            ELSE
            BEGIN
                SET @TimeLastModifiedLog = @@DocDTM
            END
            IF (@IsFile = 1)
            BEGIN
                EXEC proc_LogChange @DocSiteId, @DocWebId, NULL, NULL, @@DocId,
                    NULL, NULL, @FullUrl, 8192,
                    16, @TimeLastModifiedLog
                IF (@PutOpt_Migrate = 1)
                BEGIN
                    EXEC proc_LogChange @DocSiteId, @DocWebId, NULL, NULL, @@DocId,
                        NULL, NULL, @FullUrl, 1048576,
                        16, @TimeLastModifiedLog
                END
            END
            ELSE
            BEGIN
                EXEC proc_LogChange @DocSiteId, @DocWebId, NULL, NULL, @@DocId,
                    NULL, NULL, @FullUrl, 8192,
                    32, @TimeLastModifiedLog
                IF (@PutOpt_Migrate = 1)
                BEGIN
                    EXEC proc_LogChange @DocSiteId, @DocWebId, NULL, NULL, @@DocId,
                        NULL, NULL, @FullUrl, 1048576,
                        32, @TimeLastModifiedLog
                END    
            END
        END
        IF @AuditMask = 1
        BEGIN
	        EXEC proc_GetAuditMask 1, @DocSiteId, @DocDirName, 
	                             @DocLeafName
        END
        IF @PurgeOldData = 1
        BEGIN
            DELETE FROM
                Categories
            WHERE
                DocId = @@DocId
            IF @WebParts = 1
            BEGIN
                DELETE FROM
                    Links
                WHERE
                    SiteId = @DocSiteID AND
                    DirName = @DocDirName AND
                    LeafName = @DocLeafName AND
                    Level = @@Level AND
                    FieldId IS NULL
            END
            ELSE
            BEGIN
                DELETE FROM
                    Links
                WHERE
                    SiteId = @DocSiteID AND
                    DirName = @DocDirName AND
                    LeafName = @DocLeafName AND
                    Level = @@Level AND
                    WebPartId IS NULL AND
                    FieldId IS NULL
            END
            DELETE FROM
                Deps
            WHERE
                SiteId = @DocSiteId AND
                DeleteTransactionId = 0x AND
                FullUrl = @FullUrl AND
                Level = @@Level
        END
        IF (@AttachmentOp <> 0)
            EXEC proc_UpdateAttachmentsFlag @DocSiteId, @DocDirName,
                @UserId, @AttachmentOp
        IF @LockTimeout = 0
        BEGIN
            EXEC @iRet = proc_UncheckoutDocumentInternal
                @DocSiteId,
                @DocWebId,
                @DocDirName,
                @DocLeafName,
                @UserId,
                1,
                0,
                @CheckinVersionLevel,
                @@Level OUTPUT
            IF @iRet <> 0
                RETURN @iRet
            EXEC proc_GetLockInfo @DocSiteId,
                @DocDirName, @DocLeafName, @@Level
        END
        ELSE IF @LockTimeout IS NOT NULL
        BEGIN
            IF @RefreshLock <> @ShortTermCheckout
                RETURN 33
            EXEC @iRet = proc_CheckoutDocumentInternal
                @DocSiteId,
                @DocWebId,
                @DocDirName,
                @DocLeafName,
                @@Level,
                0,
                0,
                @UserId,
                @LockTimeout,
                @RefreshLock,
                0,
                0,
                @Now
            IF @iRet <> 0
                RETURN @iRet
            EXEC proc_GetLockInfo @DocSiteId,
                @DocDirName, @DocLeafName, @@Level
        END
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
            @DocSiteId, @cbDelta, 1
        RETURN 0
    END
    ELSE
    BEGIN
        DECLARE @DocVersionMatches bit
        SELECT
            @DocVersionMatches = CASE WHEN
                (Version IS NULL OR Version = @DocVersion)
            THEN 1
            ELSE 0
            END
        FROM
            Docs
        WHERE
            SiteId   = @DocSiteId AND 
            DirName  = @DocDirName AND
            LeafName = @DocLeafName AND
            WebId    = @DocWebId
        IF @DocVersionMatches IS NULL
            RETURN 3
        IF @DocVersionMatches = 0
            RETURN 1150
        RETURN 33
    END

GO
