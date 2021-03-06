/****** Object:  StoredProcedure [dbo].[proc_DeplAddExportObjectDependencies]    Script Date: 5/15/2018 12:11:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_DeplAddExportObjectDependencies(
    @SiteId uniqueidentifier,
    @IsMajorFileOnly int,
    @LinksOnly tinyint)
AS
    SET NOCOUNT ON
    DECLARE @FullSiteExport tinyint
    SET @FullSiteExport = 0
    IF @SiteId IS NULL
        RETURN 87
    IF EXISTS(
        SELECT 1
        FROM #ExportObjects
        WHERE
            Type = 1 AND
            ParentId = '00000000-0000-0000-0000-000000000000' AND
            IncludeDescendants =
            2)
        SET @FullSiteExport = 1
    IF @LinksOnly = 0
    BEGIN
        EXEC proc_DeplAddWebDependencies @SiteId, @FullSiteExport, @IsMajorFileOnly
        IF @FullSiteExport = 1
            RETURN 0
        EXEC proc_DeplAddListDependencies @SiteId
        EXEC proc_DeplAddFolderDependencies @SiteId, @IsMajorFileOnly, @LinksOnly
        EXEC proc_DeplAddFileDependencies @SiteId, @IsMajorFileOnly, @LinksOnly
    END
    EXEC proc_DeplAddListItemDependencies @SiteId, @IsMajorFileOnly, @LinksOnly
    RETURN 0

GO
