/****** Object:  StoredProcedure [dbo].[proc_getSiteMap]    Script Date: 5/15/2018 12:13:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_getSiteMap
(   
    @ApplicationId uniqueidentifier,
    @Path nvarchar(128)
) AS
    SET NOCOUNT ON
    SELECT
        Id,
        DatabaseId,
        RedirectUrl,
        Pairing
    FROM
        SiteMap
    WHERE
        ApplicationId = @ApplicationId AND
    Path = @Path

GO
