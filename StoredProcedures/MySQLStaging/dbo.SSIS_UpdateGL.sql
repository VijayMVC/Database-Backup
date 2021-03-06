/****** Object:  StoredProcedure [dbo].[SSIS_UpdateGL]    Script Date: 5/15/2018 12:11:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SSIS_UpdateGL
AS 
    BEGIN

        SELECT
            ia.franchise_id AS ZW_Franchise_ID ,
            CONVERT(DATE, ia.invoiced_on) AS TransactionDateTime ,
            OrderID = ia.Job * 1000 + ia.InvoiceSequence ,
            ia.job_id AS JobIDGUID ,
            ia.JobAccountsID AS CustomerGUID ,
            CONVERT(DATE, ia.paid_on) AS ClosedDate ,
            CASE WHEN ia.paid_on IS NULL THEN 0
                 ELSE 1
            END AS Closed ,
            ia.RevenueLocation ,
            ia.ServiceCategory ,
            SUM(-ia.ext_price) AS Amount ,
            SUM(ia.discount) AS Discount ,
            CASE WHEN SUM(ia.tax) > 0 THEN 1
                 ELSE 0
            END AS Taxable ,
            OLTP_InsertDate = ia.invoiced_on ,
            OLTP_UpdateDate = GETDATE()
        INTO
            #GLTemp
        FROM
            vw_LineItemDetail AS ia
            INNER JOIN ( SELECT
                            FII_ODS.System.StoreControl.ZW_Franchise_ID ,
                            FII_ODS.System.StoreControl.AsOfDate
                         FROM
                            FII_ODS.System.StoreControl
                         WHERE
                            FII_ODS.System.StoreControl.AsOfDate < GETDATE()
                            AND FII_ODS.System.StoreControl.DataSource <> 'FSI'
                       ) Query1 ON ia.franchise_id = Query1.ZW_Franchise_ID
        WHERE
            ia.invoiced_on > Query1.AsOfDate
 --   AND ia.franchise_id = 'FSI0096'
            AND
--  ia.Job=76763 and
            ia.phase_id = '0b52f405f1deecff6d4db236d53432e6'
        GROUP BY
            ia.franchise_id ,
            ia.Job * 1000 + ia.InvoiceSequence ,
            ia.job_id ,
            ia.JobAccountsID ,
            ia.RevenueLocation ,
            ia.ServiceCategory ,
            ia.invoiced_on ,
            ia.paid_on
        HAVING
            SUM(-ia.ext_price) + SUM(ia.discount) <> 0
        ORDER BY
            1 ,
            2 ,
            3


        SELECT
            #GLTemp.ZW_Franchise_ID ,
            TransactionDateTime ,
            OrderID ,
            -255 AS OrderKey ,
            0 AS CustomerID ,
            ISNULL(ISNULL(CustomerFact.CustomerKey, CF.CustomerKey), -255) AS CustomerKey ,
            CASE WHEN RevenueLocation = 'In-House'
                      AND ServiceCategory IS NULL THEN 4110
                 WHEN RevenueLocation = 'Subcontract'
                      AND ServiceCategory IS NULL THEN 4120
                 WHEN RevenueLocation = 'Subcontract'
                      AND ServiceCategory = 'Installation' THEN 4130
                 WHEN RevenueLocation = 'In-House'
                      AND ServiceCategory IN ( 'Legacy', 'Installation' )
                 THEN 4110
                 WHEN RevenueLocation = 'In-House'
                      AND ServiceCategory = 'Delivery' THEN 4110
                 WHEN RevenueLocation = 'Subcontract'
                      AND ServiceCategory IN ( 'Delivery', 'Other Services',
                                               'Third-Party Contractor' )
                 THEN 4120
                 WHEN RevenueLocation = 'In-House'
                      AND ServiceCategory IN ( 'Production Services',
                                               'Other Services' ) THEN 4140
                 WHEN RevenueLocation IS NULL
                      AND ServiceCategory IS NULL THEN 4401
                 ELSE 0
            END AS AccountCode ,
            Amount = Amount + Discount ,
            -255 AS DescriptionKey ,
            Closed ,
            ClosedDate ,
            0 AS Exported ,
            0 AS SubAccountCode ,
            Taxable ,
            -255 AS ModifiedByComputerKey ,
            -255 AS ProductID ,
            #GLTemp.OLTP_InsertDate ,
            #GLTemp.OLTP_UpdateDate ,
            StoreFact.CenterKey ,
            JobIDGUID AS KeystoneGLFactKey ,
            UpdateCheckSum = 0
        FROM
            #GLTemp
            JOIN FII_ODS.Store.StoreFact ON StoreFact.ZW_Franchise_ID = #GLTemp.ZW_Franchise_ID
            LEFT JOIN FII_ODS.Contact.CustomerFact ON CustomerGUID = CustomerFact.KeystoneCustomerKey
            LEFT JOIN FII_ODS.Contact.CustomerFact CF ON REPLACE(#GLTemp.CustomerGUID,
                                                              #GLTemp.ZW_Franchise_ID
                                                              + ':A', '') = CONVERT(VARCHAR(32), CF.CustomerID)
                                                         AND #GLTemp.ZW_Franchise_ID = CF.ZW_Franchise_ID 
--WHERE OrderID=79292001 --76947001


        DROP TABLE #GLTemp
    END

GO
