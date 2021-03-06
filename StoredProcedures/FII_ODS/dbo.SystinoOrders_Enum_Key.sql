/****** Object:  StoredProcedure [dbo].[SystinoOrders_Enum_Key]    Script Date: 5/15/2018 12:09:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[SystinoOrders_Enum_Key]
    @GPickedUpDate2 DATETIME ,
    @LPickedUpDate2 DATETIME
AS --DECLARE
--    @GPickedUpDate2 DATETIME ,
--    @LPickedUpDate2 DATETIME
--SET @GPickedUpDate2 = GETDATE() - 10
--SET @LPickedUpDate2 = GETDATE() - 3 ;  

    WITH    InvoiceTotal
              AS ( SELECT
                    CAST(invoices.franchise_id AS [CHAR](7)) AS franchise_id ,
                    MySQLStaging.dbo.invoice_line_items.invoice_id ,
                    SUM(MySQLStaging.dbo.invoice_line_items.amount_due) AS AmountDue ,
                    SUM(MySQLStaging.dbo.invoice_line_items.amount_paid) AS AmountPaid ,
                    SUM(MySQLStaging.dbo.invoice_line_items.ext_price) AS Amount ,
                    SUM(MySQLStaging.dbo.invoice_line_items.quantity) AS NumberItems
                   FROM
                    MySQLStaging.dbo.invoice_line_items WITH ( NOLOCK )
                    INNER JOIN ( SELECT
                                    *
                                 FROM
                                    MySQLStaging.dbo.invoices WITH ( NOLOCK )
                               ) invoices ON MySQLStaging.dbo.invoice_line_items.invoice_id = invoices.invoice_id
                   GROUP BY
                    CAST(invoices.franchise_id AS [CHAR](7)) ,
                    MySQLStaging.dbo.invoice_line_items.invoice_id
                 )
        SELECT TOP 100
            jobs.sequence AS OrderID ,
            CONVERT(BIGINT, franchises.code) AS StoreID ,
            CONVERT(BIGINT, franchises.code) AS StoreNumber ,
            100.00 AS PricingRatio ,
            CONVERT(VARCHAR(50), jobs.description) AS OrderDescription ,
            'PickedUp' AS Status ,
            InvoiceTotal.NumberItems ,
            ISNULL(FII_ODS.Contact.CustomerFact.CustomerID,
                   CONVERT(INT, REPLACE(vw_Contacts.CustomerID,
                                        StoreFact.ZW_Franchise_ID + ':A', ''))) AS CustomerID ,
            ISNULL(FII_ODS.Contact.ContactFact.ContactID,
                   CONVERT(INT, REPLACE(vw_Contacts.ContactID,
                                        StoreFact.ZW_Franchise_ID + ':', ''))) AS ContactID ,
            vw_Contacts.FirstName AS OrdererFirstName ,
            vw_Contacts.LastName AS OrdererLastName ,
            vw_Contacts.Title AS OrdererTitle ,
            '' AS OrdererPareaCode ,
            vw_Contacts.PhoneNumber AS OrdererPhoneNumber ,
            vw_Contacts.PhoneExtention AS OrdererPhoneExtention ,
            '' AS OrdererFareaCode ,
            vw_Contacts.FaxNumber AS OrdererFaxNumber ,
            vw_Contacts.Email AS OrdererEmailAddress ,
            0 AS OrderOriginID ,
            0.00 AS InterestAmount ,
            InvoiceTotal.Amount AS SalesTotal ,
            invoices.franchise_id AS ZW_Franchise_ID ,
            vw_Contacts.Email AS OrdererEmailAddress1 ,
            invoices.invoiced_on AS PickedUpDate ,
            vw_Customers.billingaddress1 ,
            vw_Customers.billingaddress2 ,
            vw_Customers.city ,
            vw_Customers.state ,
            vw_Customers.zip ,
            vw_Customers.companyname ,
            CountryName AS Country ,
            franchises.open_date AS StoreOpenDate ,
            Region AS [SalesRegionName] ,
            Store.CountryDim.[CountryCode]
        FROM
            MySQLStaging.dbo.invoices WITH ( NOLOCK )
            JOIN InvoiceTotal WITH ( NOLOCK ) ON invoices.invoice_id = InvoiceTotal.invoice_id
            JOIN MySQLStaging.dbo.jobs WITH ( NOLOCK ) ON invoices.job_id = jobs.job_id
                                                          AND invoices.created_on > @GPickedUpDate2
                                                          AND invoices.created_on < @LPickedUpDate2
            JOIN MySQLStaging.dbo.vw_Contacts WITH ( NOLOCK ) ON invoices.contact_entity_id = vw_Contacts.users_id
            JOIN MySQLStaging.dbo.vw_Customers WITH ( NOLOCK ) ON invoices.account_entity_id = vw_Customers.accounts_id
            JOIN MySQLStaging.dbo.franchises WITH ( NOLOCK ) ON invoices.franchise_id = franchises.franchise_id
            JOIN Store.StoreFact WITH ( NOLOCK ) ON invoices.franchise_id = StoreFact.ZW_Franchise_ID
            JOIN Store.CountryDim WITH ( NOLOCK ) ON StoreFact.CountryKey = CountryDim.CountryKey
            LEFT JOIN FII_ODS.Contact.ContactFact WITH ( NOLOCK ) ON FII_ODS.Contact.ContactFact.KeystoneContactKey = invoices.contact_entity_id
            LEFT JOIN FII_ODS.Contact.CustomerFact WITH ( NOLOCK ) ON FII_ODS.Contact.CustomerFact.KeystoneCustomerKey = FII_ODS.Contact.ContactFact.KeystoneCustomerKey
            LEFT OUTER JOIN System.SystinoSubmittedOrders sso WITH ( NOLOCK ) ON jobs.sequence = [sso].[OrderID]
                                                              AND InvoiceTotal.franchise_id = [sso].[FranchiseID]
        WHERE
            vw_Contacts.Email IS NOT NULL
            AND [sso].[Submitted] IS NULL
OPTION (OPTIMIZE FOR (@gpickedupdate2 UNKNOWN,@lpickedupdate2 UNKNOWN))

  

--GRANT EXECUTE ON dbo.SystinoOrders_Enum_ODS to [FASTSIGNS\app_systino_prod
GO
