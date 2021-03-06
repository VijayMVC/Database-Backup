/****** Object:  StoredProcedure [dbo].[proc_UpdateListItem]    Script Date: 5/15/2018 12:12:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateListItem(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @ListId uniqueidentifier,
    @ItemId int,
    @RowOrdinal int,
    @Size int,
    @ExtraItemSize int = NULL,
    @ItemName nvarchar(255) = NULL,
    @UseNvarchar1ItemName bit = 1,
    @ItemDirName nvarchar(256) = NULL OUTPUT,
    @ItemLeafName nvarchar(256) = NULL OUTPUT,
    @UserId int,
    @Level tinyint = 1 OUTPUT,
    @TimeNow datetime,
    @NeedsAuthorRestriction bit = 0,
    @NeedsDraftOwnerRestriction bit = 0,
    @PreserveVersion bit = 0,
    @IsMeetingsList bit = NULL,
    @IsIssueList bit = NULL,
    @IsNotUserDisplayed bit = NULL,
    @SystemUpdate bit = 0,
    @ChangeLevel bit = 0,
    @CheckinItem bit = 0,
    @NeedClone bit = 0,
    @MajorVersionsLimit int = 0,
    @MajorMinorVersionsLimit int = 0,
    @IsDocLib bit = 0,
    @CheckSchemaVersion int = NULL,
    @tp_Ordering varchar(512) = NULL,
    @tp_ThreadIndex varbinary(512) = NULL,
    @tp_HasAttachment bit = NULL,
    @tp_ModerationStatus int = NULL,
    @tp_IsCurrent bit = NULL,
    @tp_ItemOrder float = NULL,
    @tp_Version int = NULL,
    @tp_InstanceID int = NULL,
    @tp_ContentType nvarchar(255) = NULL,
    @tp_ContentTypeId tContentTypeId = NULL,
    @tp_CopySource nvarchar(260) = NULL,
    @tp_HasCopyDestinations bit = NULL,
    @OnRestore bit = 0,
    @BumpLastDelete bit = NULL,
    @CreateItemVersion bit = 0,
    @UIVersion int = NULL,
    @NewUIVersion int = NULL OUTPUT,
    @ReturnRowset bit = 1,
    @tp_Author int = NULL,
    @tp_Editor int = NULL,
    @tp_Created datetime = NULL,
    @tp_Modified datetime = NULL,
    @tp_WorkflowVersion int = NULL,                                     
    @nvarchar1 nvarchar(255) = NULL,
    @nvarchar2 nvarchar(255) = NULL,
    @nvarchar3 nvarchar(255) = NULL,
    @nvarchar4 nvarchar(255) = NULL,
    @nvarchar5 nvarchar(255) = NULL,
    @nvarchar6 nvarchar(255) = NULL,
    @nvarchar7 nvarchar(255) = NULL,
    @nvarchar8 nvarchar(255) = NULL,
    @nvarchar9 nvarchar(255) = NULL,
    @nvarchar10 nvarchar(255) = NULL,
    @nvarchar11 nvarchar(255) = NULL,
    @nvarchar12 nvarchar(255) = NULL,
    @nvarchar13 nvarchar(255) = NULL,
    @nvarchar14 nvarchar(255) = NULL,
    @nvarchar15 nvarchar(255) = NULL,
    @nvarchar16 nvarchar(255) = NULL,
    @nvarchar17 nvarchar(255) = NULL,
    @nvarchar18 nvarchar(255) = NULL,
    @nvarchar19 nvarchar(255) = NULL,
    @nvarchar20 nvarchar(255) = NULL,
    @nvarchar21 nvarchar(255) = NULL,
    @nvarchar22 nvarchar(255) = NULL,
    @nvarchar23 nvarchar(255) = NULL,
    @nvarchar24 nvarchar(255) = NULL,
    @nvarchar25 nvarchar(255) = NULL,
    @nvarchar26 nvarchar(255) = NULL,
    @nvarchar27 nvarchar(255) = NULL,
    @nvarchar28 nvarchar(255) = NULL,
    @nvarchar29 nvarchar(255) = NULL,
    @nvarchar30 nvarchar(255) = NULL,
    @nvarchar31 nvarchar(255) = NULL,
    @nvarchar32 nvarchar(255) = NULL,
    @nvarchar33 nvarchar(255) = NULL,
    @nvarchar34 nvarchar(255) = NULL,
    @nvarchar35 nvarchar(255) = NULL,
    @nvarchar36 nvarchar(255) = NULL,
    @nvarchar37 nvarchar(255) = NULL,
    @nvarchar38 nvarchar(255) = NULL,
    @nvarchar39 nvarchar(255) = NULL,
    @nvarchar40 nvarchar(255) = NULL,
    @nvarchar41 nvarchar(255) = NULL,
    @nvarchar42 nvarchar(255) = NULL,
    @nvarchar43 nvarchar(255) = NULL,
    @nvarchar44 nvarchar(255) = NULL,
    @nvarchar45 nvarchar(255) = NULL,
    @nvarchar46 nvarchar(255) = NULL,
    @nvarchar47 nvarchar(255) = NULL,
    @nvarchar48 nvarchar(255) = NULL,
    @nvarchar49 nvarchar(255) = NULL,
    @nvarchar50 nvarchar(255) = NULL,
    @nvarchar51 nvarchar(255) = NULL,
    @nvarchar52 nvarchar(255) = NULL,
    @nvarchar53 nvarchar(255) = NULL,
    @nvarchar54 nvarchar(255) = NULL,
    @nvarchar55 nvarchar(255) = NULL,
    @nvarchar56 nvarchar(255) = NULL,
    @nvarchar57 nvarchar(255) = NULL,
    @nvarchar58 nvarchar(255) = NULL,
    @nvarchar59 nvarchar(255) = NULL,
    @nvarchar60 nvarchar(255) = NULL,
    @nvarchar61 nvarchar(255) = NULL,
    @nvarchar62 nvarchar(255) = NULL,
    @nvarchar63 nvarchar(255) = NULL,
    @nvarchar64 nvarchar(255) = NULL,
    @int1 int = NULL,
    @int2 int = NULL,
    @int3 int = NULL,
    @int4 int = NULL,
    @int5 int = NULL,
    @int6 int = NULL,
    @int7 int = NULL,
    @int8 int = NULL,
    @int9 int = NULL,
    @int10 int = NULL,
    @int11 int = NULL,
    @int12 int = NULL,
    @int13 int = NULL,
    @int14 int = NULL,
    @int15 int = NULL,
    @int16 int = NULL,
    @float1 float = NULL,
    @float2 float = NULL,
    @float3 float = NULL,
    @float4 float = NULL,
    @float5 float = NULL,
    @float6 float = NULL,
    @float7 float = NULL,
    @float8 float = NULL,
    @float9 float = NULL,
    @float10 float = NULL,
    @float11 float = NULL,
    @float12 float = NULL,
    @datetime1 datetime = NULL,
    @datetime2 datetime = NULL,
    @datetime3 datetime = NULL,
    @datetime4 datetime = NULL,
    @datetime5 datetime = NULL,
    @datetime6 datetime = NULL,
    @datetime7 datetime = NULL,
    @datetime8 datetime = NULL,
    @bit1 bit = NULL,
    @bit2 bit = NULL,
    @bit3 bit = NULL,
    @bit4 bit = NULL,
    @bit5 bit = NULL,
    @bit6 bit = NULL,
    @bit7 bit = NULL,
    @bit8 bit = NULL,
    @bit9 bit = NULL,
    @bit10 bit = NULL,
    @bit11 bit = NULL,
    @bit12 bit = NULL,
    @bit13 bit = NULL,
    @bit14 bit = NULL,
    @bit15 bit = NULL,
    @bit16 bit = NULL,
    @uniqueidentifier1 uniqueidentifier = NULL,
    @ntext1 ntext = NULL,
    @ntext2 ntext = NULL,
    @ntext3 ntext = NULL,
    @ntext4 ntext = NULL,
    @ntext5 ntext = NULL,
    @ntext6 ntext = NULL,
    @ntext7 ntext = NULL,
    @ntext8 ntext = NULL,
    @ntext9 ntext = NULL,
    @ntext10 ntext = NULL,
    @ntext11 ntext = NULL,
    @ntext12 ntext = NULL,
    @ntext13 ntext = NULL,
    @ntext14 ntext = NULL,
    @ntext15 ntext = NULL,
    @ntext16 ntext = NULL,
    @ntext17 ntext = NULL,
    @ntext18 ntext = NULL,
    @ntext19 ntext = NULL,
    @ntext20 ntext = NULL,
    @ntext21 ntext = NULL,
    @ntext22 ntext = NULL,
    @ntext23 ntext = NULL,
    @ntext24 ntext = NULL,
    @ntext25 ntext = NULL,
    @ntext26 ntext = NULL,
    @ntext27 ntext = NULL,
    @ntext28 ntext = NULL,
    @ntext29 ntext = NULL,
    @ntext30 ntext = NULL,
    @ntext31 ntext = NULL,
    @ntext32 ntext = NULL,
    @sql_variant1 sql_variant = NULL,
    @error_sql_variant1 int = 0,
    @sql_variant2 sql_variant = NULL,
    @error_sql_variant2 int = 0,
    @sql_variant3 sql_variant = NULL,
    @error_sql_variant3 int = 0,
    @sql_variant4 sql_variant = NULL,
    @error_sql_variant4 int = 0,
    @sql_variant5 sql_variant = NULL,
    @error_sql_variant5 int = 0,
    @sql_variant6 sql_variant = NULL,
    @error_sql_variant6 int = 0,
    @sql_variant7 sql_variant = NULL,
    @error_sql_variant7 int = 0,
    @sql_variant8 sql_variant = NULL,
    @error_sql_variant8 int = 0,
    @eventData image = NULL,
    @acl image = NULL)
AS
    SET NOCOUNT ON
    DECLARE @ReturnCode int
    SET @ReturnCode = 0
    IF @ExtraItemSize IS NOT NULL AND @Size IS NOT NULL
    BEGIN
        SELECT @Size = @Size + @ExtraItemSize
    END
    BEGIN
        DECLARE @CurSchemaVersion as int
            SELECT 
                @CurSchemaVersion=tp_Version
            FROM 
                Lists WITH (XLOCK)
            WHERE 
                tp_WebId = @WebId AND
                tp_ID = @ListId
            IF  @CurSchemaVersion <> ISNULL(@CheckSchemaVersion, @CurSchemaVersion)
                BEGIN
                    SET @ReturnCode = 1638
                    GOTO CLEANUP
                END
    END  
    DECLARE @UserTitle nvarchar(255)
    DECLARE @RowsAffected int
    SET @RowsAffected = 0
    DECLARE @SizeOld int
    DECLARE @Version int
    DECLARE @Author int
    DECLARE @Editor int
    DECLARE @InstanceID int
    DECLARE @OldEventType int
    DECLARE @OldModerationStatus int
    DECLARE @NewLevel tinyint
    DECLARE @DraftOwnerId int
    SELECT
        @SizeOld = tp_Size,
        @Version = tp_Version,
        @Author = tp_Author,
        @Editor = tp_Editor,
        @InstanceID = tp_InstanceID,
        @OldEventType = int1,
        @ItemDirName = tp_DirName,
        @ItemLeafName = tp_LeafName,
        @OldModerationStatus = tp_ModerationStatus,
        @DraftOwnerId = tp_DraftOwnerId
    FROM
        UserData
    WHERE
        tp_ListId = @ListId AND
        tp_ID = @ItemID AND
        (tp_Level = @Level) AND 
        tp_RowOrdinal = 0 
    IF @DraftOwnerId IS NOT NULL AND @NeedsDraftOwnerRestriction = 1 AND
        @DraftOwnerId <> @UserId
    BEGIN
        SET @ReturnCode = 5
        GOTO CLEANUP
    END
    IF @DraftOwnerId IS NOT NULL AND 
       @Level = 1 AND
       @SystemUpdate = 0
    BEGIN
        SET @ReturnCode = 288
        GOTO CLEANUP
    END   
    IF @UserId IS NULL
    BEGIN
        SET @UserId = @Editor
    END
    IF (@IsNotUserDisplayed = 1)
    BEGIN
        SET @UserTitle = N'***'
    END
    ELSE
    BEGIN
        SELECT
            @UserTitle = tp_Title
        FROM
            UserInfo
        WHERE
            tp_SiteID = @SiteID AND 
            tp_Id = @UserId
    END
    IF @SizeOld IS NULL
    BEGIN
        SET @ReturnCode = 4005
        GOTO CLEANUP
    END
    IF @Size IS NULL
    BEGIN
       SET @Size = @SizeOld
    END
    IF (@SizeOld < @Size)
    BEGIN
        DECLARE @quotaOrLockStatus int
        SELECT @quotaOrLockStatus =
            dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
        IF (@quotaOrLockStatus = 1)
        BEGIN
            SET @ReturnCode = 1816
            GOTO CLEANUP
        END
        ELSE IF (@quotaOrLockStatus > 1)
        BEGIN
            SET @ReturnCode = 212
            GOTO CLEANUP
        END
    END
    DECLARE @DTM datetime
    SELECT @DTM = dbo.fn_RoundDateToNearestSecond(@TimeNow)
    IF @IsDocLib = 0
    BEGIN
        IF @NeedClone = 1
        BEGIN
            IF @Level <> 1 OR
               @OldModerationStatus <> 0 OR
               @tp_ModerationStatus = 0 OR
               @SystemUpdate = 1
            BEGIN
                SET @ReturnCode = 1639
                GOTO CLEANUP
            END
            EXEC @ReturnCode = proc_CloneDoc  @SiteId,
                           @ItemDirName,
                           @ItemLeafName,
                           NULL,
                           NULL,
                           NULL,
                           @Level,
                           2,
                           0,
                           1,
                           @UserId,
                           NULL
            IF @ReturnCode <> 0
                GOTO CLEANUP 
            SET @Level = 2            
        END
        ELSE IF (@tp_ModerationStatus IS NOT NULL AND 
            @OldModerationStatus <> @tp_ModerationStatus) OR 
            @ChangeLevel = 1 OR
            @CheckinItem = 1
        BEGIN
            IF @tp_ModerationStatus = 0
                SET @NewLevel = 1
            ELSE
                SET @NewLevel = 2
            IF @CheckinItem = 1
                SET @NewLevel = 1
            DECLARE @DocFlagOut int       
            EXEC @ReturnCode = proc_ChangeLevelForDoc
                @SiteId,
                @ItemDirName,
                @ItemLeafName,    
                @Level OUTPUT, 
                @NewLevel, 
                @tp_ModerationStatus,
                0,
                1,
                @CreateItemVersion,
                @UserId,
                NULL,
                1,
                @ItemID OUTPUT,
                @UIVersion OUTPUT,
                @DocFlagOut OUTPUT
            IF @ReturnCode <> 0
                GOTO CLEANUP                  
        END
        ELSE IF @SystemUpdate = 0 AND @CreateItemVersion = 1
        BEGIN
            EXEC @ReturnCode =  proc_CreateDocVersion
                @SiteId,
                @ItemDirName,
                @ItemLeafName,
                @ListId,
                @ItemId,
                @Level
            IF @ReturnCode <> 0
                GOTO CLEANUP
            UPDATE 
                Docs
            SET
                UIVersion = (UIVersion/512+1)*512
            WHERE
                SiteId = @SiteId AND
                DirName = @ItemDirName AND
                LeafName = @ItemLeafName AND
                WebId    = @WebId AND
                Level = @Level
            UPDATE
                NameValuePair
            SET
                Value = (CAST(Value AS int)/512+1)*512
            WHERE
                SiteId = @SiteId AND
                FieldId = '{7841bf41-43d0-4434-9f50-a673baef7631}' AND 
                ListId = @ListID AND
                ItemId = @ItemID AND
                Level = @Level
            UPDATE 
                UserData
            SET
                tp_UIVersion = (tp_UIVersion/512+1)*512
            WHERE
                tp_ListID = @ListID AND
                tp_ID = @ItemID AND
                tp_Level = @Level 
        END
    END
    UPDATE
        UserData
    SET
        tp_Version =
            CASE @PreserveVersion
                WHEN 1 THEN tp_Version
                ELSE tp_Version + 1
            END,
        tp_Author = ISNULL(@tp_Author, tp_Author),
        tp_Editor =
            CASE @SystemUpdate
                WHEN 1 THEN tp_Editor
                ELSE ISNULL(@tp_Editor, @UserID)
            END,
        tp_Created =
            CASE @SystemUpdate
                WHEN 1 THEN tp_Created
                ELSE ISNULL(@tp_Created, tp_Created)
            END,
        tp_Modified =
            CASE @SystemUpdate
                WHEN 1 THEN tp_Modified
                ELSE ISNULL(@tp_Modified, @DTM)
            END,
        tp_Ordering = @tp_Ordering,
        tp_ThreadIndex = @tp_ThreadIndex,
        tp_ModerationStatus = ISNULL(@tp_ModerationStatus,
            tp_ModerationStatus),
        tp_ItemOrder = ISNULL(@tp_ItemOrder, tp_ItemOrder), 
        tp_Size = @Size,
        tp_ContentType = ISNULL(@tp_ContentType, tp_ContentType),
        tp_ContentTypeId =
            CASE @RowOrdinal
                WHEN 0 THEN ISNULL(@tp_ContentTypeId,
                    ISNULL(tp_ContentTypeId, 0x00 + cast(tp_ListID as varbinary(16))))
                ELSE NULL
            END,    
        tp_CopySource = @tp_CopySource,
        tp_HasCopyDestinations = ISNULL(@tp_HasCopyDestinations, tp_HasCopyDestinations),
        tp_UIVersion = COALESCE(@UIVersion,tp_UIVersion),
        tp_WorkflowVersion = ISNULL(@tp_WorkflowVersion, tp_WorkflowVersion),
        nvarchar1 = @nvarchar1,
        nvarchar2 = @nvarchar2,
        nvarchar3 = @nvarchar3,
        nvarchar4 = @nvarchar4,
        nvarchar5 = @nvarchar5,
        nvarchar6 = @nvarchar6,
        nvarchar7 = @nvarchar7,
        nvarchar8 = @nvarchar8,
        nvarchar9 = @nvarchar9,
        nvarchar10 = @nvarchar10,
        nvarchar11 = @nvarchar11,
        nvarchar12 = @nvarchar12,
        nvarchar13 = @nvarchar13,
        nvarchar14 = @nvarchar14,
        nvarchar15 = @nvarchar15,
        nvarchar16 = @nvarchar16,
        nvarchar17 = @nvarchar17,
        nvarchar18 = @nvarchar18,
        nvarchar19 = @nvarchar19,
        nvarchar20 = @nvarchar20,
        nvarchar21 = @nvarchar21,
        nvarchar22 = @nvarchar22,
        nvarchar23 = @nvarchar23,
        nvarchar24 = @nvarchar24,
        nvarchar25 = @nvarchar25,
        nvarchar26 = @nvarchar26,
        nvarchar27 = @nvarchar27,
        nvarchar28 = @nvarchar28,
        nvarchar29 = @nvarchar29,
        nvarchar30 = @nvarchar30,
        nvarchar31 = @nvarchar31,
        nvarchar32 = @nvarchar32,
        nvarchar33 = @nvarchar33,
        nvarchar34 = @nvarchar34,
        nvarchar35 = @nvarchar35,
        nvarchar36 = @nvarchar36,
        nvarchar37 = @nvarchar37,
        nvarchar38 = @nvarchar38,
        nvarchar39 = @nvarchar39,
        nvarchar40 = @nvarchar40,
        nvarchar41 = @nvarchar41,
        nvarchar42 = @nvarchar42,
        nvarchar43 = @nvarchar43,
        nvarchar44 = @nvarchar44,
        nvarchar45 = @nvarchar45,
        nvarchar46 = @nvarchar46,
        nvarchar47 = @nvarchar47,
        nvarchar48 = @nvarchar48,
        nvarchar49 = @nvarchar49,
        nvarchar50 = @nvarchar50,
        nvarchar51 = @nvarchar51,
        nvarchar52 = @nvarchar52,
        nvarchar53 = @nvarchar53,
        nvarchar54 = @nvarchar54,
        nvarchar55 = @nvarchar55,
        nvarchar56 = @nvarchar56,
        nvarchar57 = @nvarchar57,
        nvarchar58 = @nvarchar58,
        nvarchar59 = @nvarchar59,
        nvarchar60 = @nvarchar60,
        nvarchar61 = @nvarchar61,
        nvarchar62 = @nvarchar62,
        nvarchar63 = @nvarchar63,
        nvarchar64 = @nvarchar64,
        int1 = @int1,
        int2 = @int2,
        int3 = @int3,
        int4 = @int4,
        int5 = @int5,
        int6 = @int6,
        int7 = @int7,
        int8 = @int8,
        int9 = @int9,
        int10 = @int10,
        int11 = @int11,
        int12 = @int12,
        int13 = @int13,
        int14 = @int14,
        int15 = @int15,
        int16 = @int16,
        float1 = @float1,
        float2 = @float2,
        float3 = @float3,
        float4 = @float4,
        float5 = @float5,
        float6 = @float6,
        float7 = @float7,
        float8 = @float8,
        float9 = @float9,
        float10 = @float10,
        float11 = @float11,
        float12 = @float12,
        datetime1 = @datetime1,
        datetime2 = @datetime2,
        datetime3 = @datetime3,
        datetime4 = @datetime4,
        datetime5 = @datetime5,
        datetime6 = @datetime6,
        datetime7 = @datetime7,
        datetime8 = @datetime8,
        bit1 = @bit1,
        bit2 = @bit2,
        bit3 = @bit3,
        bit4 = @bit4,
        bit5 = @bit5,
        bit6 = @bit6,
        bit7 = @bit7,
        bit8 = @bit8,
        bit9 = @bit9,
        bit10 = @bit10,
        bit11 = @bit11,
        bit12 = @bit12,
        bit13 = @bit13,
        bit14 = @bit14,
        bit15 = @bit15,
        bit16 = @bit16,
        uniqueidentifier1 = @uniqueidentifier1,
        ntext1 = @ntext1,
        ntext2 = @ntext2,
        ntext3 = @ntext3,
        ntext4 = @ntext4,
        ntext5 = @ntext5,
        ntext6 = @ntext6,
        ntext7 = @ntext7,
        ntext8 = @ntext8,
        ntext9 = @ntext9,
        ntext10 = @ntext10,
        ntext11 = @ntext11,
        ntext12 = @ntext12,
        ntext13 = @ntext13,
        ntext14 = @ntext14,
        ntext15 = @ntext15,
        ntext16 = @ntext16,
        ntext17 = @ntext17,
        ntext18 = @ntext18,
        ntext19 = @ntext19,
        ntext20 = @ntext20,
        ntext21 = @ntext21,
        ntext22 = @ntext22,
        ntext23 = @ntext23,
        ntext24 = @ntext24,
        ntext25 = @ntext25,
        ntext26 = @ntext26,
        ntext27 = @ntext27,
        ntext28 = @ntext28,
        ntext29 = @ntext29,
        ntext30 = @ntext30,
        ntext31 = @ntext31,
        ntext32 = @ntext32,
        sql_variant1 =  
            case @error_sql_variant1
                when 1 then CAST(@sql_variant1 as varbinary(2)) 
                when 2 then CAST(@sql_variant1 as bit) 
                when 3 then CAST(@sql_variant1 as float) 
                when 4 then CAST(@sql_variant1 as datetime) 
                else @sql_variant1
            end,
        sql_variant2 = 
            case @error_sql_variant2
                when 1 then CAST(@sql_variant2 as varbinary(2)) 
                when 2 then CAST(@sql_variant2 as bit) 
                when 3 then CAST(@sql_variant2 as float) 
                when 4 then CAST(@sql_variant2 as datetime) 
                else @sql_variant2
            end,
        sql_variant3 =
            case @error_sql_variant3
                when 1 then CAST(@sql_variant3 as varbinary(2)) 
                when 2 then CAST(@sql_variant3 as bit) 
                when 3 then CAST(@sql_variant3 as float) 
                when 4 then CAST(@sql_variant3 as datetime) 
                else @sql_variant3
            end,
        sql_variant4 = 
            case @error_sql_variant4
                when 1 then CAST(@sql_variant4 as varbinary(2)) 
                when 2 then CAST(@sql_variant4 as bit) 
                when 3 then CAST(@sql_variant4 as float) 
                when 4 then CAST(@sql_variant4 as datetime) 
                else @sql_variant4
            end,
        sql_variant5 =
            case @error_sql_variant5
                when 1 then CAST(@sql_variant5 as varbinary(2)) 
                when 2 then CAST(@sql_variant5 as bit) 
                when 3 then CAST(@sql_variant5 as float) 
                when 4 then CAST(@sql_variant5 as datetime) 
                else @sql_variant5
            end,
        sql_variant6 =
            case @error_sql_variant6
                when 1 then CAST(@sql_variant6 as varbinary(2)) 
                when 2 then CAST(@sql_variant6 as bit) 
                when 3 then CAST(@sql_variant6 as float) 
                when 4 then CAST(@sql_variant6 as datetime) 
                else @sql_variant6
            end,
        sql_variant7 = 
            case @error_sql_variant7
                when 1 then CAST(@sql_variant7 as varbinary(2)) 
                when 2 then CAST(@sql_variant7 as bit) 
                when 3 then CAST(@sql_variant7 as float) 
                when 4 then CAST(@sql_variant7 as datetime) 
                else @sql_variant7
            end,
        sql_variant8 = 
            case @error_sql_variant8
                when 1 then CAST(@sql_variant8 as varbinary(2)) 
                when 2 then CAST(@sql_variant8 as bit) 
                when 3 then CAST(@sql_variant8 as float) 
                when 4 then CAST(@sql_variant8 as datetime) 
                else @sql_variant8
            end
        WHERE
            tp_ListID = @ListID AND
            tp_ID = @ItemID AND
            (tp_Level = @Level) AND 
            tp_RowOrdinal = @RowOrdinal AND 
            (@tp_Version IS NULL OR @RowOrdinal > 0 OR
                tp_Version = @tp_Version) AND
            (@NeedsAuthorRestriction = 0 OR
                tp_Author = @UserID)
    SET @RowsAffected = @@RowCount
    IF @RowsAffected <> 1
    BEGIN
        SET @ReturnCode = 87
        IF (@tp_Version IS NOT NULL) AND @Version <> @tp_Version
        BEGIN
            SET @ReturnCode = 1150
        END
        GOTO CLEANUP
    END
    IF @IsMeetingsList = 1
    BEGIN
        EXEC @ReturnCode = proc_PostProcessUpdMtgListItem
            @SiteId,
            @WebId,
            @ListId,
            @InstanceID,
            @OldEventType,
            @int1,
            @datetime3,
            @int4,
            @tp_Version,
            @UserID,
            @DTM
        IF @ReturnCode <> 0
            GOTO CLEANUP
    END
    IF @BumpLastDelete = 1
    BEGIN
        UPDATE
            Lists
        SET
            tp_Modified = @DTM,
            tp_LastDeleted = GETUTCDATE()
        WHERE
            tp_WebID = @WebID AND
            tp_ID = @ListID
    END
    ELSE
    BEGIN
        UPDATE
            Lists
        SET
            tp_Modified = @DTM
        WHERE
            tp_WebID = @WebID AND
            tp_ID = @ListID
    END
    IF @MajorVersionsLimit > 0 OR @MajorMinorVersionsLimit > 0    
        EXEC  proc_ManageVersions
            @SiteId,
            @ItemDirName,
            @ItemLeafName,
            @ListID,
            @ItemID,
            @MajorVersionsLimit,
            @MajorMinorVersionsLimit  
    IF  @RowsAffected <> 0
    BEGIN
        SELECT
            @NewUIVersion = tp_UIVersion
        FROM
            UserData
        WHERE
            tp_SiteId = @SiteId AND
            tp_DirName = @ItemDirName AND
            tp_LeafName = @ItemLeafName AND
            tp_Level = @Level
    END
CLEANUP:
    IF @ReturnRowset = 1
    BEGIN
        DECLARE @Id uniqueidentifier
        DECLARE @AuditMask int
        DECLARE @InheritAuditMask int
        DECLARE @GlobalAuditMask int        
        DECLARE @FullUrl nvarchar(260)
        SELECT @FullUrl = CASE WHEN (DATALENGTH(@ItemDirName) = 0) THEN @ItemLeafName WHEN (DATALENGTH(@ItemLeafName) = 0) THEN @ItemDirName ELSE @ItemDirName + N'/' + @ItemLeafName END
        EXEC proc_GetAuditMaskOutput 
            3, 
            @SiteId, 
            @ItemDirName, 
            @ItemLeafName,
            @Id OUTPUT,
            @AuditMask OUTPUT,
            @InheritAuditMask OUTPUT,
            @GlobalAuditMask OUTPUT
        IF @PreserveVersion IS NULL OR @PreserveVersion = 0 AND @ReturnCode = 0
        BEGIN
            IF @ItemName IS NULL AND @UseNvarchar1ItemName = 1
                SET @ItemName = @nvarchar1
            DECLARE @EventType int
            SET @EventType =
                CASE
                    WHEN @SystemUpdate = 1 THEN 1048576
                    ELSE 8194
                END
            DECLARE @TimeLastModifiedLog datetime
            IF (@OnRestore = 1)
            BEGIN
                SET @TimeLastModifiedLog = GETUTCDATE()
            END
            ELSE
            BEGIN
                SET @TimeLastModifiedLog = @DTM
            END
            EXEC proc_AddEventToCache
                @SiteId, 
                @WebId, 
                @ListId,
                @ItemId,
                @ItemName,
                @FullUrl,
                @Id,
                @EventType,
                @UserTitle,
                @TimeLastModifiedLog,
                @eventData,
                @acl
            IF (@OnRestore = 1 AND @SystemUpdate = 0)
            BEGIN
                EXEC proc_AddEventToCache
                    @SiteId, 
                    @WebId, 
                    @ListId,
                    @ItemId,
                    @ItemName,
                    @FullUrl,
                    @Id,
                    1048576,
                    @UserTitle,
                    @TimeLastModifiedLog,
                    NULL,
                    @acl
            END
        END
        SELECT @ReturnCode, @RowsAffected, @Version, @Author, @Id, @AuditMask, 
               @InheritAuditMask, @GlobalAuditMask, @FullUrl
    END
    IF  @RowsAffected <> 0 AND @ReturnCode = 0
    BEGIN
        IF @CreateItemVersion = 0
            SET @Size = @Size - @SizeOld
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
            @SiteId, @Size, 1
     END
    RETURN @ReturnCode

GO
