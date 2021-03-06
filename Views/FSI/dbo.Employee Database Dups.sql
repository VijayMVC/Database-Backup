/****** Object:  View [dbo].[Employee Database Dups]    Script Date: 5/15/2018 12:13:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[Employee Database Dups] AS 
SELECT EmployeeID AS ID, ZW_Franchise_ID AS FranID, MAX(sys_du) AS LastUpdate 
FROM  [Employee Database] WITH (NOLOCK) 
GROUP BY EmployeeID, ZW_Franchise_ID HAVING COUNT(*) > 1

GO
