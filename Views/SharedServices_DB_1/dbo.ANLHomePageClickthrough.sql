/****** Object:  View [dbo].[ANLHomePageClickthrough]    Script Date: 5/15/2018 12:14:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE VIEW dbo.ANLHomePageClickthrough
WITH SCHEMABINDING
AS

SELECT h.DayId, ref.SiteGuid as ReferrerSiteGuid, ref.WebGuid as ReferrerWebGuid, r.FullUrl TargetFullUrl, u.UserName
FROM dbo.ANLHit h, dbo.ANLResource r, dbo.ANLResource ref, dbo.ANLUser u
WHERE (ref.DocName = N'' OR ref.DocName = NULL OR LOWER(ref.DocName) = N'default.aspx' OR RIGHT(LOWER(ref.DocName),13) = N'/default.aspx')
AND h.ResourceId = r.ResourceId
AND u.UserId = h.UserId
and h.ReferrerResourceId = ref.ResourceId
and not ref.WebAppGuid is null


GO
