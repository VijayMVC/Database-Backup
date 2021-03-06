/****** Object:  StoredProcedure [dbo].[proc_RestoreFixupImageInternal]    Script Date: 5/15/2018 12:12:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RestoreFixupImageInternal(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @DeleteTransactionId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128)
    )
AS
    DECLARE @Ret int
    SET @Ret = 1359
    DECLARE @DirDirName nvarchar(256)
    DECLARE @DirLeafName nvarchar(128)
    EXEC proc_SplitUrl
        @DirName,
        @DirDirName OUTPUT,
        @DirLeafName OUTPUT
    DECLARE @ScopeId uniqueidentifier
    SELECT
        @ScopeId = ScopeId
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        DirName = @DirDirName AND
        LeafName = @DirLeafName
    IF @@ROWCOUNT = 0
    BEGIN
        SET @Ret = 1359
        GOTO cleanup
    END
    DECLARE @ThumbnailDirName nvarchar(256)
    DECLARE @WebImageDirName nvarchar(256)
    DECLARE @SubImageLeafName nvarchar(128)
    DECLARE @Url nvarchar(260)
    SET @Url = CASE WHEN (DATALENGTH(@DirName) = 0) THEN @LeafName WHEN (DATALENGTH(@LeafName) = 0) THEN @DirName ELSE @DirName + N'/' + @LeafName END
    EXEC proc_GetSubImageUrls
        @Url,
        @ThumbnailDirName OUTPUT,
        @WebImageDirName OUTPUT,
        @SubImageLeafName OUTPUT
    EXEC @Ret = proc_RestoreFixupThumbnailInternal
        @SiteId,
        @WebId,
        @DeleteTransactionId,
        @DirName,
        @ThumbnailDirName,
        @SubImageLeafName,
        @ScopeId
    IF @Ret <> 0
        GOTO cleanup
    EXEC @Ret = proc_RestoreFixupThumbnailInternal
        @SiteId,
        @WebId,
        @DeleteTransactionId,
        @DirName,
        @WebImageDirName,
        @SubImageLeafName,
        @ScopeId
    IF @Ret <> 0
        GOTO cleanup
    SET @Ret = 0
cleanup:
    RETURN @Ret

GO
