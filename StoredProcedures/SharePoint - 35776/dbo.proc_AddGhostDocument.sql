/****** Object:  StoredProcedure [dbo].[proc_AddGhostDocument]    Script Date: 5/15/2018 12:11:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_AddGhostDocument(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @DocId uniqueidentifier,
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @Level tinyint,
    @UIVersion int,
    @EnableMinorVersions bit,
    @DocSize int,
    @DocFlags int,
    @OnRestore bit = 0,
    @Overwrite bit OUTPUT,
    @UserId int,
    @HasDeleteListItemsRight bit,
    @SetupPathVersion tinyint,
    @SetupPath nvarchar(255),
    @SetupPathUser nvarchar(255),
    @ListId uniqueidentifier = NULL,
    @DoclibRowId int = NULL,
    @fCheckQuotaAndWriteLock bit = 0,
    @DTM datetime = NULL OUTPUT)
AS
    SET NOCOUNT ON
    SELECT @DTM = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    DECLARE @iRet int
    DECLARE @DraftOwnerId int
    IF (@fCheckQuotaAndWriteLock <> 0)
    BEGIN
        DECLARE @quotaOrLockStatus int
        SELECT @quotaOrLockStatus =
            dbo.fn_IsOverQuotaOrWriteLocked(@SiteId)
        IF (@quotaOrLockStatus = 1)
        BEGIN
            RETURN 1816
        END
        ELSE IF (@quotaOrLockStatus > 1)
        BEGIN
            RETURN 212
        END
    END
    DECLARE @DocParentId uniqueidentifier
    DECLARE @ScopeId uniqueidentifier
    DECLARE @guidT uniqueidentifier
    EXEC @iRet = proc_CanonicalDirNameFromUserInput
        @SiteId,
        @WebId,
        @DocDirName OUTPUT,
        @DocParentId OUTPUT,
        @ScopeId OUTPUT
    IF 0 <> @iRet
    BEGIN
        RETURN @iRet
    END
    BEGIN TRAN
    IF @ListId IS NOT NULL
    BEGIN
        SELECT
            @guidT = tp_Id
        FROM
            Lists WITH(UPDLOCK)
        WHERE
            tp_WebId = @WebId AND
            tp_Id = @ListId
    END
    IF (@Overwrite = 1)
    BEGIN
        SET @Overwrite = 0
        IF EXISTS (
            SELECT
                *
            FROM 
                Docs
            WHERE
                SiteId = @SiteId AND
                DirName = @DocDirName AND
                LeafName = @DocLeafName)
        BEGIN
            IF (@HasDeleteListItemsRight = 1)
            BEGIN
                DECLARE @fullName nvarchar(260)
                SET @fullName = CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END
                EXEC @iRet = proc_DeleteUrl
                    @SiteId,
                    @WebId,
                    @fullName,
                    @UserId
                IF @iRet <> 0
                    GOTO cleanup
                SET @Overwrite = 1
            END
            ELSE
            BEGIN
                SET @iRet = 5
                GOTO cleanup
            END
        END
    END
    ELSE IF EXISTS (
            SELECT
                *
            FROM 
                Docs WITH (NOLOCK)
            WHERE
                SiteId = @SiteId AND
                DirName = @DocDirName AND
                LeafName = @DocLeafName)
    BEGIN
        SET @iRet = 80
        GOTO cleanup
    END
    IF @Level = 2
        SET @DraftOwnerId = @UserId
    ELSE
        SET @DraftOwnerId = NULL
    IF @Level = 255
        SET @DocFlags = @DocFlags | 32
    INSERT INTO AllDocs(
        Id,
        ParentId,
        SiteId,
        DirName,
        LeafName,
        Level,
        WebId,
        ListId,
        DoclibRowId,
        Type,
        Size,
        Version,
        UIVersion,
        Dirty,
        DocFlags,
        TimeCreated,
        TimeLastModified,
        MetaInfoTimeLastModified,
        TimeLastWritten,
        SetupPathVersion,
        SetupPath,
        SetupPathUser,
        ScopeId,
        DraftOwnerId,
        CheckoutUserId,
        CheckoutDate,
        CheckoutExpires
        )
    VALUES(
        @DocId,
        @DocParentId,
        @SiteId,
        @DocDirName,
        @DocLeafName,
        @Level,
        @WebId,
        @ListId,
        @DoclibRowId,
        0,
        @DocSize,
        1,
        @UIVersion,
        0,
        @DocFlags,
        @DTM,
        @DTM,
        @DTM,
        @DTM,
        @SetupPathVersion,
        @SetupPath,
        @SetupPathUser,
        @ScopeId,
        @DraftOwnerId,
        CASE WHEN @Level = 255 THEN @UserId ELSE NULL END,
        CASE WHEN @Level = 255 THEN @DTM ELSE NULL END,
        NULL)
    IF (@@ROWCOUNT = 0 OR @@ERROR <> 0)
    BEGIN
        SET @iRet = 80
        GOTO cleanup
    END
    EXEC proc_UpdateChildCount @SiteId, @DocDirName, @DocLeafName,
                               @DoclibRowId, @Level, 0, 1
    DECLARE @FullUrl nvarchar(260)
    DECLARE @TimeLastModifiedLog datetime
    IF (@OnRestore = 1)
    BEGIN
        SET @TimeLastModifiedLog = NULL
    END
    ELSE
    BEGIN
        SET @TimeLastModifiedLog = @DTM
    END
    SET @FullUrl = CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END
    EXEC proc_LogChange @SiteId, @WebId, NULL, NULL, @DocId, NULL,
        NULL, @FullUrl,
        4096, 16, @TimeLastModifiedLog
    IF (@OnRestore = 1)
    BEGIN
        EXEC proc_LogChange @SiteId, @WebId, NULL, NULL, @DocId, NULL,
            NULL, @FullUrl,
            1048576, 16, @TimeLastModifiedLog
    END        
    DECLARE @cbSize int
    SET @cbSize = @DocSize + 152
    IF @ListId IS NULL OR @DocLibRowId IS NULL
        EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @cbSize, 1
cleanup:
    IF (@iRet <> 0 AND @@TRANCOUNT = 1) ROLLBACK TRAN ELSE COMMIT TRAN
    RETURN @iRet

GO
