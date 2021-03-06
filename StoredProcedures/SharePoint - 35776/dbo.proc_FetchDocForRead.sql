/****** Object:  StoredProcedure [dbo].[proc_FetchDocForRead]    Script Date: 5/15/2018 12:11:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_FetchDocForRead(
    @DocSiteId   uniqueidentifier,
    @DocWebId    uniqueidentifier,
    @DocDirName  nvarchar(256),
    @DocLeafName nvarchar(128),
    @DocFullUrl  nvarchar(260), 
    @LooksLikeAttachmentFile bit,
    @GetContent  bit,
    @GetWebListForNormalization bit,
    @bGetContainingList bit,
    @bCheckout   bit,
    @UserId      int,
    @Version     int,
    @ChunkSize   int,
    @MaxLevel tinyint,
    @Level tinyint OUTPUT)
AS
    SET NOCOUNT ON
    DECLARE @GetOldVersion       bit
    DECLARE @GetSandbox          bit
    DECLARE @GetNonSandbox       bit
    DECLARE @CheckinLevel        tinyint
    SET @Level = 1
    SET @CheckinLevel = 1
    EXEC proc_DeriveVersioningFlags @Version,
        @GetSandbox OUTPUT,
        @GetNonSandbox OUTPUT,
        @GetOldVersion OUTPUT
    EXEC proc_GetLevel  @DocSiteId, 
        @DocDirName, 
        @DocLeafName, 
        @UserId,
        @MaxLevel,
        @Level OUTPUT,
        @CheckinLevel OUTPUT
    IF @GetNonSandbox = 1
        SET @Level = @CheckinLevel       
    IF @GetWebListForNormalization = 1
    BEGIN
        SELECT
            FullUrl
        FROM
            Webs
        WHERE
            SiteId = @DocSiteId AND
            ParentWebId = @DocWebId
    END
    EXEC proc_GetLinkInfoSingleDoc @DocSiteId, @DocDirName, 
        @DocLeafName, @Level
    IF @GetOldVersion <> 1
    BEGIN
        EXEC proc_GetMetaInfoForSingleDoc @DocSiteId, @DocDirName,
            @DocLeafName, @UserId, @Level, 0, @DocWebId
    END
    ELSE
    BEGIN
        EXEC proc_GetMetaInfoForSingleDocVersion
            @DocSiteId,
            @DocDirName,
            @DocLeafName,
            @UserId,
            @Level,
            0, 
            @DocWebId,
            @Version
    END
    DECLARE @IsAttachment        bit
    DECLARE @NeedManageListRight bit
    SET @IsAttachment        = 0
    SET @NeedManageListRight = 0
    IF @LooksLikeAttachmentFile = 1
    BEGIN
        EXEC @IsAttachment = proc_TestAttachmentsFlagReadPerm
            @DocSiteId,
            @DocDirName, 
            @DocLeafName, 
            1, 
            @UserId,
            @NeedManageListRight OUTPUT
        IF @bCheckout = 1 AND @IsAttachment = 1 AND @NeedManageListRight <> 1
            EXEC proc_TestAttachmentsFlagWritePerm
                @DocSiteId,
                @DocDirName, 
                @DocLeafName, 
                1, 
                @UserId,
                @NeedManageListRight OUTPUT
    END
    IF @bGetContainingList = 1
    BEGIN
        EXEC proc_GetContainingList
            @DocSiteId,
            @DocWebId,
            @DocDirName
    END
    IF @GetContent = 1
    BEGIN
        DECLARE @Size int
        IF @GetOldVersion = 0
        BEGIN
            SELECT
                COALESCE(DocStreams.Size, Docs.Size),
                Docs.SetupPathVersion,
                Docs.SetupPath,
                Docs.SetupPathUser,
                DocStreams.Content,
                Docs.Dirty,
                Docs.DocFlags,
                Docs.DoclibRowId,
                Docs.VirusVendorId,
                Docs.VirusStatus,
                Docs.VirusInfo,
                Docs.Version,
                Docs.Id,
                Docs.Version
            FROM
                Docs 
            LEFT OUTER JOIN 
                DocStreams
            ON
                Docs.SiteId = DocStreams.SiteId AND
                Docs.ParentId = DocStreams.ParentId AND
                Docs.Id = DocStreams.Id AND
                Docs.Level = DocStreams.Level
            WHERE
                Docs.SiteId = @DocSiteId AND
                Docs.DirName = @DocDirName AND
                Docs.LeafName = @DocLeafName AND
                Docs.WebId   = @DocWebId AND
                Docs.Level = @Level AND
                Docs.Type = 0
        END
        ELSE
        BEGIN
            DECLARE @DocId uniqueidentifier
            DECLARE @DoclibRowId int
            DECLARE @SetupPathVersion tinyint
            DECLARE @SetupPath nvarchar(255)
            DECLARE @SetupPathUser nvarchar(255)
            SELECT
                @Size = DocVersions.Size,
                @SetupPathVersion = Docs.SetupPathVersion,
                @SetupPath = Docs.SetupPath,
                @SetupPathUser = Docs.SetupPathUser,
                @DocId = DocVersions.Id,
                @DoclibRowId = Docs.DoclibRowId
            FROM
                Docs
            INNER JOIN
                DocVersions
            ON
                Docs.SiteId = DocVersions.SiteId AND
                Docs.Id = DocVersions.Id
            WHERE
                Docs.SiteId = @DocSiteId AND
                Docs.DirName = @DocDirName AND
                Docs.LeafName = @DocLeafName AND
                Docs.WebId   = @DocWebId AND
                Docs.Type = 0 AND
                Docs.Level = @Level AND
                DocVersions.Version = @Version
            IF @@ROWCOUNT = 1
            BEGIN
                SELECT
                    @Size,
                    @SetupPathVersion,
                    @SetupPath,
                    @SetupPathUser,
                    CASE WHEN @Size > @ChunkSize AND DocVersions.Content IS NOT NULL AND (DocFlags & 65536) = 0 THEN 0x0 ELSE DocVersions.Content END,
                    0,
                    DocFlags,
                    @DoclibRowId,
                    VirusVendorId,
                    VirusStatus,
                    VirusInfo,
                    NULL,
                    Id,
                    @Version
                FROM
                    DocVersions
                WHERE
                    SiteId = @DocSiteId AND
                    Id = @DocId AND
                    Version = @Version
            END
            ELSE 
            BEGIN                
                SELECT
                    @Size = COALESCE(DocStreams.Size, Docs2.Size),
                    @SetupPathVersion = Docs.SetupPathVersion,
                    @SetupPath = Docs.SetupPath,
                    @SetupPathUser = Docs.SetupPathUser,
                    @DocId = Docs.Id,
                    @DoclibRowId = Docs.DoclibRowId
                FROM
                    Docs
                INNER JOIN
                    Docs As Docs2
                ON
                    Docs2.SiteId = Docs.SiteId AND
                    Docs2.Id = Docs.Id AND
                    Docs2.UIVersion = @Version AND
                    Docs2.Level < @Level
                LEFT OUTER JOIN DocStreams
                ON
                    Docs2.SiteId = DocStreams.SiteId AND
                    Docs2.ParentId = DocStreams.ParentId AND
                    Docs2.Id = DocStreams.Id AND
                    Docs2.Level = DocStreams.Level
                WHERE
                    Docs.SiteId = @DocSiteId AND
                    Docs.DirName = @DocDirName AND
                    Docs.LeafName = @DocLeafName AND 
                    Docs.Level = @Level AND
                    Docs.WebId   = @DocWebId AND
                    Docs.Type = 0 AND
                    Docs2.UIVersion = @Version          
                IF @@ROWCOUNT = 1
                BEGIN
                    SELECT
                        @Size,
                        @SetupPathVersion,
                        @SetupPath,
                        @SetupPathUser,
                        CASE WHEN DocStreams.Size > @ChunkSize AND DocStreams.Content IS NOT NULL AND (DocFlags & 65536) = 0 THEN 0x0 ELSE DocStreams.Content END,
                        0,
                        DocFlags,
                        @DoclibRowId,
                        VirusVendorId,
                        VirusStatus,
                        VirusInfo,
                        NULL,
                        Docs.Id,
                        @Version
                    FROM
                        Docs LEFT OUTER JOIN DocStreams
                    ON
                        Docs.SiteId = DocStreams.SiteId AND
                        Docs.ParentId = DocStreams.ParentId AND
                        Docs.Id = DocStreams.Id AND
                        Docs.Level = DocStreams.Level
                    WHERE
                        Docs.SiteId = @DocSiteId AND
                        Docs.Id = @DocId AND
                        Docs.UIVersion = @Version AND
                        Docs.Level < @Level
                END
            END
        END
        IF @@ROWCOUNT <> 1
        BEGIN
            RETURN 3
        END
    END
    SELECT @IsAttachment, @NeedManageListRight,@Level
    EXEC proc_GetAuditMask 1, @DocSiteId, @DocDirName,
                        @DocLeafName
    RETURN 0

GO
