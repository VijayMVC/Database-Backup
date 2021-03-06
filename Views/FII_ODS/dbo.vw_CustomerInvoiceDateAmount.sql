/****** Object:  View [dbo].[vw_CustomerInvoiceDateAmount]    Script Date: 5/15/2018 12:13:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


	CREATE VIEW [dbo].[vw_CustomerInvoiceDateAmount] 

	AS SELECT distinct
--voh.ZW_Franchise_ID AS FSINumber
 DATEPART(year,voh.PickedUpDate) AS [Year]
, vs.WebNumber
, vs.StoreNumber AS Center
, vs.openstatus
, vs.CountryCode
, ('"' + voh.CustomerName + '"' ) AS Customer
, CAST(voh.PickedUpDate AS DATE) AS InvoiceDate
, voh.OrderId AS InvoiceNumber
, voh.SalesSubtotal
FROM dbo.vw_OrderHeader voh   WITH ( NOLOCK ) 
INNER JOIN dbo.vw_Store vs   WITH ( NOLOCK )  ON vs.ZW_Franchise_ID = voh.ZW_Franchise_ID 
WHERE  ISNULL(voh.PickedUpDate, '1900-01-01') <> '1900-01-01'
AND vs.openstatus = 'open'
AND vs.CountryCode in ('US','GB','CA','AU')
    AND voh.PickedUpDate >= '2011-01-01 00:00:00.000'
    AND voh.PickedUpDate <= '2013-12-31 23:59:59.999'



GO
