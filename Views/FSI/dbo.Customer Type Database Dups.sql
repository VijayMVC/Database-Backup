/****** Object:  View [dbo].[Customer Type Database Dups]    Script Date: 5/15/2018 12:13:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Customer Type Database Dups] AS 
SELECT CustomerTypeID AS ID, ZW_Franchise_ID AS FranID, MAX(sys_du) AS LastUpdate 
FROM  [Customer Type Database] WITH (NOLOCK) 
GROUP BY CustomerTypeID, ZW_Franchise_ID HAVING COUNT(*) > 1

GO
