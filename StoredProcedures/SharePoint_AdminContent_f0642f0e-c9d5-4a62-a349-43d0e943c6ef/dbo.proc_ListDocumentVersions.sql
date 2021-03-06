/****** Object:  StoredProcedure [dbo].[proc_ListDocumentVersions]    Script Date: 5/15/2018 12:12:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_ListDocumentVersions(
    @DocSiteId uniqueidentifier,
    @DocWebId uniqueidentifier,
    @DocDirName nvarchar(256),
    @DocLeafName nvarchar(128),
    @MaxLevel tinyint,
    @UserId int)
AS
    SET NOCOUNT ON
    DECLARE @Type tinyint
    DECLARE @DocFullUrl nvarchar(260)
    DECLARE @DocId uniqueidentifier
    DECLARE @Level tinyint
    SET @DocFullUrl = CASE WHEN (DATALENGTH(@DocDirName) = 0) THEN @DocLeafName WHEN (DATALENGTH(@DocLeafName) = 0) THEN @DocDirName ELSE @DocDirName + N'/' + @DocLeafName END
    SELECT TOP 1
        @DocId = Docs.Id,
        @Type = Docs.Type
    FROM
        Docs
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName
    IF @Type <> 0
        RETURN 2
    EXEC proc_GetLevel  @DocSiteId, 
        @DocDirName, 
        @DocLeafName, 
        @UserId,
        @MaxLevel,
        @Level OUTPUT
    EXEC proc_SecGetIndividualUrlSecurity @DocSiteId, @DocWebId,
        @DocFullUrl, @DocDirName, @DocLeafName, @UserId, 0, 0, 0, 0, 0, @Level
    SELECT
        DocVersions.TimeCreated,
        DocVersions.Version,
        DocVersions.Size,
        DocVersions.CheckinComment,
        DocVersions.MetaInfo,
        0, 
        DocVersions.Level,
        DocVersions.DraftOwnerId
    FROM
        DocVersions
    WHERE
        DocVersions.SiteId = @DocSiteId AND
        DocVersions.Id = @DocId AND
        (DocVersions.Level <= @MaxLevel OR
         DocVersions.DraftOwnerId = @UserId)
    UNION ALL
    SELECT 
        Docs.TimeLastModified,
        Docs.UIVersion,
        Docs.Size,
        Docs.CheckinComment,
        Docs.MetaInfo,
        1, 
        Docs.Level,
        Docs.DraftOwnerId
    FROM 
        Docs
    WHERE
        Docs.SiteId = @DocSiteId AND
        Docs.DirName = @DocDirName AND
        Docs.LeafName = @DocLeafName AND
        Docs.Level < @Level
    RETURN 0

GO
