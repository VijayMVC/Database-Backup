/****** Object:  StoredProcedure [dbo].[proc_putSiteMap]    Script Date: 5/15/2018 12:13:07 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_putSiteMap
(   
    @ApplicationId uniqueidentifier,
    @DatabaseId uniqueidentifier,
    @SiteId uniqueidentifier,
    @Path nvarchar(128),
    @Pairing tinyint,
    @RedirectUrl nvarchar(512),
    @HostHeaderIsSiteName bit,
    @CurrentDatabaseSiteCount int output
) AS
    SET NOCOUNT ON
    BEGIN TRAN
    INSERT INTO SiteMap
    (
        Id,
        ApplicationId,
        DatabaseId,
        Path,
        Pairing,
        Status,
        RedirectUrl,
        HostHeaderIsSiteName
    )
    VALUES
    (
        @SiteId,
        @ApplicationId,
        @DatabaseId,
        @Path,
        @Pairing,
        0,
        @RedirectUrl,
        @HostHeaderIsSiteName
    )
    IF (@@ROWCOUNT <> 1)
    BEGIN
	ROLLBACK TRAN
	RETURN 1
    END
    UPDATE 
        SiteCounts
    SET
        NumSites = NumSites + 1
    WHERE
        DatabaseId = @DatabaseId
    SELECT
        @CurrentDatabaseSiteCount = NumSites
    FROM
        SiteCounts
    WHERE
        DatabaseId = @DatabaseId
    SELECT @SiteId
    COMMIT TRAN

GO
