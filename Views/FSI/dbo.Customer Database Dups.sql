/****** Object:  View [dbo].[Customer Database Dups]    Script Date: 5/15/2018 12:13:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Customer Database Dups] AS 
SELECT CustomerID AS ID, ZW_Franchise_ID AS FranID, MAX(sys_du) AS LastUpdate 
FROM  [Customer Database] WITH (NOLOCK) 
GROUP BY CustomerID, ZW_Franchise_ID HAVING COUNT(*) > 1

GO
