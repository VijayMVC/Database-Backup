/****** Object:  StoredProcedure [dbo].[proc_UpdateVirusInfo]    Script Date: 5/15/2018 12:12:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_UpdateVirusInfo(
    @DocSiteId uniqueidentifier,
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @DocVersion int,
    @VirusVendorID int,
    @VirusStatus int,
    @VirusInfo nvarchar(255),
    @DocContent image,
    @DocSize int,
    @ChunkSize int,
    @DocTextptr varbinary(16) OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @DocParentId uniqueidentifier
    DECLARE @DocLevel tinyint
    SET @DocLevel = 1
    IF @DocContent IS NULL
    BEGIN
        UPDATE
            Docs
        SET
            VirusVendorID = CASE WHEN @VirusVendorID IS NULL
                THEN VirusVendorID ELSE @VirusVendorID END,
            VirusStatus = @VirusStatus,
            VirusInfo = @VirusInfo
        WHERE
            SiteId = @DocSiteId AND
            DirName = @DocDirName AND
            LeafName = @DocLeafName AND
            Version = @DocVersion AND
            Level = @DocLevel
        RETURN CASE WHEN @@RowCount <> 1 THEN 3 ELSE 0 END
    END
    DECLARE @DocId uniqueidentifier
    DECLARE @cbDelta int
    SELECT
        @DocId = Id,
        @cbDelta = Size - @DocSize,
        @DocParentId = ParentId
    FROM
        Docs
    WHERE
        SiteId = @DocSiteId AND
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        Version = @DocVersion AND
        Level = @DocLevel
    IF @@RowCount = 1
    BEGIN
        UPDATE
            Docs
        SET
            Size = @DocSize,
            TimeLastWritten = dbo.fn_RoundDateToNearestSecond(GETUTCDATE()),
            Version = Version +  1,
            VirusVendorID = CASE WHEN @VirusVendorID IS NULL
                THEN VirusVendorID ELSE @VirusVendorID END,
            VirusStatus = @VirusStatus,
            VirusInfo = @VirusInfo,
            DocFlags = DocFlags | 64
        WHERE
            SiteId = @DocSiteId AND
            DirName = @DocDirName AND
            LeafName = @DocLeafName AND
            Version = @DocVersion AND
            Level = @DocLevel
    END
    IF @@RowCount <> 1
    BEGIN
        RETURN 3
    END
    UPDATE
        DocStreams
    SET
        DocStreams.Size = @DocSize,
        DocStreams.Content = @DocContent
    FROM
        Docs 
    INNER JOIN 
        DocStreams
    ON
        Docs.SiteId = DocStreams.SiteId AND
        Docs.ParentId = DocStreams.ParentId AND
        Docs.Id = DocStreams.Id AND
        Docs.Level = DocStreams.Level
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.ParentId = @DocParentId AND
        Docs.LeafName = @DocLeafName AND
        Docs.Version = @DocVersion + 1
    IF @@RowCount <> 1
    BEGIN
        RETURN 3
    END
    BEGIN
        IF @DocSize > @ChunkSize
        BEGIN
            SELECT @DocTextptr = TEXTPTR(Content)
            FROM
                AllDocStreams WITH (UPDLOCK)
            WHERE
                SiteId = @DocSiteId AND
                DeleteTransactionId = 0x AND
                ParentId = @DocParentId AND
                Id = @DocId AND
                Level = @DocLevel
        END       
    END
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp
        @DocSiteId, @cbDelta, 1
    RETURN 0

GO
