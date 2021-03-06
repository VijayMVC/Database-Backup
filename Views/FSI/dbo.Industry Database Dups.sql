/****** Object:  View [dbo].[Industry Database Dups]    Script Date: 5/15/2018 12:13:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Industry Database Dups] AS 
SELECT IndustryTypeID AS ID, ZW_Franchise_ID AS FranID, MAX(sys_du) AS LastUpdate 
FROM  [Industry Database] WITH (NOLOCK) 
GROUP BY IndustryTypeID, ZW_Franchise_ID HAVING COUNT(*) > 1

GO
