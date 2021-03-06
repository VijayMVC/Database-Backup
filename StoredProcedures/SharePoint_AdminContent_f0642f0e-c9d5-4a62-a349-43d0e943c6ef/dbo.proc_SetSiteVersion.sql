/****** Object:  StoredProcedure [dbo].[proc_SetSiteVersion]    Script Date: 5/15/2018 12:13:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_SetSiteVersion(
    @SiteId uniqueidentifier,
    @VersionId uniqueidentifier,
    @Version nvarchar(64)
    )
AS
    SET NOCOUNT ON
    IF NOT EXISTS (SELECT NULL FROM SiteVersions WHERE SiteId = @SiteId 
    AND VersionId = @VersionId)
        INSERT INTO SiteVersions (SiteId, VersionId, Version) VALUES (@SiteId, @VersionId, @Version)
    ELSE
        UPDATE SiteVersions SET Version = @Version WHERE SiteId = @SiteId AND VersionId = @VersionId

GO
