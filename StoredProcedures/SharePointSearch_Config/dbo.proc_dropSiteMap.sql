/****** Object:  StoredProcedure [dbo].[proc_dropSiteMap]    Script Date: 5/15/2018 12:13:05 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_dropSiteMap
(   
    @Id uniqueidentifier
) AS
    SET NOCOUNT ON
    BEGIN TRAN
    DECLARE @DatabaseId uniqueidentifier
    SELECT
        @DatabaseId = DatabaseId
    FROM
        SiteMap
    WHERE
        Id = @Id
    DELETE FROM
        SiteMap
    WHERE
        Id = @Id
    UPDATE 
        SiteCounts
    SET
        NumSites = NumSites - 1
    WHERE
        DatabaseId = @DatabaseId
    COMMIT TRAN

GO
