/****** Object:  StoredProcedure [dbo].[proc_UndirtyListItem]    Script Date: 5/15/2018 12:13:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROC dbo.proc_UndirtyListItem(
    @SiteId uniqueidentifier,
    @DirName nvarchar(256),
    @LeafName nvarchar(128),
    @Level tinyint,
    @CacheParseId uniqueidentifier,
    @MetaInfo image)
AS
    SET NOCOUNT ON
    DECLARE @RetVal int
    SET @RetVal = 0
    DECLARE @ListId uniqueidentifier
    DECLARE @WebId uniqueidentifier
    DECLARE @RealCacheParseId uniqueidentifier
    DECLARE @OldMetaInfoSize int
    BEGIN TRAN
    SELECT
        @ListId = Docs.ListId,
        @WebId = Docs.WebId
    FROM
        Docs
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND
        Docs.Level = @Level
    IF @WebId IS NULL OR @ListId IS NULL
    BEGIN
        SET @RetVal = 3
        GOTO cleanup
    END
    SELECT
        @RealCacheParseId = Lists.tp_CacheParseId
    FROM
        Lists
    WHERE
        Lists.tp_WebId = @WebId AND
        Lists.tp_ID = @ListId
    IF @RealCacheParseId <> @CacheParseId
    BEGIN
        SET @RetVal = 1150
        GOTO cleanup
    END
    DECLARE @Now datetime
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    UPDATE
        Docs
    SET
        Docs.ListDataDirty = 0,
        Docs.MetaInfo = ISNULL(@MetaInfo, Docs.MetaInfo),
        Docs.MetaInfoTimeLastModified = CASE
            WHEN @MetaInfo IS NULL
            THEN Docs.MetaInfoTimeLastModified
            ELSE @Now
            END,
        Docs.Dirty = CASE
            WHEN @MetaInfo IS NULL OR
                Docs.DocFlags & 4 <> 4 OR
                Docs.HasStream = 0
            THEN Docs.Dirty
            ELSE 1
            END
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DirName AND
        Docs.LeafName = @LeafName AND
        Docs.Level = @Level
cleanup:
    COMMIT TRAN
    RETURN @RetVal

GO
