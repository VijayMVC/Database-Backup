/****** Object:  View [dbo].[Adjustment Database Dups]    Script Date: 5/15/2018 12:13:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Adjustment Database Dups] AS 
SELECT AdjustmentID AS ID, ZW_Franchise_ID AS FranID, MAX(sys_du) AS LastUpdate 
FROM  [Adjustment Database] WITH (NOLOCK) 
GROUP BY AdjustmentID, ZW_Franchise_ID HAVING COUNT(*) > 1

GO
