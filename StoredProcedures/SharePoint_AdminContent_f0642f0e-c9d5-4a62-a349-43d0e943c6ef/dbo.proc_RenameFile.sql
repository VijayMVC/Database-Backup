/****** Object:  StoredProcedure [dbo].[proc_RenameFile]    Script Date: 5/15/2018 12:12:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RenameFile(
    @SiteId                uniqueidentifier,
    @SubWebId              uniqueidentifier,
    @SubWebUrl             nvarchar(256),
    @OldUrl                nvarchar(260),
    @NewUrl                nvarchar(260),
    @NewDocParentId        uniqueidentifier,
    @UserId                int,
    @RenameFlags           int = 0,
    @PutFlags              int = 0,
    @ReturnFlags           int = 0,
    @AttachmentOpOldUrl    int = 3,
    @AttachmentOpNewUrl    int = 3,
    @ParseDocsNow          bit OUTPUT,
    @FailedDirName         nvarchar(256) OUTPUT,
    @FailedLeafName        nvarchar(128) OUTPUT
    )
AS
    SET NOCOUNT ON
    DECLARE @CtoMask int
    SET @CtoMask = ~0
    DECLARE @OldUrlDirName nvarchar(256)
    DECLARE @NewUrlDirName nvarchar(256)
    DECLARE @OldUrlLeafName nvarchar(128)
    DECLARE @NewUrlLeafName nvarchar(128)
    DECLARE @OldUrlBaseName nvarchar(128)
    DECLARE @OldUrlExtension nvarchar(128)
    DECLARE @NewUrlBaseName nvarchar(128)
    DECLARE @NewUrlExtension nvarchar(128)
    DECLARE @HasThumbnailFolder bit
    DECLARE @OldThumbnailDirName nvarchar(260)
    DECLARE @OldWebImageDirName nvarchar(260)
    DECLARE @NewThumbnailDirName nvarchar(260)
    DECLARE @NewWebImageDirName nvarchar(260)
    DECLARE @OldThumbnailFullUrl nvarchar(260)
    DECLARE @OldWebImageFullUrl nvarchar(260)
    DECLARE @NewThumbnailFullUrl nvarchar(260)
    DECLARE @NewWebImageFullUrl nvarchar(260)
    DECLARE @OldSubImgLeafName nvarchar(128)
    DECLARE @NewSubImgLeafName nvarchar(128)
    DECLARE @OldListId uniqueidentifier
    DECLARE @OldBaseType int
    DECLARE @OldDoclibRowId int
    DECLARE @OldDoclibExcludedType int
    DECLARE @OldDocParentId uniqueidentifier
    DECLARE @NewListId uniqueidentifier
    DECLARE @NewBaseType int
    DECLARE @NewDoclibRowId int
    DECLARE @NewDoclibExcludedType int
    DECLARE @IsDTParents bit
    DECLARE @LTCheckoutUserId int
    DECLARE @MaxNewListRowOrd int
    DECLARE @DocId uniqueidentifier
    DECLARE @SrcWebId uniqueidentifier
    DECLARE @DstWebId uniqueidentifier
    DECLARE @WebScope uniqueidentifier
    DECLARE @bRemoveFGP bit
    DECLARE @SrcScopeId uniqueidentifier
    DECLARE @DestScopeId uniqueidentifier
    DECLARE @bWasUnique bit
    DECLARE @bResetDestFGP bit
    SET @bRemoveFGP = 0
    SET @bResetDestFGP = 0
    SELECT 
        @WebScope = ScopeId
    FROM 
        Webs
    WHERE
        SiteId = @SiteId AND
        Id = @SubWebId
    SET @OldDoclibExcludedType = 0x00
    SET @NewDoclibExcludedType = 0x00
    DECLARE @RetVal int
    SET @RetVal = 0
    DECLARE @Now datetime
    SELECT @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE());
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
    EXEC @RetVal = proc_ValidateRenameFile @SiteId, @SubWebId,
        @SubWebUrl, @OldUrl, @NewUrl, @UserId,
        @OldListId OUTPUT,
        @OldBaseType OUTPUT, @OldDoclibExcludedType OUTPUT,
        @NewListId OUTPUT, @NewBaseType OUTPUT,
        @NewDoclibExcludedType OUTPUT, @FailedDirName OUTPUT,
        @FailedLeafName OUTPUT
    IF @RetVal <> 0
    BEGIN
        RETURN @RetVal
    END
    IF (@NewListId IS NULL)
    BEGIN
        SET @bRemoveFGP = 1
    END
    SELECT
        @SrcScopeId  = ScopeId,
        @SrcWebId = WebId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        WebId = @SubWebId AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName
    IF @SrcWebId <> @SubWebId
    BEGIN
        RETURN 53
    END
    IF EXISTS (
        SELECT
            *
        FROM
            Perms
        WHERE
            SiteId = @SiteId AND
            ScopeId = @SrcScopeId AND
            WebId = @SubWebId AND
            ScopeUrl = @OldUrl)
    BEGIN
        SET @bWasUnique = 1
    END
    ELSE
    BEGIN
        SET @bWasUnique = 0
    END
    SELECT TOP 1
        @DocId = Docs.Id,
        @OldDoclibRowId = Docs.DoclibRowId,
        @IsDTParents = CASE WHEN ((DocFlags & 1024) = 1024)
        THEN 1
        ELSE 0
        END,
        @LTCheckoutUserId = Docs.LTCheckoutUserId,
        @OldDocParentId = Docs.ParentId
    FROM
        Docs WITH (UPDLOCK)
    WHERE
        SiteId = @SiteId AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName AND
        WebId = @SubWebId AND
        Type = 0
    IF (@@ROWCOUNT <> 1) OR (@LTCheckoutUserId is NOT NULL AND @LTCheckoutUserId <> @UserId)
    BEGIN
        RETURN 1150
    END
    DECLARE @LevelList table
        (Level tinyint DEFAULT 1 NOT NULL,
         CheckoutUserId int,
         DraftOwnerId int,
         TimeLastModified datetime,          
         PRIMARY KEY CLUSTERED (Level)
        )
    INSERT INTO @LevelList
    SELECT
        Docs.Level,
        Docs.LTCheckoutUserId,
        Docs.DraftOwnerId,
        CASE
            WHEN
                Docs.TimeLastModified IS NULL
            THEN
                NULL
            WHEN 
                Docs.IsCurrentVersion = 0 
            THEN
                Docs.TimeLastModified
            ELSE
                @Now
            END
    FROM                         
        Docs WITH (UPDLOCK)
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @OldUrlDirName AND
        Docs.LeafName = @OldUrlLeafName AND
        WebId = @SubWebId AND
        Type = 0 
    SET @NewDoclibRowId = @OldDoclibRowId
    IF (@ReturnFlags & 0x01) = 0x01
    BEGIN
        SELECT
            @OldUrlDirName, @OldUrlLeafName,
            @NewUrlDirName, @NewUrlLeafName, 0
    END
    IF @OldUrlExtension <> @NewUrlExtension
    BEGIN
        SET @CtoMask = @CtoMask &
            ~(0 | 4 | 8)
        IF @RenameFlags & 64 =
            64
        BEGIN
            SET @CtoMask = @CtoMask | 4
        END
        IF @RenameFlags & 128 =
            128
        BEGIN
            SET @CtoMask = @CtoMask | 8
        END
        SET @ParseDocsNow = 1 
    END
    DECLARE @DepList table (DocUrl nvarchar(260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL, Level tinyint DEFAULT 1 NOT NULL, DirName AS ISNULL(CASE WHEN (CHARINDEX(N'/', REVERSE(DocUrl)) > 0) THEN LEFT(DocUrl, DATALENGTH(DocUrl)/2 - CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN)) ELSE N'' END, N''), LeafName AS ISNULL(CASE WHEN (CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN) > 0) THEN RIGHT(DocUrl, CHARINDEX(N'/', REVERSE(DocUrl) COLLATE Latin1_General_BIN) - 1) ELSE DocUrl END, DocUrl), UNIQUE (DocUrl,Level))
    INSERT INTO @DepList              
    SELECT DISTINCT
        CASE WHEN (DATALENGTH(Links.DirName) = 0) THEN Links.LeafName WHEN (DATALENGTH(Links.LeafName) = 0) THEN Links.DirName ELSE Links.DirName + N'/' + Links.LeafName END,Links.Level
    FROM
        Links INNER JOIN Docs WITH(XLOCK)
    ON
        Docs.SiteId = Links.SiteId AND
        Docs.DirName = Links.TargetDirName AND
        Docs.LeafName = Links.TargetLeafName AND
        Docs.WebId = @SubWebId
    WHERE
        Links.SiteId = @SiteId AND
        Links.TargetDirName = @OldUrlDirName AND
        (Links.TargetLeafName = @OldUrlLeafName OR
        Links.PointsToDir = 1) AND
        NOT (Links.SiteId = @SiteId AND
            Links.DirName = @OldUrlDirName AND
            Links.LeafName = @OldUrlLeafName)
    EXEC @RetVal =
        proc_DirtyListData @SiteId, @OldUrlDirName, @OldUrlLeafName, 0
    IF @RetVal <> 0
    BEGIN
        RETURN @RetVal
    END
    IF (@RenameFlags & 4 = 4)
    BEGIN
        UPDATE
            Links
        SET
            TargetDirName = LEFT(@NewUrlDirName, 256),
            TargetLeafName = @NewUrlLeafName
        WHERE
            SiteId = @SiteId AND
            TargetDirName = @OldUrlDirName AND
            TargetLeafName = @OldUrlLeafName AND
            PointsToDir = 0
        IF (@@ERROR <> 0 )
        BEGIN
            RETURN 1150
        END
        UPDATE
            Docs
        SET
            Docs.Dirty = CASE
                WHEN
                    Docs.DocFlags & 4 =
                        4
                THEN
                    1
                ELSE
                    Docs.Dirty
                END,
            Docs.TimeLastModified = CASE
                WHEN
                    Docs.TimeLastModified IS NULL
                THEN
                    Docs.TimeLastModified
                ELSE
                    @Now
                END,
            Docs.NextToLastTimeModified = Docs.TimeLastModified,
            Docs.MetaInfoTimeLastModified = CASE
                WHEN
                    Docs.MetaInfoTimeLastModified IS NULL
                THEN
                    Docs.MetaInfoTimeLastModified
                ELSE
                    @Now
                END,
            Docs.CacheParseId = NULL,
            Docs.Version = CASE
                WHEN
                    Docs.Version IS NULL
                THEN
                    Docs.Version
                ELSE
                    Docs.Version + 1
                END
        FROM
            Links WITH(NOLOCK) INNER JOIN Docs
        ON
            Docs.SiteId = Links.SiteId AND
            Docs.DirName = Links.DirName AND
            Docs.LeafName = Links.LeafName
        WHERE
            Links.SiteId = @SiteId AND
            Links.TargetDirName = @NewUrlDirName AND
            Links.TargetLeafName = @NewUrlLeafName AND
            Links.Type <> 86 
        IF (@@ERROR <> 0 )
        BEGIN
            RETURN 1150
        END
        UPDATE
            Webs
        SET
            Webs.MetaInfoVersion = Webs.MetaInfoVersion + 1,
            Webs.MasterUrl = CASE WHEN (DATALENGTH(@NewUrlDirName) = 0) THEN @NewUrlLeafName WHEN (DATALENGTH(@NewUrlLeafName) = 0) THEN @NewUrlDirName ELSE @NewUrlDirName + N'/' + @NewUrlLeafName END,
            Webs.LastMetaDataChange = @Now
        FROM
            Webs
        WHERE
            Webs.SiteId = @SiteId AND
            Webs.MasterUrl = @OldUrl
        IF (@@ERROR <> 0 )
        BEGIN
            RETURN 1150
        END
        UPDATE
            Webs
        SET
            Webs.MetaInfoVersion = Webs.MetaInfoVersion + 1,
            Webs.CustomMasterUrl = CASE WHEN (DATALENGTH(@NewUrlDirName) = 0) THEN @NewUrlLeafName WHEN (DATALENGTH(@NewUrlLeafName) = 0) THEN @NewUrlDirName ELSE @NewUrlDirName + N'/' + @NewUrlLeafName END,
            Webs.LastMetaDataChange = @Now
        FROM
            Webs
        WHERE
            Webs.SiteId = @SiteId AND
            Webs.CustomMasterUrl = @OldUrl
        IF (@@ERROR <> 0 )
        BEGIN
            RETURN 1150
        END
        UPDATE 
            Docs
        SET
            Docs.BuildDependencySet = NULL
        FROM 
            Docs INNER JOIN BuildDependencies
        ON
            BuildDependencies.SiteId = Docs.SiteId AND
            BuildDependencies.LeafName = Docs.LeafName AND
            BuildDependencies.DirName = Docs.DirName
        WHERE 
            BuildDependencies.SiteId = @SiteId AND
            BuildDependencies.TargetDirName = @OldUrlDirName AND
            BuildDependencies.TargetLeafName = @OldUrlLeafName AND
            Docs.BuildDependencySet IS NOT NULL
        IF (@@ERROR <> 0 )
        BEGIN
            RETURN 1150
        END
    END
    IF @OldListId IS NOT NULL OR @NewListId IS NOT NULL
    BEGIN
        IF (@OldListId IS NOT NULL AND @NewListId IS NOT NULL AND
            @OldListId = @NewListId AND @OldDoclibRowId IS NOT NULL)
        BEGIN
            UPDATE
                UserDataVersioned
            SET               
                tp_Modified = CASE WHEN tp_IsCurrentVersion = 1 AND @NewUrlLeafName <> @OldUrlLeafName
                    THEN @Now
                    ELSE
                    tp_Modified
                    END,
                tp_Editor = CASE WHEN tp_IsCurrentVersion = 1 AND @NewUrlLeafName <> @OldUrlLeafName
                    THEN @UserId
                    ELSE
                    tp_Editor
                    END,
                tp_DirName = @NewUrlDirName,
                tp_LeafName = @NewUrlLeafName
            WHERE
                tp_ListID = @OldListId AND
                tp_Id = @OldDoclibRowId
            IF (@@ROWCOUNT = 0 )
                RETURN 87
            EXEC proc_UpdateItemInNameValuePair
                @SiteId, NULL, @OldListId, @OldDoclibRowId, NULL,
                '{d31655d1-1d5b-4511-95a1-7a09e9b75bf2}', @UserId,
                '{28cf69c5-fa48-462a-b5cd-27b6f9d2bd5f}', @Now,
                NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
                NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
                NULL,
                1
            UPDATE
                Lists
            SET
                tp_Modified = @Now
            WHERE
                tp_WebID = @SubWebId AND
                tp_ID = @OldListId
            IF @@ROWCOUNT <> 1
                RETURN 87
        END
        ELSE
        BEGIN
            IF @OldListId IS NOT NULL AND
                @OldBaseType = 1 AND
                (@NewListId IS NULL OR
                (@NewBaseType IS NULL OR
                    @NewBaseType <> 1) AND
                    @OldDoclibRowId IS NOT NULL)
            BEGIN
                EXEC proc_DeleteFromNVP @SiteId, @OldListId, @OldDoclibRowId
                DELETE FROM
                    UserDataVersioned
                WHERE
                    tp_ListId = @OldListId AND
                    tp_Id = @OldDoclibRowId
                IF (@@ROWCOUNT = 0)
                    RETURN 87
                UPDATE
                    Lists
                SET
                    tp_ItemCount = tp_ItemCount - 1,
                    tp_LastDeleted = @Now,                                      
                    tp_Modified = @Now
                WHERE
                    tp_WebID = @SubWebId AND
                    tp_ID = @OldListId
                IF @IsDTParents = 1
                BEGIN
                    EXEC proc_DTClearRelationshipFromParent @SiteId, @OldUrlDirName, @OldUrlLeafName
                END
                EXEC proc_DTClearRelationshipFromChild @SiteId, @OldUrlDirName, @OldUrlLeafName
                SET @NewDoclibRowId = NULL
            END
            IF (@OldListId IS NULL OR
                @OldBaseType <> 1) AND
                @NewListId IS NOT NULL AND
                @NewBaseType = 1
            BEGIN
                SET @ParseDocsNow = 1
                EXEC @NewDoclibRowId =
                    proc_GenerateNextId @SubWebId, @NewListId
                INSERT INTO AllUserData(
                    tp_ID,
                    tp_ListId,
                    tp_SiteId,
                    tp_DirName,
                    tp_LeafName,
                    tp_RowOrdinal,
                    tp_Version,
                    tp_Author,
                    tp_Editor,
                    tp_Created,
                    tp_Modified,
                    tp_Ordering,
                    tp_ItemOrder,
                    tp_InstanceID,
                    tp_Size,
                    tp_Level,
                    tp_CheckoutUserId,
                    tp_DraftOwnerId)
               SELECT
                    @NewDoclibRowId,
                    @NewListId,
                    @SiteId,
                    @NewUrlDirName,
                    @NewUrlLeafName,
                    0,
                    0,
                    @UserID,
                    @UserID,
                    @Now,
                    @Now,
                    NULL,
                    NULL,
                    NULL,
                    0,
                    Level,
                    CheckoutUserId,
                    DraftOwnerId
                FROM
                    @LevelList
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
                            tp_ListId,
                            tp_SiteId,
                            tp_DirName,
                            tp_LeafName,
                            tp_RowOrdinal,
                            tp_Version,
                            tp_Author,
                            tp_Editor,
                            tp_Created,
                            tp_Modified,
                            tp_Ordering,
                            tp_ItemOrder,
                            tp_InstanceID,
                            tp_Size,
                            tp_Level,
                            tp_CheckoutUserId,
                            tp_DraftOwnerId)
                        SELECT
                            @NewDoclibRowId,
                            @NewListId,
                            @SiteId,
                            @NewUrlDirName,
                            @NewUrlLeafName,
                            @rowOrdCount,
                            0,
                            @UserID,
                            @UserID,
                            @Now,
                            @Now,
                            NULL,
                            NULL,
                            NULL,
                            0,
                            Level,
                            CheckoutUserId,
                            DraftOwnerId
                        FROM
                            @LevelList
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
                @NewListId IS NOT NULL AND
                @NewBaseType = 1 AND
                @OldListId <> @NewListId AND
                @OldDoclibRowId IS NOT NULL)
            BEGIN
                SET @ParseDocsNow = 1
                SET @bResetDestFGP = 1
                EXEC @NewDoclibRowId =
                    proc_GenerateNextId @SubWebId, @NewListId
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
                    tp_Created,
                    tp_Modified,
                    tp_Ordering,
                    tp_ItemOrder,
                    tp_InstanceID,
                    tp_Size,
                    tp_Level,
                    tp_ModerationStatus,
                    tp_UIVersion,
                    tp_IsCurrentVersion,
                    tp_IsCurrent,
                    tp_CalculatedVersion,
                    tp_CheckoutUserId,
                    tp_DraftOwnerId
                    )
                SELECT 
                    @NewDoclibRowId,
                    @NewListId,
                    @SiteId,
                    @NewUrlDirName,
                    @NewUrlLeafName,
                    0,
                    0,
                    tp_Author,
                    @UserID,
                    tp_Created,
                    CASE WHEN tp_IsCurrentVersion = 1
                    THEN @Now
                    ELSE
                    tp_Modified
                    END,
                    NULL,
                    NULL,
                    NULL,
                    0,
                    tp_Level,
                    tp_ModerationStatus,
                    tp_UIVersion,
                    tp_IsCurrentVersion,
                    tp_IsCurrent,
                    tp_CalculatedVersion,
                    tp_CheckoutUserId,
                    tp_DraftOwnerId
                FROM
                    UserDataVersioned
                WHERE
                    tp_ListId = @OldListId AND
                    tp_ID = @OldDoclibRowId AND
                    tp_RowOrdinal = 0
                IF (@@ROWCOUNT = 0)
                    RETURN 87
                UPDATE
                    ImmedSubscriptions
                SET
                    ListId = @NewListId,
                    ItemId = @NewDoclibRowId
                WHERE
                    SiteId = @SiteId AND
                    ListId = @OldListId AND
                    ItemId = @OldDoclibRowId
                UPDATE
                    SchedSubscriptions
                SET
                    ListId = @NewListId,
                    ItemId = @NewDoclibRowId
                WHERE
                    ListId = @OldListId AND
                    ItemId = @OldDoclibRowId
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
                            tp_Created,
                            tp_Modified,
                            tp_Ordering,
                            tp_ItemOrder,
                            tp_InstanceID,
                            tp_Size,
                            tp_Level,
                            tp_ModerationStatus,
                            tp_UIVersion,
                            tp_IsCurrentVersion,
                            tp_IsCurrent,
                            tp_CalculatedVersion,
                            tp_CheckoutUserId,
                            tp_DraftOwnerId)
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
                            tp_Created,
                            tp_Modified,
                            tp_Ordering,
                            tp_ItemOrder,
                            tp_InstanceID,
                            tp_Size,
                            tp_Level,
                            tp_ModerationStatus,
                            tp_UIVersion,
                            tp_IsCurrentVersion,
                            tp_IsCurrent,
                            tp_CalculatedVersion,
                            tp_CheckoutUserId,
                            tp_DraftOwnerId
                        FROM
                            UserDataVersioned
                        WHERE
                            tp_ListId = @NewListId AND
                            tp_ID = @NewDoclibRowId AND
                            tp_RowOrdinal = 0
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
                EXEC proc_DeleteFromNVP @SiteId, @OldListId, @OldDoclibRowId
                DELETE FROM
                    UserDataVersioned
                WHERE
                    tp_ListId = @OldListId AND
                    tp_Id = @OldDoclibRowId
                IF (@@ROWCOUNT = 0)
                    RETURN 87
                IF @IsDTParents = 1
                BEGIN
                    EXEC proc_DTClearRelationshipFromParent @SiteId, @OldUrlDirName, @OldUrlLeafName
                END
                EXEC proc_DTClearRelationshipFromChild @SiteId, @OldUrlDirName, @OldUrlLeafName
                UPDATE
                    Lists
                SET
                    tp_ItemCount = tp_ItemCount - 1,
                    tp_LastDeleted = @Now,
                    tp_Modified = @Now
                WHERE
                    tp_WebID = @SubWebID AND
                    tp_ID = @OldListID          
            END
        END
    END
    IF (@OldUrlDirName != @NewUrlDirName)
    BEGIN
        DECLARE @tmpDirName nvarchar(256)
        DECLARE @tmpLeafName nvarchar(128)
        EXEC proc_SplitUrl @OldUrlDirName,
            @tmpDirName OUTPUT, @tmpLeafName OUTPUT
        UPDATE
            Docs
        SET
            NextToLastTimeModified = TimeLastModified,
            TimeLastModified = @Now
        WHERE
            SiteId = @SiteId AND
            DirName = @tmpDirName AND
            LeafName = @tmpLeafName AND
            WebId = @SubWebId
        IF @IsDTParents = 1
        BEGIN
            EXEC proc_DTClearRelationshipFromParent @SiteId, @OldUrlDirName, @OldUrlLeafName
        END
        EXEC proc_DTClearRelationshipFromChild @SiteId, @OldUrlDirName, @OldUrlLeafName
    END
    ELSE
    BEGIN
        IF @IsDTParents = 1 
        BEGIN
            EXEC proc_DTRenameFile @SiteId, @OldUrl, @NewUrl, @NewUrlDirName, @NewUrlLeafName
        END
    END
    UPDATE
        Docs
    SET
        DirName = @NewUrlDirName,
        LeafName = @NewUrlLeafName,
        ParentId = @NewDocParentId,
        NextToLastTimeModified = TimeLastModified,
        TimeLastModified = CASE WHEN IsCurrentVersion = 1 THEN @Now ELSE TimeLastModified END,
        MetaInfoTimeLastModified = @Now,
        ListId = @NewListId,
        DoclibRowId = @NewDoclibRowId,
        DocFlags = DocFlags & @CtoMask,              
        ThicketFlag = CASE
            WHEN ThicketFlag IS NOT NULL AND
                ThicketFlag = 1 AND
                Type = 0 AND
                (@RenameFlags & 2048 =
                    2048)
            THEN 0
            ELSE ThicketFlag
            END,
        Dirty = CASE
            WHEN
                DocFlags & @CtoMask & 4 = 4
            THEN
                1
            WHEN
                Dirty IS NOT NULL
            THEN
                0
            ELSE
                Dirty
            END,
        CacheParseId = NULL,
        Version = CASE
            WHEN
                Version IS NULL
            THEN
                NULL
            ELSE
                Version + 1
            END,                   
        ScopeId = CASE
            WHEN
                @bRemoveFGP = 1
            THEN
                @WebScope
            ELSE
                ScopeId
            END,
        BuildDependencySet = NULL
    WHERE
        SiteID = @SiteID AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName
    IF (@@ERROR <> 0) OR (@@ROWCOUNT = 0)
    BEGIN
        RETURN 1150
    END
    IF @OldDocParentId <> @NewDocParentId
    BEGIN
        UPDATE
            DocStreams
        SET
            ParentId = @NewDocParentId
        WHERE
            SiteID = @SiteID AND
            ParentId = @OldDocParentId AND
            Id = @DocId
        IF (@@ERROR <> 0) OR (@@ROWCOUNT > 3)
        BEGIN
            RETURN 1150
        END
    END
    IF (@OldDoclibRowId IS NOT NULL AND @NewListId IS NOT NULL)
    BEGIN
        IF (@OldListId = @NewListId)
        BEGIN
            EXEC proc_AddEventToCache
                @SiteId,
                @SubWebId, 
                @OldListId,
                @OldDoclibRowId,
                @OldUrlLeafName,
                @NewUrl,
                @DocId,
                32768,
                N'',     
                @Now,
                NULL,
                NULL
        END
        ELSE
        BEGIN
            EXEC proc_LogChange @SiteId, @SubWebId, @OldListId,
                @OldDoclibRowId, @DocId, @NewListId, @NewDoclibRowId, NULL,
                67108864,  1, @Now
            EXEC proc_LogChange @SiteId, @SubWebId, @NewListId,
                @NewDoclibRowId, @DocId, @OldListId, @OldDoclibRowId, NULL,
                65536,  1, @Now
        END
    END
    ELSE
    BEGIN
        IF (@OldUrlDirName = @NewUrlDirName)
        BEGIN
            EXEC proc_LogChange @SiteId, @SubWebId, NULL, NULL, @DocId, NULL,
                NULL, @NewUrl, 32768, 16,
                @Now
        END
        ELSE
        BEGIN
            EXEC proc_LogChange @SiteId, @SubWebId, @OldListId, @OldDoclibRowId, @DocId, NULL,
                NULL, @NewUrl, 67108864, 16, @Now
            EXEC proc_LogChange @SiteId, @SubWebId, @NewListId, @NewDoclibRowId, @DocId, NULL,
                NULL, @NewUrl, 65536, 16, @Now
        END
    END
    DECLARE @DummyFailedUrl nvarchar(260)
    EXEC proc_GetSubImageUrls
        @OldUrl,
        @OldThumbnailDirName OUTPUT,
        @OldWebImageDirName OUTPUT,
        @OldSubImgLeafName OUTPUT
    IF EXISTS (SELECT *
        FROM Docs
        WHERE 
            SiteId = @SiteId AND
            DirName = @OldThumbnailDirName AND
            Type = 0 )
    BEGIN
        EXEC proc_GetSubImageUrls
            @NewUrl,
            @NewThumbnailDirName OUTPUT,
            @NewWebImageDirName OUTPUT,
            @NewSubImgLeafName OUTPUT
        SET @OldThumbnailFullUrl = 
CASE WHEN (DATALENGTH(@OldThumbnailDirName) = 0) THEN @OldSubImgLeafName WHEN (DATALENGTH(@OldSubImgLeafName) = 0) THEN @OldThumbnailDirName ELSE @OldThumbnailDirName + N'/' + @OldSubImgLeafName END
        SET @NewThumbnailFullUrl = 
CASE WHEN (DATALENGTH(@NewThumbnailDirName) = 0) THEN @NewSubImgLeafName WHEN (DATALENGTH(@NewSubImgLeafName) = 0) THEN @NewThumbnailDirName ELSE @NewThumbnailDirName + N'/' + @NewSubImgLeafName END
        SET @OldWebImageFullUrl  = 
CASE WHEN (DATALENGTH(@OldWebImageDirName) = 0) THEN @OldSubImgLeafName WHEN (DATALENGTH(@OldSubImgLeafName) = 0) THEN @OldWebImageDirName ELSE @OldWebImageDirName + N'/' + @OldSubImgLeafName END
        SET @NewWebImageFullUrl  = 
CASE WHEN (DATALENGTH(@NewWebImageDirName) = 0) THEN @NewSubImgLeafName WHEN (DATALENGTH(@NewSubImgLeafName) = 0) THEN @NewWebImageDirName ELSE @NewWebImageDirName + N'/' + @NewSubImgLeafName END
        IF @OldUrlDirName = @NewUrlDirName AND
            @NewBaseType IS NOT NULL AND
            @NewBaseType = 1
        BEGIN
            UPDATE
                Docs
            SET
                DirName = @NewThumbnailDirName,
                LeafName = @NewSubImgLeafName,
                NextToLastTimeModified = TimeLastModified,
                TimeLastModified = @Now,
                Version = Version + 1,
                ScopeId = CASE
                    WHEN
                        @bRemoveFGP = 1
                    THEN
                        @WebScope
                    ELSE
                        ScopeId
                    END
            WHERE
                SiteID = @SiteId AND
                DirName = @OldThumbnailDirName AND
                LeafName = @OldSubImgLeafName
            IF (@@ERROR <> 0)
            BEGIN
                RETURN 1150
            END
            UPDATE
                Docs
            SET
                DirName = @NewWebImageDirName,
                LeafName = @NewSubImgLeafName,
                NextToLastTimeModified = TimeLastModified,
                TimeLastModified = @Now,
                Version = Version + 1
            WHERE
                SiteID = @SiteId AND
                DirName = @OldWebImageDirName AND
                LeafName = @OldSubImgLeafName
            IF (@@ERROR <> 0)
            BEGIN
                RETURN 1150
            END
        END
        ELSE
        BEGIN
            SET @ParseDocsNow = 1
            EXEC @RetVal = proc_DeleteUrl
                @SiteId,
                @SubWebId,
                @OldThumbnailFullUrl,
                @UserId,
                1, 
                0,
                0,
                0,
                3,
                0,
                3,
                0,
                @DummyFailedUrl OUTPUT
            IF (@@ERROR <> 0 OR @RetVal <> 0)
            BEGIN
                RETURN 1150
            END
            EXEC @RetVal = proc_DeleteUrl
                @SiteId,
                @SubWebId,
                @OldWebImageFullUrl,
                @UserId,
                1, 
                0,
                0,
                0,
                3,
                0,
                3,
                0,
                @DummyFailedUrl OUTPUT
            IF (@@ERROR <> 0 OR ((@RetVal <> 0) AND (@RetVal <> 3)))
            BEGIN
                RETURN 1150
            END
        END
    END
    EXEC proc_DirtyDependents @SiteId, 1, @OldUrl
    IF (@bRemoveFGP = 1)
    BEGIN
        DELETE FROM
            Perms
        WHERE
            SiteId = @SiteId AND
            DelTransId = 0x AND
            ScopeUrl = @OldUrl
    END
    ELSE
    BEGIN
        UPDATE
            Perms
        Set
            ScopeUrl = @NewUrl
        WHERE
            SiteId = @SiteId AND
            DelTransId = 0x AND
            ScopeUrl = @OldUrl
    END
    IF @@ROWCOUNT > 1
        RETURN 1358
    IF (@bRemoveFGP = 0 AND @OldUrlDirName != @NewUrlDirName)
    BEGIN
        DECLARE @NewUrlLike nvarchar(1024)
        EXEC proc_EscapeForLike @NewUrl, @NewUrlLike OUTPUT
        EXEC proc_SplitUrl @NewUrlDirName,
            @tmpDirName OUTPUT, @tmpLeafName OUTPUT
        SELECT
            @DestScopeId  = ScopeId
        FROM
            Docs
        WHERE
            SiteId = @SiteId AND
            WebId = @SubWebId AND
            DirName = @tmpDirName AND
            LeafName = @tmpLeafName
        IF (@bWasUnique = 1)
        BEGIN
            EXEC proc_SecFixScope @SiteId, @SubWebId, @SrcScopeId
            IF @bResetDestFGP = 1
                EXEC proc_DirtyListFGPData @SiteId, @SubWebId, @NewListId
        END
        IF (@bWasUnique = 0 AND @SrcScopeId <> @DestScopeId)
        BEGIN
            UPDATE Docs
            SET 
                ScopeId = @DestScopeId
            WHERE 
                SiteId = @SiteId AND
                WebId = @SubWebId AND
                ScopeId = @SrcScopeId AND
                DirName = @NewUrlDirName AND 
                LeafName = @NewUrlLeafName
        END
    END
    DELETE FROM
        BuildDependencies
    WHERE
        SiteId = @SiteId AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    UPDATE
        Links
    SET
        DirName = @NewUrlDirName,
        LeafName = @NewUrlLeafName
    WHERE
        SiteId = @SiteId AND
        DirName = @OldUrlDirName AND
        LeafName = @OldUrlLeafName
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    DECLARE @IterCount int SELECT @IterCount = 0 WHILE @IterCount < 32 BEGIN INSERT INTO @DepList (DocUrl, Level) SELECT DISTINCT Deps.FullUrl,Deps.Level FROM @DepList DepList1 INNER JOIN Deps ON Deps.DepType = 1 AND Deps.DepDesc = DepList1.DocUrl AND DepList1.Level = 1 LEFT OUTER JOIN @DepList DepList2 ON DepList2.DocUrl = Deps.FullUrl WHERE Deps.SiteId = @SiteId AND Deps.DeleteTransactionId = 0x AND DepList2.DocUrl IS NULL IF @@RowCount = 0 BREAK SELECT @IterCount = @IterCount + 1 END IF @IterCount >= 32 BEGIN INSERT INTO @DepList (DocUrl,Level) SELECT DISTINCT FullUrl,Level FROM Deps WHERE DepType = 1 AND SiteId = @SiteId AND DeleteTransactionId = 0x AND FullUrl NOT IN (SELECT DocUrl FROM @DepList) END UPDATE Docs SET Docs.Dirty = 1, Docs.CacheParseId = NULL FROM Docs INNER JOIN @DepList DepList1 ON Docs.SiteId = @SiteId AND Docs.DirName = DepList1.DirName AND Docs.LeafName = DepList1.LeafName AND Docs.Level = DepList1.Level
    EXEC proc_NavStructDirtyNodesByUrl @SiteId, @NewUrlDirName,
        @NewUrlLeafName, NULL, @Now
    IF (@RenameFlags & 4 = 4) AND
        (@ReturnFlags & 0x02) = 0x02
    BEGIN
        SELECT DocUrl FROM @DepList
    END
    UPDATE
        Deps
    SET
        FullUrl = @NewUrl
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = 0x AND
        FullUrl = @OldUrl
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    UPDATE
        Deps
    SET
        DepDesc = @NewUrl
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = 0x AND
        DepDesc = @OldUrl AND
        (DepType = 1 OR DepType = 8)
    IF (@@ERROR <> 0 )
    BEGIN
        RETURN 1150
    END
    EXEC proc_ResyncWelcomeLinks @SiteId, @OldUrlDirName, @OldUrlLeafName,
        NULL
    EXEC proc_ResyncWelcomeLinks @SiteId, @NewUrlDirName, @NewUrlLeafName,
        @OldUrlLeafName
    IF @AttachmentOpNewUrl <> 0
        EXEC proc_UpdateAttachmentsFlag @SiteId, 
            @NewUrlDirName,
            @UserId, 
            @AttachmentOpNewUrl
    IF @OldUrlDirName <> @NewUrlDirName AND  
        @AttachmentOpOldUrl <> 0
            EXEC proc_UpdateAttachmentsFlag @SiteId, 
                @OldUrlDirName,
                @UserId, 
                @AttachmentOpOldUrl
    EXEC proc_RenameFileJunctions 
        @SiteId,
        @OldUrlDirName,
        @OldUrlLeafName,
        @NewUrlDirName,
        @NewUrlLeafName
    EXEC proc_UpdateDiskUsed @SiteId, 1

GO
