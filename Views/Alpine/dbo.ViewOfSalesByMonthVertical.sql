/****** Object:  View [dbo].[ViewOfSalesByMonthVertical]    Script Date: 5/15/2018 12:13:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[ViewOfSalesByMonthVertical]
AS
SELECT     TOP (100) PERCENT cs.StoreNumber, DATEPART(year, srp.EndDate) AS Year, DATEPART(month, srp.EndDate) AS Month, SUM(srr.TotalSales) 
                      AS SalesForMonth
FROM         COR_STORES AS cs INNER JOIN
                      SLS_ROYALTY_PERIOD AS srp ON cs.StoreID = srp.StoreID INNER JOIN
                      SLS_ROYALTY_REPORT AS srr ON srp.RoyaltyPeriodID = srr.RoyaltyPeriodID
GROUP BY cs.StoreNumber, DATEPART(year, srp.EndDate), DATEPART(month, srp.EndDate)
ORDER BY CAST(cs.StoreNumber AS int), Year, Month


GO
