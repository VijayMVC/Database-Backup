/****** Object:  View [dbo].[vwRoyalty]    Script Date: 5/15/2018 12:13:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW [dbo].[vwRoyalty]
AS
SELECT     sd.StoreDateID, CONVERT(bigint, sd.StoreID) AS storeid, sd.BeginDate, sd.EndingDate AS storeEndDate, srp.RoyaltyPeriodID, srr.TotalSales, 
                      srp.StartDate, srp.EndDate
FROM         dbo.SLS_ROYALTY_REPORT AS srr INNER JOIN
                      dbo.SLS_ROYALTY_PERIOD AS srp ON srr.RoyaltyPeriodID = srp.RoyaltyPeriodID INNER JOIN
                      dbo.COR_STORE_DATES AS sd ON srp.StoreID = sd.StoreID AND srp.StartDate >= sd.BeginDate AND srp.EndDate >= sd.BeginDate AND 
                      srp.StartDate <= sd.EndingDate AND srp.EndDate <= sd.EndingDate AND srp.StartDate >= '1/1/1997'



GO
