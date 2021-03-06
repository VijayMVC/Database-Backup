/****** Object:  View [dbo].[ANLPageClickthroughsByDay]    Script Date: 5/15/2018 12:14:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

--
-- Unlike referrals, we can only find out about clickthroughs that went to WSS 
-- resources in this SRP. In addition, we choose to only count intra-SPSite
-- clickthroughs, so we'll include that condition in this query.
--
CREATE VIEW dbo.ANLPageClickthroughsByDay
WITH SCHEMABINDING 
AS
SELECT ref.SiteGuid as ReferrerSiteGuid, ref.WebGuid AS ReferrerWebGuid, r.FullUrl AS TargetFullUrl, h.DayId, COUNT_BIG(*) AS ClickthroughCount 
FROM dbo.ANLHit h, dbo.ANLResource r, dbo.ANLResource ref
WHERE h.ResourceId = r.ResourceId AND h.ReferrerResourceId = ref.ResourceId AND ref.SiteGuid = r.SiteGuid
GROUP BY ref.SiteGuid, ref.WebGuid, r.FullUrl, h.DayId


GO
