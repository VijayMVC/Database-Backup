/****** Object:  View [dbo].[ViewOfSalesByMonthHorizontal]    Script Date: 5/15/2018 12:13:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[ViewOfSalesByMonthHorizontal]
AS
SELECT     TOP (100) PERCENT cs.StoreNumber, DATEPART(year, srp.EndDate) AS Year, SUM(CASE DatePart(month, srp.EndDate) 
                      WHEN 1 THEN srr.TotalSales ELSE NULL END) AS January, SUM(CASE DatePart(month, srp.EndDate) WHEN 2 THEN srr.TotalSales ELSE NULL END) 
                      AS Febuary, SUM(CASE DatePart(month, srp.EndDate) WHEN 3 THEN srr.TotalSales ELSE NULL END) AS March, SUM(CASE DatePart(month, 
                      srp.EndDate) WHEN 4 THEN srr.TotalSales ELSE NULL END) AS April, SUM(CASE DatePart(month, srp.EndDate) 
                      WHEN 5 THEN srr.TotalSales ELSE NULL END) AS May, SUM(CASE DatePart(month, srp.EndDate) WHEN 6 THEN srr.TotalSales ELSE NULL END) 
                      AS June, SUM(CASE DatePart(month, srp.EndDate) WHEN 7 THEN srr.TotalSales ELSE NULL END) AS July, SUM(CASE DatePart(month, srp.EndDate) 
                      WHEN 8 THEN srr.TotalSales ELSE NULL END) AS August, SUM(CASE DatePart(month, srp.EndDate) WHEN 9 THEN srr.TotalSales ELSE NULL END) 
                      AS September, SUM(CASE DatePart(month, srp.EndDate) WHEN 10 THEN srr.TotalSales ELSE NULL END) AS October, SUM(CASE DatePart(month, 
                      srp.EndDate) WHEN 11 THEN srr.TotalSales ELSE NULL END) AS November, SUM(CASE DatePart(month, srp.EndDate) 
                      WHEN 12 THEN srr.TotalSales ELSE NULL END) AS December, SUM(srr.TotalSales) AS Total
FROM         COR_STORES AS cs INNER JOIN
                      SLS_ROYALTY_PERIOD AS srp ON cs.StoreID = srp.StoreID INNER JOIN
                      SLS_ROYALTY_REPORT AS srr ON srp.RoyaltyPeriodID = srr.RoyaltyPeriodID INNER JOIN
                      SLS_ROYALTY_ALLOCATION AS sra ON srr.RoyaltyReportID = sra.RoyaltyReportID INNER JOIN
                      SLS_ROYALTY_DISTRIBUTION AS srd ON srp.RoyaltyPeriodID = srd.RoyaltyPeriodID INNER JOIN
                      SLS_ROYALTY_PAYMENT AS srpa ON srd.RoyaltyPaymentID = srpa.RoyaltyPaymentID
GROUP BY cs.StoreNumber, DATEPART(year, srp.EndDate)
ORDER BY CAST(cs.StoreNumber AS int), Year


GO
