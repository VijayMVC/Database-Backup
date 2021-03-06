/****** Object:  StoredProcedure [dbo].[proc_RestoreFixupThumbnailInternal]    Script Date: 5/15/2018 12:12:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RestoreFixupThumbnailInternal(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @DeleteTransactionId uniqueidentifier,
    @DirName nvarchar(256),
    @ThumbnailDirName nvarchar(256),
    @SubImageLeafName nvarchar(128),
    @ThumbnailFolderScopeId uniqueidentifier
    )
AS
    DECLARE @Ret int
    SET @Ret = 1359
    DECLARE @OldParentId uniqueidentifier
    SELECT
        @OldParentId = ParentId
    FROM
        AllDocs
    WHERE
        SiteId = @SiteId AND
        DeleteTransactionId = @DeleteTransactionId AND
        DirName = @ThumbnailDirName AND
        LeafName = @SubImageLeafName
    IF @@ROWCOUNT = 0
    BEGIN
        SET @Ret = 0
        GOTO cleanup
    END    
    DECLARE @ThumbnailDirLeafName nvarchar(128)
    EXEC proc_SplitUrl
        @ThumbnailDirName,
        NULL,
        @ThumbnailDirLeafName OUTPUT
    IF EXISTS(
        SELECT
            *
        FROM
            AllDocs
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId AND
            DirName = @DirName AND
            LeafName = @ThumbnailDirLeafName)
    BEGIN
        SET @Ret = 0
        GOTO cleanup
    END
    DECLARE @ThumbnailFolderDocId uniqueidentifier
    SELECT
        @ThumbnailFolderDocId = Id
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirName AND
        LeafName = @ThumbnailDirLeafName
    IF @ThumbnailFolderDocId IS NULL
    BEGIN
        EXEC @Ret = proc_CreateDir
            @SiteId,
            @WebId,
            @DirName,
            @ThumbnailDirLeafName,
            1, 
            0,       
            0, 
            0,       
            NULL,    
            @ThumbnailFolderDocId OUTPUT,
            @ThumbnailFolderScopeId,
            NULL
        IF @Ret <> 0 
            GOTO cleanup
    END
    IF @OldParentId <> @ThumbnailFolderDocId
    BEGIN
        UPDATE
            AllDocs
        SET
            ParentId = @ThumbnailFolderDocId
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId AND
            DirName = @ThumbnailDirName
        UPDATE
            AllDocStreams
        SET
            ParentId = @ThumbnailFolderDocId
        WHERE
            SiteId = @SiteId AND
            DeleteTransactionId = @DeleteTransactionId AND
            ParentId = @OldParentId
    END
    SET @Ret = 0
cleanup:
    RETURN @Ret

GO
