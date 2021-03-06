/****** Object:  View [dbo].[ANLHitsByResourceByUserByDay]    Script Date: 5/15/2018 12:14:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-------------------------------------------------------------------------------

CREATE VIEW dbo.ANLHitsByResourceByUserByDay
WITH SCHEMABINDING 
AS
SELECT r.SiteGuid, r.WebGuid, u.UserName, h.DayId, COUNT_BIG (*) AS HitCount 
FROM dbo.ANLHit h, dbo.ANLUser u, dbo.ANLResource r
WHERE u.UserId = h.UserId and h.ResourceId = r.ResourceId
GROUP BY r.SiteGuid, r.WebGuid, u.UserName, h.DayId


GO
