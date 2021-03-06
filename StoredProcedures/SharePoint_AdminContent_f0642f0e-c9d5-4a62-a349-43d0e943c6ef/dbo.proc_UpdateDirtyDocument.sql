/****** Object:  StoredProcedure [dbo].[proc_UpdateDirtyDocument]    Script Date: 5/15/2018 12:13:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateDirtyDocument(
    @DocSiteId uniqueidentifier,
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @Level tinyint,
    @DocContent image,
    @DocSize int,
    @CacheParseId uniqueidentifier,
    @Dynamic bit,
    @@DocWebId  uniqueidentifier OUTPUT,
    @@DocId uniqueidentifier OUTPUT,
    @@DoclibRowId int OUTPUT,
    @@DocDTW datetime OUTPUT,
    @@DocVersion int OUTPUT,
    @@DocUnghosted bit OUTPUT,
    @ChunkSize int,
    @@DocTextptr varbinary(16) OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @Now datetime
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    DECLARE @cbDelta int
    DECLARE @cbOld int
    DECLARE @Version int
    DECLARE @IsGhost bit
    DECLARE @DocParentId uniqueidentifier
    DECLARE @bChunked bit
    DECLARE @DocFlags int
    DECLARE @DocFlagsUnghosted int
    SET @IsGhost = 0
    SET @cbDelta = 0
    SET @Version = NULL
    DECLARE @DocId uniqueidentifier
    EXEC proc_LockListForDocUpdate @DocSiteId, @DocDirName, @DocLeafName
    SELECT
        @Version = Version,
        @cbOld = Size,
        @IsGhost = CASE WHEN HasStream = 1 THEN 0 ELSE 1 END,
        @DocParentId = ParentId,
        @DocId = Id,
        @DocFlags = DocFlags
    FROM
        Docs WITH (UPDLOCK)
    WHERE
        SiteId = @DocSiteId AND
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        Level = @Level AND
        CacheParseId = @CacheParseId
    IF @IsGhost = 0 OR (@DocFlags & 16384) != 0 AND @DocContent IS NOT NULL
    BEGIN
        SET @cbDelta = @DocSize - @cbOld
    END
    IF @IsGhost = 1 AND (@DocFlags & 16384) != 0  AND @DocContent IS NOT NULL
    BEGIN
        SET @DocFlagsUnghosted = 64
    END
    ELSE
    BEGIN
        SET @DocFlagsUnghosted = 0
    END
    SET @bChunked =
    CASE
        WHEN @DocContent IS NOT NULL AND @DocSize > @ChunkSize THEN 1
        ELSE 0
    END
    UPDATE
        Docs WITH (UPDLOCK)
    SET
        Size = CASE WHEN @DocContent IS NULL OR @IsGhost = 1
            THEN Size ELSE @DocSize END,
        TimeLastWritten = CASE WHEN @DocContent IS NULL
            THEN TimeLastWritten ELSE @Now END,
        Version = Version +  1,
        Dirty = 0,
        CacheParseId = NULL,
        DocFlags = CASE
            WHEN @Dynamic = 1 THEN
                (DocFlags | 1) & ~16384 | @DocFlagsUnghosted
            ELSE
                (DocFlags & ~1) & ~16384 | @DocFlagsUnghosted
            END
    WHERE
        SiteId = @DocSiteId AND
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        CacheParseId = @CacheParseId AND
        (@Version IS NULL OR
            Version = @Version) AND
        Level = @Level
    IF @@ROWCOUNT = 1 AND @DocContent IS NOT NULL AND
        (@IsGhost = 0 OR (@DocFlags & 16384) != 0)
    BEGIN
        IF @IsGhost = 0
        BEGIN
            UPDATE
                DocStreams
            SET
                Content = CASE WHEN @DocContent IS NULL OR @IsGhost = 1
                    THEN Content ELSE @DocContent END,
                Size = CASE WHEN @DocContent IS NULL OR @IsGhost = 1
                    THEN Size ELSE @DocSize END
            WHERE
                SiteId = @DocSiteId AND
                ParentId = @DocParentId AND
                Id = @DocId AND
                Level = @Level
        END
        ELSE IF (@DocFlags & 16384) != 0
        BEGIN
            INSERT INTO AllDocStreams (
                Id,
                Level,
                SiteId,
                ParentId,
                Content,
                Size)
            VALUES (
                @DocId,
                @Level,
                @DocSiteId,
                @DocParentId,
                @DocContent,
                @DocSize)
        END
        IF @@ROWCOUNT = 1
        BEGIN
            EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
                @DocSiteId, @cbDelta, 1
        END
    END
    ELSE
    BEGIN
        IF @bChunked = 1
        BEGIN
            SET @bChunked = 0
        END
    END
    SELECT
        @@DocWebId = Docs.WebId,
        @@DocId = Docs.ID,
        @@DoclibRowId = Docs.DoclibRowId,
        @@DocDTW = Docs.TimeLastWritten,
        @@DocVersion = Docs.Version,
        @@DocUnghosted = CASE
            WHEN @IsGhost = 0 OR Docs.HasStream = 0 THEN 0
            ELSE 1
            END,
        @@DocTextptr =
            CASE
                WHEN @bChunked = 1 THEN TEXTPTR(AllDocStreams.Content)
                ELSE NULL
            END
    FROM
        Docs WITH (UPDLOCK) 
    LEFT OUTER JOIN 
        AllDocStreams WITH (UPDLOCK)
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
        Docs.Level = @Level
    RETURN 0

GO
