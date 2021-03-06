/****** Object:  StoredProcedure [dbo].[proc_RevertDocContentStreams]    Script Date: 5/15/2018 12:12:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_RevertDocContentStreams(
    @SiteId uniqueidentifier,
    @WebId uniqueidentifier,
    @WebFullUrl nvarchar(260),
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @UserId int)
AS
    SET NOCOUNT ON
    DECLARE @DocFullUrl nvarchar(260)
    SET @DocFullUrl = CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END
    DECLARE @DocId uniqueidentifier
    DECLARE @ListId uniqueidentifier
    DECLARE @DoclibRowId int
    DECLARE @Level tinyint
    DECLARE @ListFlags bigint
    SELECT
        @DocId = Docs.Id,
        @ListId = Docs.ListId,
        @DoclibRowId = Docs.DoclibRowId,
        @Level = Docs.Level,
        @ListFlags = Lists.tp_Flags
    FROM
        Docs
    LEFT OUTER JOIN
        Lists WITH(NOLOCK) 
    ON
        Lists.tp_ID = Docs.ListId AND
        Lists.tp_WebId = Docs.WebId
    WHERE
        Docs.SiteId = @SiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName AND
        Docs.SetupPath IS NOT NULL AND
        (Docs.DocFlags & 64) <> 0 AND
        Docs.IsCurrentVersion = 1
    IF (@DocId IS NULL)
        RETURN 2
    BEGIN TRAN
    IF @Level IS NOT NULL AND @Level <> 1
    BEGIN
        DECLARE @DocFlagOut int
        DECLARE @UIVersion int
        DECLARE @Moderated bit
        DECLARE @MinorVersionEnabled bit
        DECLARE @VersionEnabled bit
        SET @Moderated = 0
        SET @MinorVersionEnabled = 0
        SET @VersionEnabled = 0    	     
        IF @ListFlags & 0x80 = 0x80
            SET @VersionEnabled = 1
        IF @ListFlags & 0x400 = 0x400
            SET @Moderated = 1
        IF @ListFlags & 0x80000 = 0x80000
            SET @MinorVersionEnabled = 1
        EXEC proc_ChangeLevelForDoc
            @SiteId,
            @DocDirName,
            @DocLeafName,    
            @Level OUTPUT,  
            LEVEL_PUBLISHED,
            0,                
            @MinorVersionEnabled,
            @Moderated,
            @VersionEnabled,
            @UserId,
            NULL,
            0,
            @DoclibRowId OUTPUT,
            @UIVersion OUTPUT,
            @DocFlagOut OUTPUT
    END
    DELETE
        DocStreams
    WHERE
        SiteId = @SiteId AND
        Id = @DocId
    DELETE
        Links
    WHERE
        SiteId = @SiteId AND
        DirName = @DocDirName AND
        LeafName = @DocLeafName AND
        WebPartId IS NULL AND
        FieldId IS NULL
    DELETE
        Deps
    WHERE
        SiteId = @SiteId AND
        FullUrl = @DocFullUrl AND
        DeleteTransactionId = 0x
    DECLARE @DTM datetime
    SELECT @DTM = dbo.fn_RoundDateToNearestSecond(GETUTCDATE())
    DECLARE @DiskUsedDelta bigint
    SELECT
        @DiskUsedDelta = SUM(
            - CAST((CASE WHEN Docs.Size IS NULL THEN 0 ELSE (Docs.Size - 200) END) AS BIGINT)
            - CAST(ISNULL(Docs.MetaInfoSize, 0) AS BIGINT)
            - CAST(ISNULL(Docs.UnVersionedMetaInfoSize,0) AS BIGINT))
    FROM
        Docs
    WHERE
        SiteId = @SiteId AND
        Id = @DocId
    UPDATE
        Docs
    SET
        Size = CASE WHEN Size IS NULL THEN NULL ELSE 200 END,
        MetaInfoSize = NULL,
        Dirty = 0,              
        CacheParseId = NULL,
        DocFlags = (DocFlags & ~64),
        ThicketFlag = 0,
        CharSet = NULL,
        ProgId = NULL,
        NextToLastTimeModified = TimeLastModified,
        TimeLastModified = @DTM,
        MetaInfoTimeLastModified = @DTM,
        TimeLastWritten = @DTM,
        VirusVendorID = NULL,
        VirusStatus = NULL,
        VirusInfo = NULL,
        MetaInfo = NULL,
        UnVersionedMetaInfo = NULL,
        UnVersionedMetaInfoSize = NULL,
        UnVersionedMetaInfoVersion = NULL
    WHERE
        SiteId = @SiteId AND
        Id = @DocId
    EXEC proc_QMChangeSiteDiskUsedAndContentTimestamp @SiteId, @DiskUsedDelta, 1
    INSERT INTO EventCache(
        EventTime,
        SiteId,
        WebId,
        ListId,
        ItemId,
        DocId,
        Guid0,
        Int0,
        ItemName,
        ItemFullUrl,
        EventType,
        ObjectType,
        ModifiedBy,
        TimeLastModified,
        EventData, 
        ACL,
        ContentTypeId)          
    VALUES(
        GETUTCDATE(),                               
        @SiteId,
        @WebId,
        @ListId,
        @DoclibRowId,                               
        @DocId,                                     
        NULL,                                       
        NULL,                                       
        @DocLeafName,                               
        @DocFullUrl,                                
        8192,                    
        CASE WHEN @DoclibRowId IS NULL THEN 16 ELSE 
            1 END,                      
        NULL,                                       
        @DTM,                                       
        NULL,                                       
        NULL,                                       
        NULL)                                       
    EXEC proc_AddAuditEntryFromSql @SiteId, @DocDirName, @DocLeafName, 
        1, @UserId, 5, 
        N'<RevertDocumentContentStream />', 0x00000010
    COMMIT TRAN

GO
