/****** Object:  StoredProcedure [dbo].[proc_EnumSitesForDeadWebCheck]    Script Date: 5/15/2018 12:12:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE dbo.proc_EnumSitesForDeadWebCheck
AS
    SET NOCOUNT ON
    SELECT
        Sites.Id,
        DATEDIFF(dd, Sites.CertificationDate, GETUTCDATE()) AS DiffTodayCertDate,
        Sites.DeadWebNotifyCount, 
        Webs.FullUrl,
        Webs.Title, 
        Webs.Language,
        UserInfo.tp_Email
    FROM 
        Sites
    INNER JOIN
        Webs
    ON
        Sites.Id = Webs.SiteId
    INNER JOIN
        UserInfo
    ON
        UserInfo.tp_SiteId = Sites.Id AND
        UserInfo.tp_SiteAdmin = 1 AND
        UserInfo.tp_Deleted = 0        
    WHERE
        Webs.ParentWebId IS NULL
    ORDER BY
        Sites.Id
    RETURN 0

GO
