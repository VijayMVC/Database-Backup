/****** Object:  View [dbo].[Contact Database Dups]    Script Date: 5/15/2018 12:13:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Contact Database Dups] AS 
SELECT ContactID AS ID, ZW_Franchise_ID AS FranID, MAX(sys_du) AS LastUpdate 
FROM  [Contact Database] WITH (NOLOCK) 
GROUP BY ContactID, ZW_Franchise_ID HAVING COUNT(*) > 1

GO
