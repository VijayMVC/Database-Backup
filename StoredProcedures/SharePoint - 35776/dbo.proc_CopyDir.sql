/****** Object:  StoredProcedure [dbo].[proc_CopyDir]    Script Date: 5/15/2018 12:11:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_CopyDir(
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
    @ParseDocsNow    bit OUTPUT,
    @FailedDirName   nvarchar(256) OUTPUT,
    @FailedLeafName  nvarchar(128) OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @OldUrlDirName nvarchar(256)
    DECLARE @NewUrlDirName nvarchar(256)
    DECLARE @OldUrlLeafName nvarchar(128)
    DECLARE @NewUrlLeafName nvarchar(128)
    DECLARE @NewListFlag bigint    
    DECLARE @NewUIVersion int
    DECLARE @NewModerationStatus int
    DECLARE @NewLevel tinyint 
    DECLARE @NewDraftOwnerId int
    DECLARE @NewFolderUIVersion int
    DECLARE @NewFolderModerationStatus int
    DECLARE @NewFolderLevel tinyint 
    DECLARE @NewFolderDraftOwnerId int
    DECLARE @OldUrlLike nvarchar(1024)
    DECLARE @cbDelta BIGINT
    DECLARE @OldListId uniqueidentifier
    DECLARE @OldBaseType int
    DECLARE @OldDoclibExcludedType int
    DECLARE @OldListMinDoclibRowId int
    DECLARE @OldListMaxDoclibRowId int
    DECLARE @OldListNumDoclibEntries int
    DECLARE @OldListDoclibItemDelta int
    DECLARE @OldListDoclibFileDelta int
    DECLARE @OldListMinIdVal int
    DECLARE @OldListMaxIdVal int
    DECLARE @OldDocParentId uniqueidentifier
    DECLARE @OldListFlags bigint
    DECLARE @NewListId uniqueidentifier
    DECLARE @NewBaseType int
    DECLARE @NewDoclibExcludedType int
    DECLARE @NewDoclibRowId int
    DECLARE @RetVal int
    DECLARE @RowDelta int
    DECLARE @SQLErrorCode int
    DECLARE @MaxNewListRowOrd int
    DECLARE @WebId uniqueidentifier
    DECLARE @CanViewAllDraft bit
    SET @CanViewAllDraft = 1
    SET @OldDoclibExcludedType = 0x00
    SET @NewDoclibExcludedType = 0x00
    DECLARE @Now datetime
    SELECT @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE());
    SET @cbDelta = 0
    EXEC proc_SplitUrl
        @OldUrl,
        @OldUrlDirName OUTPUT,
        @OldUrlLeafName OUTPUT
    EXEC proc_SplitUrl
        @NewUrl,
        @NewUrlDirName OUTPUT,
        @NewUrlLeafName OUTPUT
    EXEC @RetVal = proc_CanonicalDirNameFromUserInput
        @SiteId,
        @SubWebId,
        @NewUrlDirName OUTPUT,
        @NewDocParentId OUTPUT
    IF 0 <> @RetVal
    BEGIN
        RETURN @RetVal
    END
    SET @NewUrl = CASE WHEN (DATALENGTH(@NewUrlDirName) = 0) THEN @NewUrlLeafName WHEN (DATALENGTH(@NewUrlLeafName) = 0) THEN @NewUrlDirName ELSE @NewUrlDirName + N'/' + @NewUrlLeafName END
    DECLARE @NumDocsToCopy int
    DECLARE @NumDocsCopied int
    SET @NumDocsCopied = 0
    EXEC proc_EscapeForLike @OldUrl, @OldUrlLike OUTPUT
    EXEC @RetVal = proc_ValidateCopyDir @SiteId, @SubWebId,
        @SubWebUrl, @OldUrl, @NewUrl, @UserId, @RenameFlags,
        @OldListId OUTPUT, @OldBaseType OUTPUT,
        @OldDoclibExcludedType OUTPUT, @OldListFlags OUTPUT,
        @NewListId OUTPUT, @NewBaseType OUTPUT,
        @NewDoclibExcludedType OUTPUT, @FailedDirName OUTPUT,
        @FailedLeafName OUTPUT
    IF @RetVal <> 0
    BEGIN
        RETURN @RetVal
    END
    IF @OldListFlags IS NOT NULL AND
        ((@OldListFlags & 0x100000 <> 0) OR  
         (@OldListFlags & 0x200000 <> 0))
    BEGIN        
        SET @CanViewAllDraft = 0
    END
    DECLARE @DocList table
        (
            OldDocId uniqueidentifier,
            NewDocId uniqueidentifier,
            OldDocParentId uniqueidentifier,
            NewDocParentId uniqueidentifier,
            OldDirName nvarchar(256) COLLATE Latin1_General_CI_AS_KS_WS, 
            OldLeafName nvarchar(128) COLLATE Latin1_General_CI_AS_KS_WS,
            NewDirName nvarchar(256) COLLATE Latin1_General_CI_AS_KS_WS, 
            NewLeafName nvarchar(128) COLLATE Latin1_General_CI_AS_KS_WS,
            NewFullUrl nvarchar(260) COLLATE Latin1_General_CI_AS_KS_WS,
            Type int,
            Size int,
            MetaInfoSize int,
            UnVersionedMetaInfoSize int,
            TimeCreated datetime,
            TimeLastModified datetime,
            MetaInfoTimeLastModified datetime,
            TimeLastWritten datetime,
            ListId uniqueidentifier,
            WebId uniqueidentifier,
            DoclibRowId int,
            ThicketFlag int,
            CtoOffset int,
            IdVal int IDENTITY,
            OldLevel tinyint,
            PRIMARY KEY CLUSTERED (OldDirName, OldLeafName)
        )
    INSERT INTO @DocList
    SELECT
        Docs.Id,
        NEWID(),
        Docs.ParentId,
        NULL,
        Docs.DirName,
        Docs.LeafName,
        NewDirName =  COALESCE(
            CASE
            WHEN
                (Docs.DirName = @OldUrlDirName AND
                    Docs.LeafName = @OldUrlLeafName)
            THEN
                @NewUrlDirName
            ELSE
                STUFF(Docs.DirName, 1,
                LEN(@OldUrl), @NewUrl)
            END, 
            @NewUrlDirName
            ),
        NewLeafName = CASE
            WHEN
                (Docs.DirName = @OldUrlDirName AND
                    Docs.LeafName = @OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                Docs.LeafName
            END,
        NewFullUrl = STUFF((CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END), 1,
            LEN(@OldUrl), @NewUrl),
        Docs.Type,
        Docs.Size,
        Docs.MetaInfoSize,
        Docs.UnVersionedMetaInfoSize,
        Docs.TimeCreated,
        TimeLastModified = CASE
            WHEN
                Docs.TimeLastModified IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        MetaInfoTimeLastModified = CASE
            WHEN
                Docs.MetaInfoTimeLastModified IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        TimeLastWritten = CASE
            WHEN
                Docs.TimeLastWritten IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        Docs.ListId,
        Docs.WebId,
        Docs.DoclibRowId,
        Docs.ThicketFlag,
        Docs.CtoOffset,
        Docs.Level
    FROM                         
        Docs WITH (REPEATABLEREAD)
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @OldUrlDirName AND
        Docs.LeafName = @OldUrlLeafName AND
        ((@CanViewAllDraft = 1  AND 
            (
            Docs.Level = 1 AND 
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) AND
                Docs.DraftOwnerId IS NULL OR
            Docs.Level = 2 AND
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) OR
            Docs.Level = 255 AND
                Docs.LTCheckoutUserId IS NOT NULL AND
                Docs.LTCheckoutUserId = @USerId
            )
        ) OR
        (@CanViewAllDraft = 0  AND 
            (
            Docs.Level = 1 AND 
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) AND
                (Docs.DraftOwnerId IS NULL OR
                Docs.DraftOwnerId <> @UserId) OR
            Docs.Level = 2 AND
                Docs.DraftOwnerId IS NOT NULL AND
                Docs.DraftOwnerId = @UserId AND
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) OR
            Docs.Level = 255 AND
                Docs.LTCheckoutUserId IS NOT NULL AND
                Docs.LTCheckoutUserId = @USerId
            )
        ))
    UNION ALL
    SELECT
        Docs.Id,
        NEWID(),
        Docs.ParentId,
        NULL,
        Docs.DirName,
        Docs.LeafName,
        NewDirName =  COALESCE(
            CASE
            WHEN
                (Docs.DirName = @OldUrlDirName AND
                    Docs.LeafName = @OldUrlLeafName)
            THEN
                @NewUrlDirName
            ELSE
                STUFF(Docs.DirName, 1,
                LEN(@OldUrl), @NewUrl)
            END, 
            @NewUrlDirName
            ),
        NewLeafName = CASE
            WHEN
                (Docs.DirName = @OldUrlDirName AND
                    Docs.LeafName = @OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                Docs.LeafName
            END,
        NewFullUrl = STUFF((CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END), 1,
            LEN(@OldUrl), @NewUrl),
        Docs.Type,
        Docs.Size,
        Docs.MetaInfoSize,
        Docs.UnVersionedMetaInfoSize,
        Docs.TimeCreated,
        TimeLastModified = CASE
            WHEN
                Docs.TimeLastModified IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        MetaInfoTimeLastModified = CASE
            WHEN
                Docs.MetaInfoTimeLastModified IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        TimeLastWritten = CASE
            WHEN
                Docs.TimeLastWritten IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        Docs.ListId,
        Docs.WebId,
        Docs.DoclibRowId,
        Docs.ThicketFlag,
        Docs.CtoOffset,
        Docs.Level
    FROM                         
        Docs WITH (REPEATABLEREAD)
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @OldUrl AND
        ((@CanViewAllDraft = 1  AND 
            (
            Docs.Level = 1 AND 
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) AND
                Docs.DraftOwnerId IS NULL OR
            Docs.Level = 2 AND
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) OR
            Docs.Level = 255 AND
                Docs.LTCheckoutUserId IS NOT NULL AND
                Docs.LTCheckoutUserId = @USerId
            )
        ) OR
        (@CanViewAllDraft = 0  AND 
            (
            Docs.Level = 1 AND 
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) AND
                (Docs.DraftOwnerId IS NULL OR
                Docs.DraftOwnerId <> @UserId) OR
            Docs.Level = 2 AND
                Docs.DraftOwnerId IS NOT NULL AND
                Docs.DraftOwnerId = @UserId AND
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) OR
            Docs.Level = 255 AND
                Docs.LTCheckoutUserId IS NOT NULL AND
                Docs.LTCheckoutUserId = @USerId
            )
        ))
    UNION ALL
    SELECT
        Docs.Id,
        NEWID(),
        Docs.ParentId,
        NULL,
        Docs.DirName,
        Docs.LeafName,
        NewDirName =  COALESCE(
            CASE
            WHEN
                (Docs.DirName = @OldUrlDirName AND
                    Docs.LeafName = @OldUrlLeafName)
            THEN
                @NewUrlDirName
            ELSE
                STUFF(Docs.DirName, 1,
                LEN(@OldUrl), @NewUrl)
            END, 
            @NewUrlDirName
            ),
        NewLeafName = CASE
            WHEN
                (Docs.DirName = @OldUrlDirName AND
                    Docs.LeafName = @OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                Docs.LeafName
            END,
        NewFullUrl = STUFF((CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END), 1,
            LEN(@OldUrl), @NewUrl),
        Docs.Type,
        Docs.Size,
        Docs.MetaInfoSize,
        Docs.UnVersionedMetaInfoSize,
        Docs.TimeCreated,
        TimeLastModified = CASE
            WHEN
                Docs.TimeLastModified IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        MetaInfoTimeLastModified = CASE
            WHEN
                Docs.MetaInfoTimeLastModified IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        TimeLastWritten = CASE
            WHEN
                Docs.TimeLastWritten IS NULL
            THEN
                NULL
            ELSE
                @Now
            END,
        Docs.ListId,
        Docs.WebId,
        Docs.DoclibRowId,
        Docs.ThicketFlag,
        Docs.CtoOffset,
        Docs.Level
    FROM                         
        Docs WITH (REPEATABLEREAD)
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName LIKE @OldUrlLike AND
        ((@CanViewAllDraft = 1  AND 
            (
            Docs.Level = 1 AND 
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) AND
                Docs.DraftOwnerId IS NULL OR
            Docs.Level = 2 AND
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) OR
            Docs.Level = 255 AND
                Docs.LTCheckoutUserId IS NOT NULL AND
                Docs.LTCheckoutUserId = @USerId
            )
        ) OR
        (@CanViewAllDraft = 0  AND 
            (
            Docs.Level = 1 AND 
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) AND
                (Docs.DraftOwnerId IS NULL OR
                Docs.DraftOwnerId <> @UserId) OR
            Docs.Level = 2 AND
                Docs.DraftOwnerId IS NOT NULL AND
                Docs.DraftOwnerId = @UserId AND
                (Docs.LTCheckoutUserId IS NULL OR
                Docs.LTCheckoutUserId <> @UserId) OR
            Docs.Level = 255 AND
                Docs.LTCheckoutUserId IS NOT NULL AND
                Docs.LTCheckoutUserId = @USerId
            )
        ))
    SELECT @NumDocsToCopy = @@ROWCOUNT, @SQLErrorCode = @@ERROR 
    IF @NumDocsToCopy > 0 AND @CanViewAllDraft = 0 
    BEGIN
        DECLARE @MissingFolderList table
        (
            DirName nvarchar(256) COLLATE Latin1_General_CI_AS_KS_WS, 
            LeafName nvarchar(128) COLLATE Latin1_General_CI_AS_KS_WS,
            FullUrl nvarchar(260) COLLATE Latin1_General_CI_AS_KS_WS,
            PRIMARY KEY CLUSTERED (DirName, LeafName)
        ) 
        INSERT INTO @MissingFolderList
        SELECT
            Docs.DirName,
            Docs.LeafName,   
            CASE WHEN (DATALENGTH(Docs.DirName) = 0) THEN Docs.LeafName WHEN (DATALENGTH(Docs.LeafName) = 0) THEN Docs.DirName ELSE Docs.DirName + N'/' + Docs.LeafName END            
        FROM                         
            Docs WITH (NOLOCK)
        WHERE
            Docs.SiteId = @SiteId AND
            (Docs.DirName = @OldUrlDirName AND
            Docs.LeafName = @OldUrlLeafName OR
            Docs.DirName = @OldUrl OR
            Docs.DirName LIKE @OldUrlLike) AND
            Docs.Type <> 0 AND
            NOT EXISTS (SELECT * FROM @DocList DocList WHERE DocList.OldDirName= Docs.DirName AND DocList.OldLeafName = Docs.LeafName)
         DELETE
            DocList
         FROM
            @DocList DocList INNER JOIN @MissingFolderList MissingFolders
         ON
            DocList.OldDirName = MissingFolders.FullUrl OR
            DocList.OldDirName LIKE dbo.fn_EscapeForLike(MissingFolders.FullUrl, 1) COLLATE Latin1_General_CI_AS_KS_WS   
         SET @NumDocsToCopy = @NumDocsToCopy - @@ROWCOUNT
    END
    IF @NumDocsToCopy = 0
    BEGIN
        IF EXISTS(
            SELECT 
                * 
            FROM 
                Docs 
            WHERE 
                SiteId = @SiteId AND
                DirName = @OldUrlDirName AND
                LeafName = @OldUrlLeafName)
        BEGIN
            IF @SQLErrorCode = 8152
            BEGIN
                RETURN 206
            END
            ELSE
            BEGIN
                RETURN 32
            END
        END
        RETURN 3
    END
    SELECT
        @cbDelta = (ISNULL((SUM(CAST((ISNULL(Size, 0) + ISNULL(MetaInfoSize, 0) + ISNULL(UnVersionedMetaInfoSize, 0) + 152) AS BIGINT))),0))
    FROM
        @DocList
    IF (@cbDelta > 0)
    BEGIN
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
    END
    IF (@ReturnFlags & 0x01) = 0x01
    BEGIN
        SELECT
            OldDirName,
            OldLeafName,
            NewDirName,
            NewLeafName,
            Type
        FROM
            @DocList
    END
    SET @NewUIVersion = 512
    SET @NewModerationStatus = 0
    SET @NewLevel = 1
    SET @NewDraftOwnerId = NULL
    SET @NewFolderUIVersion = 512
    SET @NewFolderModerationStatus = 0
    SET @NewFolderLevel = 1
    SET @NewFolderDraftOwnerId = NULL
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
            BEGIN
                SET @NewModerationStatus = 3
                SET @NewFolderModerationStatus = 2
                SET @NewFolderUIVersion = 1
            END    
            ELSE
                SET @NewModerationStatus = 2                
        END
        ELSE
        BEGIN
            SET @NewUIVersion = 512
            IF (@NewListFlag & 0x400 <> 0) 
            BEGIN
                SET @NewModerationStatus = 2
                SET @NewFolderModerationStatus = 2
            END    
            ELSE
                SET @NewModerationStatus = 0
        END
        IF @NewModerationStatus <> 0
        BEGIN
            SET @NewLevel = 2
            SET @NewDraftOwnerId = @UserID
        END
        IF @NewFolderModerationStatus <> 0
        BEGIN
            SET @NewFolderLevel = 2
            SET @NewFolderDraftOwnerId = @UserID
        END
    END
    UPDATE
        DocList
    SET
        NewDocParentId = CASE
                      WHEN
                           DocList1.OldDocId = @OldDocParentId OR
                           DocList1.OldDocId IS NULL
                      THEN @NewDocParentId
                      ELSE DocList1.NewDocId
                      END
    FROM
        @DocList DocList LEFT OUTER JOIN @DocList DocList1
    ON
        DocList1.OldDirName = CASE WHEN (CHARINDEX(N'/', REVERSE(DocList.OldDirName)) > 0) THEN LEFT(DocList.OldDirName, DATALENGTH(DocList.OldDirName)/2 - CHARINDEX(N'/', REVERSE(DocList.OldDirName) COLLATE Latin1_General_BIN)) ELSE N'' END AND
        DocList1.OldLeafName = CASE WHEN (CHARINDEX(N'/', REVERSE(DocList.OldDirName) COLLATE Latin1_General_BIN) > 0) THEN RIGHT(DocList.OldDirName, CHARINDEX(N'/', REVERSE(DocList.OldDirName) COLLATE Latin1_General_BIN) - 1) ELSE DocList.OldDirName END
    IF @OldListId IS NOT NULL OR @NewListId IS NOT NULL
    BEGIN
        DECLARE @MaxNewRows int
        SELECT
            @OldListMinDoclibRowId = MIN(DoclibRowId),
            @OldListMaxDoclibRowId = MAX(DoclibRowId),
            @OldListNumDoclibEntries =
                SUM(CASE
                    WHEN DoclibRowId IS NULL
                    THEN
                        0
                    ELSE
                        1
                    END),
            @OldListDoclibItemDelta =
                SUM(CASE
                    WHEN DoclibRowId IS NOT NULL AND
                        Type = 0
                    THEN
                        1
                    ELSE
                        0
                    END),
            @OldListDoclibFileDelta =
                SUM(CASE
                    WHEN Type = 0
                    THEN
                        1
                    ELSE
                        0
                    END),
                @OldListMinIdVal = MIN(IdVal),
                @OldListMaxIdVal = MAX(IdVal)
        FROM
            @DocList
        IF (@NewListId IS NULL OR
            @NewBaseType IS NULL OR
            @NewBaseType <> 1)
        BEGIN
            UPDATE
                @DocList
            SET
                ListId = @NewListId,
                DoclibRowId = NULL
        END
        IF (@OldListId IS NULL OR
            @OldBaseType <> 1) AND
            @NewListId IS NOT NULL AND
            @NewBaseType = 1 AND
            (@RenameFlags & 512) <> 0
        BEGIN
            UPDATE
                @DocList
            SET
                ListId = @NewListId,
                DoclibRowId = @NewDoclibRowId +
                    IdVal - @OldListMinIdVal 
            WHERE
                ThicketFlag IS NOT NULL
        END
        IF (@OldListId IS NULL OR
            @OldBaseType <> 1) AND
            @NewListId IS NOT NULL AND
            @NewBaseType = 1 AND
            (@RenameFlags & 512) = 0
        BEGIN
            SET @MaxNewRows = @OldListMaxIdVal -
                @OldListMinIdVal + 1
            EXEC @NewDoclibRowId =
                proc_GenerateNextId @SubWebId, @NewListId,
                    @MaxNewRows
            SET @ParseDocsNow = 1
            UPDATE
                @DocList
            SET
                ListId = @NewListId,
                DoclibRowId = @NewDoclibRowId +
                    IdVal - @OldListMinIdVal 
            WHERE
                ThicketFlag IS NOT NULL
            INSERT INTO AllUserData(
                tp_ID,
                tp_Level,
                tp_ModerationStatus,
                tp_UIVersion,
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
                tp_Size)
            SELECT
                DoclibRowId,
                CASE WHEN   
                        Type = 0
                    THEN
                        @NewLevel
                    ELSE
                        @NewFolderLevel
                END,
                CASE WHEN   
                        Type = 0
                    THEN
                        @NewModerationStatus
                    ELSE
                        @NewFolderModerationStatus
                END,
                CASE WHEN   
                        Type = 0
                    THEN
                        @NewUIVersion
                    ELSE
                        @NewFolderUIVersion
                END,
                @NewListId,
                @SiteId,
                NewDirName,
                NewLeafName,
                0,
                0,
                @UserID,
                @UserID,
                CASE WHEN   
                        Type = 0
                    THEN
                        @NewDraftOwnerId
                    ELSE
                        @NewFolderDraftOwnerId
                END,
                @Now,
                @Now,
                NULL,
                NULL,
                NULL,
                0
            FROM
                @DocList
            WHERE
                ThicketFlag IS NOT NULL
            SET @RowDelta = @@ROWCOUNT
            IF @RowDelta = 0
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
            DECLARE @rowOrdCount int
            SET @rowOrdCount = 1
            IF @MaxNewListRowOrd > 0
            BEGIN
                WHILE  @rowOrdCount  <= @MaxNewListRowOrd
                BEGIN
                   INSERT INTO AllUserData(
                        tp_ID,
                        tp_Level,
                        tp_ModerationStatus,
                        tp_UIVersion,
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
                        tp_Size)
                    SELECT
                        DoclibRowId,
                        CASE WHEN   
                                Type = 0
                            THEN
                                @NewLevel
                            ELSE
                                @NewFolderLevel
                        END,
                        CASE WHEN   
                                Type = 0
                            THEN
                                @NewModerationStatus
                            ELSE
                                @NewFolderModerationStatus
                        END,
                        CASE WHEN   
                            Type = 0
                        THEN
                            @NewUIVersion
                        ELSE
                            @NewFolderUIVersion
                        END,
                        @NewListId,
                        @SiteId,
                        NewDirName,
                        NewLeafName,
                        @rowOrdCount,
                        0,
                        @UserID,
                        @UserID,
                        CASE WHEN   
                                Type = 0
                            THEN
                                @NewDraftOwnerId
                            ELSE
                                @NewFolderDraftOwnerId
                        END,
                        @Now,
                        @Now,
                        NULL,
                        NULL,
                        NULL,
                        0
                    FROM
                        @DocList
                    WHERE
                        ThicketFlag IS NOT NULL
                    SET @rowOrdCount = @rowOrdCount + 1
                END
            END
            UPDATE
                Lists
            SET
                tp_ItemCount = tp_ItemCount +
                    @OldListDoclibFileDelta,
                tp_Modified = @Now
            WHERE
                tp_WebID = @SubWebID AND
                tp_ID = @NewListID
        END
        IF (@OldListId IS NOT NULL AND
            @OldBaseType = 1 AND
            @NewListId IS NOT NULL AND
            @NewBaseType = 1)
        BEGIN
            DECLARE @UseRowIds bit
            DECLARE @DoclibRowIdDelta int
            DECLARE @IdValDelta int
            SET @DoclibRowIdDelta = @OldListMaxDoclibRowId -
                @OldListMinDoclibRowId + 1
            SET @IdValDelta = @OldListMaxIdVal -
                @OldListMinIdVal + 1
            IF @DoclibRowIdDelta IS NOT NULL AND
                @DoclibRowIdDelta < @IdValDelta
            BEGIN
                SET @MaxNewRows = @DoclibRowIdDelta
                SET @UseRowIds = 1
            END
            ELSE
            BEGIN
                SET @MaxNewRows = @IdValDelta
                SET @UseRowIds = 0
            END
            SET @MaxNewRows = @OldListMaxDoclibRowId -
                @OldListMinDoclibRowId + 1
            EXEC @NewDoclibRowId =
                proc_GenerateNextId @SubWebId, @NewListId,
                    @MaxNewRows
            IF @OldListId = @NewListId
            BEGIN
                INSERT INTO AllUserData(
                    tp_ID,
                    tp_Level,
                    tp_ModerationStatus,
                    tp_UIVersion,
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
                    CASE
                    WHEN
                        DocList.DoclibRowId IS NULL
                    THEN
                        NULL
                    WHEN
                        @UseRowIds = 1
                    THEN
                        @NewDoclibRowId +
                        DocList.DoclibRowId -
                        @OldListMinDoclibRowId
                    ELSE
                        @NewDoclibRowId +
                        DocList.IdVal -
                        @OldListMinIdVal
                    END,
                    CASE WHEN   
                            DocList.Type = 0
                        THEN
                            @NewLevel
                        ELSE
                            @NewFolderLevel
                    END,
                    CASE WHEN   
                        DocList.Type = 0
                    THEN
                        @NewModerationStatus
                    ELSE
                        @NewFolderModerationStatus
                    END,
                    CASE WHEN   
                        DocList.Type = 0
                    THEN
                        @NewUIVersion
                    ELSE
                        @NewFolderUIVersion
                    END,
                    NEWID(), 
                    @NewListID,
                    @SiteId,
                    DocList.NewDirName,
                    DocList.NewLeafName,
                    tp_RowOrdinal,
                    0,
                    tp_Author,
                    @UserID,
                    CASE WHEN   
                            DocList.Type = 0
                        THEN
                            @NewDraftOwnerId
                        ELSE
                            @NewFolderDraftOwnerId
                    END,
                    tp_Created,
                    @Now,
                    tp_Ordering,
                    tp_ThreadIndex,
                    tp_ItemOrder,
                    tp_InstanceID,
                    tp_Size,
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
                    @DocList DocList INNER JOIN UserData
                ON
                    UserData.tp_ListId = @OldListId AND
                    UserData.tp_ListId = DocList.ListId AND
                    UserData.tp_ID = DocList.DoclibRowId AND
                    UserData.tp_Level = DocList.OldLevel
                WHERE
                    DocList.DoclibRowId IS NOT NULL
                SET @RowDelta = @@ROWCOUNT
                IF @RowDelta = 0
                BEGIN
                    RETURN 87
                END
                INSERT INTO NameValuePair(
                    SiteId,
                    WebId,
                    ListId,
                    ItemId,
                    Level,
                    FieldId,
                    Value)
                SELECT
                    SiteId,
                    NVP.WebId,
                    @NewListID,
                    CASE
                    WHEN    
                        @UseRowIds = 1
                    THEN
                        @NewDoclibRowId +
                        DocList.DoclibRowId -
                        @OldListMinDoclibRowId
                    ELSE
                        @NewDoclibRowId +
                        DocList.IdVal -
                        @OldListMinIdVal
                    END,
                    CASE WHEN   
                            DocList.Type = 0
                        THEN
                            @NewLevel
                        ELSE
                            @NewFolderLevel
                    END,
                    FieldId,
                    CASE
                        WHEN FieldId = '{d31655d1-1d5b-4511-95a1-7a09e9b75bf2}' THEN @UserId
                        WHEN FieldId = '{28cf69c5-fa48-462a-b5cd-27b6f9d2bd5f}' THEN @Now
                        ELSE Value
                    END
                FROM
                    NameValuePair AS NVP INNER JOIN @DocList DocList
                ON
                    NVP.ListId = @OldListId AND
                    NVP.ListId = DocList.ListId AND
                    NVP.ItemId = DocList.DoclibRowId AND
                    NVP.Level = DocList.OldLevel
                WHERE
                    DocList.DoclibRowId IS NOT NULL AND
                    NVP.SiteId = @SiteId
                DECLARE @Collation smallint
                EXEC proc_GetCollation @OldListId, @Collation OUTPUT
    IF @Collation = 0
    BEGIN
        INSERT INTO
            NameValuePair_Albanian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Albanian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 1
    BEGIN
        INSERT INTO
            NameValuePair_Arabic_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Arabic_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 2
    BEGIN
        INSERT INTO
            NameValuePair_Chinese_PRC_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Chinese_PRC_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 3
    BEGIN
        INSERT INTO
            NameValuePair_Chinese_PRC_Stroke_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Chinese_PRC_Stroke_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 4
    BEGIN
        INSERT INTO
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Chinese_Taiwan_Bopomofo_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 5
    BEGIN
        INSERT INTO
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Chinese_Taiwan_Stroke_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 6
    BEGIN
        INSERT INTO
            NameValuePair_Croatian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Croatian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 7
    BEGIN
        INSERT INTO
            NameValuePair_Cyrillic_General_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Cyrillic_General_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 8
    BEGIN
        INSERT INTO
            NameValuePair_Czech_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Czech_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 9
    BEGIN
        INSERT INTO
            NameValuePair_Danish_Norwegian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Danish_Norwegian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 10
    BEGIN
        INSERT INTO
            NameValuePair_Estonian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Estonian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 11
    BEGIN
        INSERT INTO
            NameValuePair_Finnish_Swedish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Finnish_Swedish_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 12
    BEGIN
        INSERT INTO
            NameValuePair_French_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_French_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 13
    BEGIN
        INSERT INTO
            NameValuePair_Georgian_Modern_Sort_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Georgian_Modern_Sort_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 14
    BEGIN
        INSERT INTO
            NameValuePair_German_PhoneBook_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_German_PhoneBook_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 15
    BEGIN
        INSERT INTO
            NameValuePair_Greek_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Greek_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 16
    BEGIN
        INSERT INTO
            NameValuePair_Hebrew_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Hebrew_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 17
    BEGIN
        INSERT INTO
            NameValuePair_Hindi_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Hindi_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 18
    BEGIN
        INSERT INTO
            NameValuePair_Hungarian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Hungarian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 19
    BEGIN
        INSERT INTO
            NameValuePair_Hungarian_Technical_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Hungarian_Technical_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 20
    BEGIN
        INSERT INTO
            NameValuePair_Icelandic_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Icelandic_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 21
    BEGIN
        INSERT INTO
            NameValuePair_Japanese_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Japanese_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 22
    BEGIN
        INSERT INTO
            NameValuePair_Japanese_Unicode_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Japanese_Unicode_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 23
    BEGIN
        INSERT INTO
            NameValuePair_Korean_Wansung_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Korean_Wansung_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 24
    BEGIN
        INSERT INTO
            NameValuePair_Korean_Wansung_Unicode_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Korean_Wansung_Unicode_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 25
    BEGIN
        INSERT INTO
            NameValuePair_Latin1_General_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Latin1_General_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 26
    BEGIN
        INSERT INTO
            NameValuePair_Latvian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Latvian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 27
    BEGIN
        INSERT INTO
            NameValuePair_Lithuanian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Lithuanian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 28
    BEGIN
        INSERT INTO
            NameValuePair_Lithuanian_Classic_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Lithuanian_Classic_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 29
    BEGIN
        INSERT INTO
            NameValuePair_Traditional_Spanish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Traditional_Spanish_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 30
    BEGIN
        INSERT INTO
            NameValuePair_Modern_Spanish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Modern_Spanish_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 31
    BEGIN
        INSERT INTO
            NameValuePair_Polish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Polish_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 32
    BEGIN
        INSERT INTO
            NameValuePair_Romanian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Romanian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 33
    BEGIN
        INSERT INTO
            NameValuePair_Slovak_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Slovak_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 34
    BEGIN
        INSERT INTO
            NameValuePair_Slovenian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Slovenian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 35
    BEGIN
        INSERT INTO
            NameValuePair_Thai_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Thai_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 36
    BEGIN
        INSERT INTO
            NameValuePair_Turkish_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Turkish_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 37
    BEGIN
        INSERT INTO
            NameValuePair_Ukrainian_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Ukrainian_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
    ELSE
    IF @Collation = 38
    BEGIN
        INSERT INTO
            NameValuePair_Vietnamese_CI_AS(SiteId, WebId, ListId, ItemId, Level, FieldId, Value)
        SELECT
            SiteId, NVP.WebId, @NewListID, CASE WHEN @UseRowIds = 1 THEN @NewDoclibRowId + DocList.DoclibRowId - @OldListMinDoclibRowId ELSE @NewDoclibRowId + DocList.IdVal - @OldListMinIdVal END, @NewLevel, FieldId, Value
        FROM
            NameValuePair_Vietnamese_CI_AS AS NVP
        INNER JOIN @DocList DocList ON NVP.ListId = @OldListId AND NVP.ListId = DocList.ListId AND NVP.ItemId = DocList.DoclibRowId AND NVP.Level = DocList.OldLevel WHERE DocList.DoclibRowId IS NOT NULL AND NVP.SiteId = @SiteId
    END
                UPDATE AllUserData
                    SET tp_GUID = t.tp_GUID
                FROM AllUserData INNER JOIN AllUserData as t
                    ON (AllUserData.tp_ListID = t.tp_ListID AND
                         AllUserData.tp_ID = t.tp_ID AND
                         t.tp_RowOrdinal = 0 AND
                         AllUserData.tp_RowOrdinal <> 0) 
                WHERE
                    AllUserData.tp_ListId = @NewListId  
            END
            ELSE
            BEGIN
                SET @ParseDocsNow = 1
                INSERT INTO AllUserData (
                    tp_ID,
                    tp_Level,
                    tp_ModerationStatus,
                    tp_UIVersion,
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
                    tp_Size)
                SELECT
                    CASE
                    WHEN
                        DocList.DocLibRowId IS NULL
                    THEN
                        NULL
                    WHEN
                        @UseRowIds = 1
                    THEN
                        @NewDoclibRowId +
                        DocList.DoclibRowId -
                        @OldListMinDoclibRowId
                    ELSE
                        @NewDoclibRowId +
                        DocList.IdVal -
                        @OldListMinIdVal
                    END,
                    CASE WHEN   
                            DocList.Type = 0
                        THEN
                            @NewLevel
                        ELSE
                            @NewFolderLevel
                    END,
                    CASE WHEN   
                        Type = 0
                    THEN
                        @NewModerationStatus
                    ELSE
                        @NewFolderModerationStatus
                    END,
                    CASE WHEN   
                        Type = 0
                    THEN
                        @NewUIVersion
                    ELSE
                        @NewFolderUIVersion
                    END,
                    @NewListId,
                    @SiteId,
                    DocList.NewDirName,
                    DocList.NewLeafName,
                    0,
                    0,
                    UserData.tp_Author,
                    @UserID,
                    CASE WHEN   
                            DocList.Type = 0
                        THEN
                            @NewDraftOwnerId
                        ELSE
                            @NewFolderDraftOwnerId
                    END,
                    UserData.tp_Created,
                    @Now,
                    NULL,
                    NULL,
                    NULL,
                    0
                FROM
                    @DocList DocList INNER JOIN UserData
                ON
                    UserData.tp_ListId = @OldListId AND
                    UserData.tp_ListId = DocList.ListId AND
                    UserData.tp_ID = DocList.DoclibRowId AND
                    UserData.tp_Level = DocList.OldLevel
                WHERE
                     UserData.tp_RowOrdinal = 0
                SET @RowDelta = @@ROWCOUNT
                IF @RowDelta = 0
                BEGIN
                    RETURN 87
                END
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
                        tp_Level,
                        tp_ModerationStatus,
                        tp_UIVersion,
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
                        tp_Size)
                    SELECT
                        CASE
                            @UseRowIds
                        WHEN
                            1
                        THEN
                            @NewDoclibRowId +
                            DocList.DoclibRowId -
                            @OldListMinDoclibRowId
                        ELSE
                            @NewDoclibRowId +
                            DocList.IdVal -
                            @OldListMinIdVal
                        END,
                        CASE WHEN   
                            DocList.Type = 0
                        THEN
                            @NewLevel
                        ELSE
                            @NewFolderLevel
                        END,
                        CASE WHEN   
                                Type = 0
                            THEN
                                @NewModerationStatus
                            ELSE
                                @NewFolderModerationStatus
                        END,
                        CASE WHEN   
                            Type = 0
                        THEN
                            @NewUIVersion
                        ELSE
                            @NewFolderUIVersion
                        END,
                        @NewListId,
                        @SiteId,
                        UserData.tp_DirName,
                        UserData.tp_LeafName,                    
                        @rowOrdCount,
                        0,
                        UserData.tp_Author,
                        @UserID,
                        CASE WHEN   
                                Type = 0
                            THEN
                                @NewDraftOwnerId
                            ELSE
                                @NewFolderDraftOwnerId
                        END,
                        UserData.tp_Created,
                        @Now,
                        NULL,
                        NULL,
                        NULL,
                        0
                    FROM
                        @DocList DocList INNER JOIN UserData
                    ON
                        UserData.tp_SiteId = @SiteId AND
                        UserData.tp_DirName = DocList.NewDirName AND
                        UserData.tp_LeafName = DocList.NewLeafName AND
                        UserData.tp_Level = DocList.OldLevel
                    WHERE
                        UserData.tp_RowOrdinal = 0
                      SET @rowOrdCount = @rowOrdCount + 1
                END
            END
            UPDATE
                Lists
            SET
                tp_ItemCount = tp_ItemCount +
                    @OldListDoclibItemDelta,
                tp_Modified = @Now
            WHERE
                tp_WebID = @SubWebID AND
                tp_ID = @NewListID
            IF @@ROWCOUNT <> 1
            BEGIN
                RETURN 87
            END
            UPDATE
                @DocList
            SET
                ListId = @NewListId,
                DoclibRowId =
                CASE
                    WHEN DoclibRowId IS NOT NULL
                THEN
                    CASE
                        @UseRowIds
                    WHEN
                        1
                    THEN
                        @NewDoclibRowId +
                        DoclibRowId -
                        @OldListMinDoclibRowId
                    ELSE
                        @NewDoclibRowId +
                        IdVal -
                        @OldListMinIdVal
                    END
                ELSE
                    NULL
                END
            WHERE
                ListId IS NOT NULL
        END
    END
    DECLARE @DstScopeId uniqueidentifier
    DECLARE @DstFolderId int
    EXEC proc_GetFolderInfo @SiteId, @NewUrlDirName, @DstScopeId OUTPUT, @WebId OUTPUT, @DstFolderId OUTPUT
    DECLARE @CtoMask int
    IF (@OldListId IS NOT NULL AND
        @NewListId IS NOT NULL AND 
        @OldListId = @NewListId)
    BEGIN    
        SET @CtoMask = ~0
    END
    ELSE
    BEGIN
        SET @CtoMask = ~8192
    END
    IF @NewListId IS NULL
    BEGIN
            UPDATE
                @DocList
            SET
                CtoOffset = NULL
    END
    ELSE
    BEGIN
        DECLARE @NewParentDirName nvarchar(256)
        DECLARE @NewParentLeafName nvarchar(128)
        EXEC proc_SplitUrl
            @NewUrlDirName,
            @NewParentDirName OUTPUT,
            @NewParentLeafName OUTPUT
        DECLARE @NewCtoOffset int
        SELECT
            @NewCtoOffset = CtoOffset
        FROM
            Docs
        WHERE
            SiteId = @SiteId AND
            DirName = @NewParentDirName AND
            LeafName = @NewParentLeafName
        IF @OldListId = @NewListId
        BEGIN
            DECLARE @OldParentDirName nvarchar(256)
            DECLARE @OldParentLeafName nvarchar(128)
            EXEC proc_SplitUrl
                @OldUrlDirName,
                @OldParentDirName OUTPUT,
                @OldParentLeafName OUTPUT
            DECLARE @OldCtoOffset int
            SELECT
                @OldCtoOffset = CtoOffset
            FROM
                Docs
            WHERE
                SiteId = @SiteId AND
                DirName = @OldParentDirName AND
                LeafName = @OldParentLeafName
            DECLARE @Delta int
            SET @Delta = (DATALENGTH(@NewUrl)-DATALENGTH(@OldUrl))/2
            UPDATE
                @DocList
            SET
                CtoOffset = 
                    CASE 
                    WHEN CtoOffset IS NULL THEN @NewCtoOffset
                    WHEN CtoOffset = @OldCtoOffset THEN @NewCtoOffset 
                    ELSE CtoOffset + @Delta
                    END    
        END
        ELSE
        BEGIN
            UPDATE
                @DocList
            SET
                CtoOffset = @NewCtoOffset
        END
    END
    INSERT INTO AllDocs  (Id,
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
        MetaInfoSize,
        Version,
        UIVersion,
        Dirty,
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
        VirusVendorID,
        VirusStatus,
        VirusInfo,
        ScopeId,
        DraftOwnerId,
        ParentVersion,
        TransformerId,
        ParentLeafName,
        CtoOffset)
    SELECT
        DocList.NewDocId,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewLevel
            ELSE
                @NewFolderLevel
        END,
        Docs.SiteId,
        DocList.NewDocParentId,
        DocList.NewDirName,
        DocList.NewLeafName,
        @WebId,
        DocList.ListId,
        DocList.DoclibRowId,
        DocList.Type,
        DocList.Size,
        Docs.MetaInfoSize,
        CASE
            WHEN Docs.Version IS NULL THEN
                NULL
        ELSE
            1
        END,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewUIVersion
            ELSE
                @NewFolderUIVersion
        END,
        CASE
        WHEN
            Docs.DocFlags & 4 = 4
        THEN
            1
        ELSE
            Docs.Dirty
        END,
        Docs.DocFlags & ~32 & ~512 & @CtoMask,
        DocList.TimeCreated,
        DocList.TimeLastModified,
        DocList.MetaInfoTimeLastModified,
        DocList.TimeLastWritten,
        Docs.MetaInfo,
        Docs.ThicketFlag,
        Docs.CharSet,
        Docs.ProgId,
        Docs.SetupPathVersion,
        Docs.SetupPath,
        Docs.SetupPathUser,
        Docs.VirusVendorID,
        Docs.VirusStatus,
        Docs.VirusInfo,
        @DstScopeId,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewDraftOwnerId
            ELSE
                @NewFolderDraftOwnerId
        END,
        Docs.ParentVersion,
        Docs.TransformerId,
        Docs.ParentLeafName,
        DocList.CtoOffset
    FROM
        Docs INNER JOIN @DocList DocList
    ON
        Docs.SiteId = @SiteId AND
        Docs.DirName = DocList.OldDirName AND
        Docs.LeafName = DocList.OldLeafName AND
        Docs.Level = DocList.OldLevel
    WHERE
        Docs.SiteId = @SiteId AND
        ((Docs.DirName = @OldUrlDirName AND
            Docs.LeafName = @OldUrlLeafName))
    UNION ALL
    SELECT
        DocList.NewDocId,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewLevel
            ELSE
                @NewFolderLevel
        END,
        Docs.SiteId,
        DocList.NewDocParentId,
        DocList.NewDirName,
        DocList.NewLeafName,
        @WebId,
        DocList.ListId,
        DocList.DoclibRowId,
        DocList.Type,
        DocList.Size,
        Docs.MetaInfoSize,
        CASE
            WHEN Docs.Version IS NULL THEN
                NULL
        ELSE
            1
        END,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewUIVersion
            ELSE
                @NewFolderUIVersion
        END,
        CASE
        WHEN
            Docs.DocFlags & 4 = 4
        THEN
            1
        ELSE
            Docs.Dirty
        END,
        Docs.DocFlags & ~32 & ~512 & @CtoMask,
        DocList.TimeCreated,
        DocList.TimeLastModified,
        DocList.MetaInfoTimeLastModified,
        DocList.TimeLastWritten,
        Docs.MetaInfo,
        Docs.ThicketFlag,
        Docs.CharSet,
        Docs.ProgId,
        Docs.SetupPathVersion,
        Docs.SetupPath,
        Docs.SetupPathUser,
        Docs.VirusVendorID,
        Docs.VirusStatus,
        Docs.VirusInfo,
        @DstScopeId,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewDraftOwnerId
            ELSE
                @NewFolderDraftOwnerId
        END,
        Docs.ParentVersion,
        Docs.TransformerId,
        Docs.ParentLeafName,
        DocList.CtoOffset
    FROM
        Docs INNER JOIN @DocList DocList
    ON
        Docs.SiteId = @SiteId AND
        Docs.DirName = DocList.OldDirName AND
        Docs.LeafName = DocList.OldLeafName AND
        Docs.Level = DocList.OldLevel
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @OldUrl
    UNION ALL
    SELECT
        DocList.NewDocId,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewLevel
            ELSE
                @NewFolderLevel
        END,
        Docs.SiteId,
        DocList.NewDocParentId,
        DocList.NewDirName,
        DocList.NewLeafName,
        @WebId,
        DocList.ListId,
        DocList.DoclibRowId,
        DocList.Type,
        DocList.Size,
        Docs.MetaInfoSize,
        CASE
            WHEN Docs.Version IS NULL THEN
                NULL
        ELSE
            1
        END,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewUIVersion
            ELSE
                @NewFolderUIVersion
        END,
        CASE        
        WHEN
            Docs.DocFlags & 4 = 4
        THEN
            1
        ELSE
            Docs.Dirty
        END,
        Docs.DocFlags & ~32 & ~512 & @CtoMask,
        DocList.TimeCreated,
        DocList.TimeLastModified,
        DocList.MetaInfoTimeLastModified,
        DocList.TimeLastWritten,
        Docs.MetaInfo,
        Docs.ThicketFlag,
        Docs.CharSet,
        Docs.ProgId,
        Docs.SetupPathVersion,
        Docs.SetupPath,
        Docs.SetupPathUser,
        Docs.VirusVendorID,
        Docs.VirusStatus,
        Docs.VirusInfo,
        @DstScopeId,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewDraftOwnerId
            ELSE
                @NewFolderDraftOwnerId
        END,
        Docs.ParentVersion,
        Docs.TransformerId,
        Docs.ParentLeafName,
        DocList.CtoOffset
    FROM
        Docs INNER JOIN @DocList DocList
    ON
        Docs.SiteId = @SiteId AND
        Docs.DirName = DocList.OldDirName AND
        Docs.LeafName = DocList.OldLeafName AND
        Docs.Level = DocList.OldLevel
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName LIKE @OldUrlLike
    SET @NumDocsCopied = @@ROWCOUNT
    IF (@NumDocsCopied <> @NumDocsToCopy) OR (@@ERROR <> 0)
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
        DocList.NewDocId,
        DocStreams.SiteId,
        DocList.NewDocParentId,
        CASE WHEN   
                DocList.Type = 0
            THEN
                @NewLevel
            ELSE
                @NewFolderLevel
        END,
        DocList.Size,
        DocStreams.Content
    FROM
        @DocList DocList 
    INNER JOIN 
        DocStreams
    ON
        DocStreams.SiteId = @SiteId AND
        DocStreams.ParentId = DocList.OldDocParentId AND
        DocStreams.Id = DocList.OldDocId AND
        DocStreams.Level = DocList.OldLevel
    IF (@@ERROR <> 0)
    BEGIN
        RETURN 1150
    END
    INSERT INTO Links (
        SiteId,
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
        DirName = CASE
            WHEN
                (DirName = @OldUrlDirName AND
                    LeafName = @OldUrlLeafName)
            THEN
                @NewUrlDirName
            ELSE
                STUFF(DirName, 1, LEN(@OldUrl), @NewUrl)
            END,
        LeafName = CASE
            WHEN
                (DirName = @OldUrlDirName AND
                    LeafName = @OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                LeafName
            END,
        Level = CASE WHEN   
                DocList.Type = 0
            THEN
                @NewLevel
            ELSE
                @NewFolderLevel
        END,
        FieldId,
        TargetDirName = CASE
            WHEN
                (TargetDirName = @OldUrlDirName AND
                    TargetLeafName = @OldUrlLeafName)
            THEN
                LEFT(@NewUrlDirName, 256)
            WHEN
                TargetDirName = @OldUrl OR
                TargetDirName LIKE @OldUrlLike
            THEN
                LEFT(STUFF(TargetDirName, 1,
                LEN(@OldUrl), @NewUrl), 256)
            ELSE
                TargetDirName
            END, 
        TargetLeafName = CASE
            WHEN
                (TargetDirName = @OldUrlDirName AND
                    TargetLeafName = @OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                TargetLeafName
            END,
        Links.Type,
        Security,
        Dynamic,
        ServerRel,
        PointsToDir,
        LinkNumber
    FROM
        Links
    INNER JOIN @DocList DocList
    ON
        Links.SiteId = @SiteId AND
        Links.DirName = DocList.OldDirName AND
        Links.LeafName = DocList.OldLeafName AND
        Links.Level = DocList.OldLevel
    WHERE
       WebPartId IS NULL
    IF (@@ERROR <> 0)
    BEGIN
        RETURN 1150
    END
    DECLARE @idTable table
        (OldWebPartId uniqueidentifier,
            NewWebPartId uniqueidentifier)
    INSERT INTO @idTable(
        OldWebPartId,
        NewWebPartId)
    SELECT
        WebParts.tp_ID,
        NEWID()
    FROM
        WebParts INNER JOIN @DocList DocList
    ON
        WebParts.tp_SiteID = @SiteId AND
        WebParts.tp_PageUrlID = DocList.OldDocId
    INSERT INTO WebPartLists(
        tp_SiteId,
        tp_WebPartID,
        tp_Level,
        tp_WebId,
        tp_ListId,
        tp_PageUrlID,
        tp_UserID)
    SELECT
        WebPartLists.tp_SiteId,
        idTable1.NewWebPartId,
        @NewLevel,
        WebPartLists.tp_WebId,
        WebPartLists.tp_ListId,
        DocList.NewDocId,
        WebPartLists.tp_UserID
    FROM
        WebPartLists INNER JOIN @DocList DocList
    ON
        WebPartLists.tp_SiteID = @SiteId AND
        WebPartLists.tp_PageUrlID = DocList.OldDocId AND
        WebPartLists.tp_Level = DocList.OldLevel
        INNER JOIN @idTable idTable1
    ON
        WebPartLists.tp_WebPartID = idTable1.OldWebPartId
    INSERT INTO WebParts(
        tp_SiteId,
        tp_ID,
        tp_Level,
        tp_ListId,
        tp_Type,
        tp_Flags,
        tp_BaseViewID,
        tp_DisplayName,
        tp_ContentTypeId,
        tp_Version,
        tp_PageUrlID,
        tp_PartOrder,
        tp_ZoneID,
        tp_IsIncluded,
        tp_FrameState,
        tp_View,
        tp_WebPartTypeId,
        tp_AllUsersProperties,
        tp_PerUserProperties,
        tp_Cache,
        tp_UserID,
        tp_Source,
        tp_Size)
    SELECT
        WebParts.tp_SiteId,
        idTable1.NewWebPartId,
        @NewLevel,
        WebParts.tp_ListId,
        CASE WHEN WebParts.tp_Type = 0 THEN 1 ELSE WebParts.tp_Type END,
        WebParts.tp_Flags & ~(0 | 1048576),
        WebParts.tp_BaseViewID,
        WebParts.tp_DisplayName,
        WebParts.tp_ContentTypeId,
        WebParts.tp_Version,
        DocList.NewDocId,
        WebParts.tp_PartOrder,
        WebParts.tp_ZoneID,
        WebParts.tp_IsIncluded,
        WebParts.tp_FrameState,
        WebParts.tp_View,
        WebParts.tp_WebPartTypeId,
        WebParts.tp_AllUsersProperties,
        WebParts.tp_PerUserProperties,
        WebParts.tp_Cache,
        WebParts.tp_UserID,
        WebParts.tp_Source,
        WebParts.tp_Size
    FROM
        WebParts INNER JOIN @DocList DocList
    ON
        WebParts.tp_SiteID = @SiteId AND
        WebParts.tp_PageUrlID = DocList.OldDocId AND
        WebParts.tp_Level = DocList.OldLevel
        INNER JOIN @idTable idTable1
    ON
        WebParts.tp_ID = idTable1.OldWebPartId
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    SELECT
        @cbDelta = @cbDelta + (ISNULL((SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT))),0))
    FROM
        WebParts INNER JOIN @DocList DocList
    ON
        WebParts.tp_SiteID = @SiteId AND
        WebParts.tp_PageUrlID = DocList.NewDocId AND
        WebParts.tp_Level = DocList.OldLevel
    INSERT INTO Personalization(
        tp_SiteId,
        tp_WebPartID,
        tp_PageUrlID,
        tp_UserID,
        tp_PartOrder,
        tp_ZoneID,
        tp_IsIncluded,
        tp_FrameState,
        tp_PerUserProperties,
        tp_Cache,
        tp_Size)
    SELECT
        Personalization.tp_SiteId,
        idTable1.NewWebPartId,
        DocList.NewDocId,
        Personalization.tp_UserID,
        Personalization.tp_PartOrder,
        Personalization.tp_ZoneID,
        Personalization.tp_IsIncluded,
        Personalization.tp_FrameState,
        Personalization.tp_PerUserProperties,
        Personalization.tp_Cache,
        Personalization.tp_Size
    FROM
        Personalization INNER JOIN WebParts
    ON
        Personalization.tp_SiteID = WebParts.tp_SiteID AND
        Personalization.tp_SiteID = @SiteId AND
        Personalization.tp_WebPartID = WebParts.tp_ID
        INNER JOIN @idTable idTable1
    ON
        WebParts.tp_ID = idTable1.OldWebPartId
        INNER JOIN @DocList DocList
    ON
        WebParts.tp_SiteID = @SiteId AND
        WebParts.tp_PageUrlID = DocList.OldDocId AND
        WebParts.tp_Level = DocList.OldLevel
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    SELECT
        @cbDelta = @cbDelta + (ISNULL((SUM(CAST((ISNULL(tp_Size, 0)) AS BIGINT))),0))
    FROM
        Personalization INNER JOIN @DocList DocList
    ON
        Personalization.tp_SiteID = @SiteId AND
        Personalization.tp_PageUrlID = DocList.NewDocId
    INSERT INTO Links  (
        SiteId,
        DirName,
        LeafName,
        Level,
        FieldId,
        WebPartId,
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
        DocList.NewDirName,
        DocList.NewLeafName,
        CASE 
            WHEN   
                DocList.Type = 0
            THEN
                @NewLevel
            ELSE
                @NewFolderLevel
        END,
        Links.FieldId,
        idTable1.NewWebPartId,
        TargetDirName = CASE
            WHEN
                (Links.TargetDirName = @OldUrlDirName AND
                    Links.TargetLeafName = @OldUrlLeafName)
            THEN
                LEFT(@NewUrlDirName, 256)
            WHEN
                Links.TargetDirName = @OldUrl OR
                Links.TargetDirName LIKE @OldUrlLike
            THEN
                LEFT(STUFF(Links.TargetDirName, 1, LEN(@OldUrl), @NewUrl), 256)
            ELSE
                Links.TargetDirName
            END, 
        TargetLeafName = CASE
            WHEN
                (Links.TargetDirName = @OldUrlDirName AND
                    Links.TargetLeafName = @OldUrlLeafName)
            THEN
                @NewUrlLeafName
            ELSE
                Links.TargetLeafName
            END,
        Links.Type,
        Links.Security,
        Links.Dynamic,
        Links.ServerRel,
        Links.PointsToDir,
        Links.LinkNumber
    FROM
        Links INNER JOIN @idTable idTable1
    ON
        Links.WebPartId = idTable1.OldWebPartId
        INNER JOIN @DocList DocList
    ON
        Links.DirName = DocList.OldDirName AND
        Links.LeafName = DocList.OldLeafName AND
        Links.Level = DocList.OldLevel
    WHERE
        Links.SiteId = @SiteId AND
        Links.WebPartId IS NOT NULL
    INSERT INTO Deps (SiteId,
        FullUrl,
        Level,
        DepType,
        DepDesc)
    SELECT
        @SiteId,
        STUFF(FullUrl, 1, LEN(@OldUrl), @NewUrl),
        CASE 
           WHEN   
               DocList.Type = 0
           THEN
               @NewLevel
           ELSE
               @NewFolderLevel
        END,
        DepType,
        DepDesc
    FROM
        Deps   
    INNER JOIN @DocList DocList
    ON
        Deps.FullUrl = CASE WHEN (DATALENGTH(DocList.OldDirName) = 0) THEN DocList.OldLeafName WHEN (DATALENGTH(DocList.OldLeafName) = 0) THEN DocList.OldDirName ELSE DocList.OldDirName + N'/' + DocList.OldLeafName END AND
        Deps.Level = DocList.OldLevel
    WHERE  
        SiteId = @SiteId AND
        DeleteTransactionId = 0x 
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    EXEC proc_ResyncWelcomeLinks @SiteId, @NewUrl, NULL, NULL
    INSERT INTO UserDataJunctions (
        tp_SiteId,
        tp_DeleteTransactionId,
        tp_IsCurrentVersion,
        tp_DirName,
        tp_LeafName,
        tp_FieldId,
        tp_CalculatedVersion,
        tp_Level,
        tp_UIVersion,
        tp_Id,
        tp_Ordinal
        )
    SELECT
        @SiteId,
        0x,
        CAST(1 AS bit),
        STUFF(tp_DirName, 1, LEN(@OldUrl), @NewUrl),
        tp_LeafName,
        tp_FieldId,
        0,
        tp_Level,
        1,
        tp_Id,
        tp_Ordinal
    FROM
        UserDataJunctions 
    INNER JOIN @DocList DocList
    ON
        UserDataJunctions.tp_SiteId = @SiteId AND
        UserDataJunctions.tp_DirName= DocList.OldDirName AND
        UserDataJunctions.tp_LeafName = DocList.OldLeafName AND
        UserDataJunctions.tp_Level = DocList.OldLevel
    BEGIN
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
            @SiteId, @cbDelta, 1
    END

GO
