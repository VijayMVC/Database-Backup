/****** Object:  View [dbo].[ANLWebDnsReferralsByResourceByDay]    Script Date: 5/15/2018 12:14:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE VIEW dbo.ANLWebDnsReferralsByResourceByDay
WITH SCHEMABINDING 
AS
SELECT r.WebGuid AS TargetWebGuid, ref.HostDns AS ReferrerHostDns, h.DayId, COUNT_BIG(*) AS ReferralCount 
FROM dbo.ANLHit h, dbo.ANLResource ref, dbo.ANLResource r, dbo.ANLDay d
WHERE h.ReferrerResourceId = ref.ResourceId AND h.ResourceId = r.ResourceId AND h.DayId = d.DayId
AND NOT r.WebGuid = ref.WebGuid AND d.IsHistorical = 0
GROUP BY r.WebGuid, ref.HostDns, h.DayId


GO
