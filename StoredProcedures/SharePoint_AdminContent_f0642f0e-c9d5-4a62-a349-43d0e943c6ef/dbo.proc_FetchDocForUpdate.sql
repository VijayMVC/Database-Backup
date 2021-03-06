/****** Object:  StoredProcedure [dbo].[proc_FetchDocForUpdate]    Script Date: 5/15/2018 12:12:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_FetchDocForUpdate(
    @DocSiteId                   uniqueidentifier,
    @DocWebId                    uniqueidentifier,
    @DocDirName                  nvarchar(256),
    @DocLeafName                 nvarchar(128),
    @UserId                      int,
    @Version                     int,
    @GetContent                  bit,
    @GetWebListForNormalization  bit,
    @CacheParse                  bit,
    @GetWebPartInfo              bit,
    @bGetContainingList          bit,
    @LooksLikeAttachmentFile     bit,
    @ChunkSize int,
    @Level tinyint OUTPUT
    )
AS
    SET NOCOUNT ON
    DECLARE @DocId               uniqueidentifier
    DECLARE @CacheParseId        uniqueidentifier
    DECLARE @Now                 datetime
    DECLARE @IsAttachment        bit
    DECLARE @NeedManageListRight bit
    DECLARE @RevertOldVersion    bit
    DECLARE @GetSandbox          bit
    DECLARE @GetNonSandbox       bit
    DECLARE @MaxFetchLevel       tinyint
    DECLARE @UserIdforLevel      int
    DECLARE @Size int
    DECLARE @DocsType            tinyint
    EXEC proc_DeriveVersioningFlags @Version,
        @GetSandbox OUTPUT,
        @GetNonSandbox OUTPUT,
        @RevertOldVersion OUTPUT
    IF @GetSandbox = 1
        SET @UserIdforLevel  = -1
    ELSE
        SET @UserIdforLevel = @UserId
    IF @GetNonSandbox = 1
    BEGIN
        SET @MaxFetchLevel = 1
        SET @UserIdforLevel = NULL
    END
    ELSE
        SET @MaxFetchLevel = 2
    EXEC proc_GetLevel  
        @DocSiteId, 
        @DocDirName, 
        @DocLeafName, 
        @UserIdforLevel,
        @MaxFetchLevel,
        @Level OUTPUT
    SET @Now = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    SET @IsAttachment        = 0
    SET @NeedManageListRight = 0
    IF @LooksLikeAttachmentFile = 1
        EXEC @IsAttachment = proc_TestAttachmentsFlagWritePerm
            @DocSiteId,
            @DocDirName, 
            @DocLeafName, 
            1, 
            @UserId,
            @NeedManageListRight OUTPUT
    IF @IsAttachment <> 1
    BEGIN
        SELECT 
            @DocId = Id
        FROM
            Docs
        WHERE
            SiteId   = @DocSiteId AND
            DirName  = @DocDirName AND
            LeafName = @DocLeafName AND
            WebId    = @DocWebId
    END
    IF @GetWebListForNormalization = 1
    BEGIN
        SELECT
            FullUrl
        FROM
            Webs
        WHERE
            Webs.SiteId = @DocSiteId AND
            Webs.ParentWebId = @DocWebId
    END
    DECLARE @DirDirName nvarchar(256)
    DECLARE @DirLeafName nvarchar(128)
    EXEC proc_SplitUrl @DocDirName, @DirDirName OUTPUT, @DirLeafName OUTPUT
    WHILE NOT EXISTS (SELECT * FROM Docs WHERE SiteId = @DocSiteId AND DirName = @DirDirName AND LeafName = @DirLeafName) AND @DirDirName <> N''
        EXEC proc_SplitUrl @DirDirName, @DirDirName OUTPUT, @DirLeafName OUTPUT
    SELECT TOP 1
        Acl, AnonymousPermMask
    FROM
        Docs
    JOIN
        Perms
    ON
        Docs.SiteId = Perms.SiteId AND
        Docs.ScopeId = Perms.ScopeId
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.WebId = @DocWebId AND
        DirName = @DirDirName AND
        LeafName = @DirLeafName
    IF @CacheParse = 1
    BEGIN
        SELECT @CacheParseId = NEWID()
        UPDATE
            Docs
        SET
            CacheParseId = @CacheParseId
        WHERE
            SiteId = @DocSiteId AND 
            DirName = @DocDirName AND 
            LeafName = @DocLeafName AND
            WebId    = @DocWebId
    END
    IF @RevertOldVersion = 0
    BEGIN
        EXEC proc_GetMetaInfoForSingleDoc
            @DocSiteId,
            @DocDirName,
            @DocLeafName,
            @UserId,
            @Level,
            @CacheParse,
            @DocWebId
    END
    ELSE
    BEGIN
        EXEC proc_GetMetaInfoForSingleDocVersion
            @DocSiteId,
            @DocDirName,
            @DocLeafName,
            @UserId,
            @Level,
            @CacheParse,
            @DocWebId,
            @Version
    END
    IF @CacheParse = 1
    BEGIN
        EXEC proc_GetLinkInfoSingleDocForFixup @DocSiteId, @DocDirName,
            @DocLeafName, @Level
    END
    IF @GetWebPartInfo = 1
    BEGIN
        SELECT
            tp_ID,
            tp_Level,
            tp_Source,
            tp_AllUsersProperties                
        FROM
            WebParts
        WHERE
            tp_SiteID = @DocSiteId AND
            tp_PageUrlID = @DocId AND
            tp_Level = @Level AND
            tp_UserID IS NULL
        SELECT
            DISTINCT tp_ZoneID
        FROM
            WebParts
        WHERE
            tp_SiteID = @DocSiteId AND
            tp_PageUrlID = @DocId AND
            tp_Level = @Level
        UNION
        SELECT
            DISTINCT tp_ZoneID
        FROM
            Personalization
        WHERE
            tp_SiteID = @DocSiteId AND
            tp_PageUrlID = @DocId
    END
    IF @bGetContainingList = 1
    BEGIN
        DECLARE @DocFullUrl nvarchar(260)
        SET @DocFullUrl = CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END 
        EXEC proc_GetContainingList
            @DocSiteId,
            @DocWebId,
            @DocFullUrl
    END
    IF @GetContent = 1
    BEGIN
        SELECT TOP 1
            @DocsType = Docs.Type
        FROM
            Docs
        WHERE
            Docs.SiteId = @DocSiteId AND
            Docs.DirName = @DocDirName AND
            Docs.LeafName = @DocLeafName AND
            Docs.WebId = @DocWebId AND
            Docs.Level = @Level 
        IF @DocsType IS NOT NULL AND
            @DocsType <> 0
        BEGIN
            SET @GetContent = 0
        END
    END
    IF @GetContent = 1
    BEGIN
        IF @RevertOldVersion = 0
        BEGIN
            SELECT
                COALESCE(DocStreams.Size, Docs.Size),
                Docs.SetupPathVersion,
                Docs.SetupPath,
                Docs.SetupPathUser,
                CASE WHEN DocStreams.Size > @ChunkSize AND DocStreams.Content IS NOT NULL AND (Docs.DocFlags & 65536) = 0 THEN 0x0 ELSE DocStreams.Content END,
                Docs.Dirty,
                Docs.DocFlags,
                NULL, 
                NULL, 
                NULL, 
                NULL, 
                Version,
                Docs.Id,
                Version
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
                Docs.WebId    = @DocWebId AND
                Docs.Level = @Level 
        END
        ELSE
        BEGIN
            DECLARE @Dirty bit
            DECLARE @SetupPathVersion tinyint
            DECLARE @SetupPath nvarchar(255)
            DECLARE @SetupPathUser nvarchar(255)
            SELECT
                @Size = DocVersions.Size,
                @Dirty = Docs.Dirty,
                @DocId = Docs.Id,
                @SetupPathVersion = CASE WHEN DocVersions.Content IS NULL THEN Docs.SetupPathVersion ELSE 3 END,
                @SetupPath = CASE WHEN DocVersions.Content IS NULL THEN Docs.SetupPath ELSE NULL END ,
                @SetupPathUser = CASE WHEN DocVersions.Content IS NULL THEN Docs.SetupPathUser ELSE NULL END                    
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
                Docs.Level = @Level AND
                DocVersions.Version = @Version AND
                Docs.WebId    = @DocWebId
            IF @@ROWCOUNT = 1
            BEGIN
                SELECT
                    @Size,
                    @SetupPathVersion,    
                    @SetupPath, 
                    @SetupPathUser, 
                    CASE WHEN @Size > @ChunkSize AND DocVersions.Content IS NOT NULL AND (DocFlags & 65536) = 0 THEN 0x0 ELSE DocVersions.Content END,
                    @Dirty,
                    DocFlags,
                    NULL, 
                    NULL, 
                    NULL, 
                    NULL, 
                    NULL, 
                    @DocId,
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
                    @Dirty = Docs.Dirty,
                    @DocId = Docs.Id
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
                    Docs2.UIVersion = @Version AND
                    Docs.WebId    = @DocWebId           
                IF @@ROWCOUNT = 1
                BEGIN            
                SELECT
                    @Size,
                    SetupPathVersion,
                    SetupPath, 
                    SetupPathUser, 
                    CASE WHEN DocStreams.Size > @ChunkSize AND DocStreams.Content IS NOT NULL AND (DocFlags & 65536) = 0 THEN 0x0 ELSE DocStreams.Content END,
                    @Dirty,
                    DocFlags,
                    NULL, 
                    NULL, 
                    NULL, 
                    NULL, 
                    NULL, 
                    @DocId,
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
                    Docs.Level <@Level
                END
            END
        END
    END
    SELECT @IsAttachment, @NeedManageListRight, @Level
    RETURN 0

GO
