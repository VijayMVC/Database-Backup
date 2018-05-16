/****** Object:  StoredProcedure [dbo].[proc_getSiteIdOfHostHeaderSite]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_getSiteIdOfHostHeaderSite
(   
    @HostHeader nvarchar(128)
) AS
    SET NOCOUNT ON
    SELECT
        Id
    FROM
        SiteMap
    WHERE
        Path = @HostHeader AND
	HostHeaderIsSiteName = 1

GO
