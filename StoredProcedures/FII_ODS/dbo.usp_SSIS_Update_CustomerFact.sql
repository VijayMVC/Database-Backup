/****** Object:  StoredProcedure [dbo].[usp_SSIS_Update_CustomerFact]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_Update_CustomerFact]
 AS UPDATE F SET 
 F.ZW_Franchise_ID = U.ZW_Franchise_ID 
 , F.CustomerID = U.CustomerID 
 , F.CompanyNameKey = U.CompanyNameKey 
 , F.DepartmentKey = U.DepartmentKey 
 , F.PrimaryContactID = U.PrimaryContactID 
 , F.PrimaryContactKey = U.PrimaryContactKey 
 , F.APContactID = U.APContactID 
 , F.APContactKey = U.APContactKey 
 , F.APSameAsPrimary = U.APSameAsPrimary 
 , F.SalesPersonID = U.SalesPersonID 
 , F.SalesPersonKey = U.SalesPersonKey 
 , F.PricingRatio = U.PricingRatio 
 , F.BillingAddress1 = U.BillingAddress1 
 , F.BillingAddress2 = U.BillingAddress2 
 , F.City = U.City 
 , F.State = U.State 
 , F.P2PhoneNumber = U.P2PhoneNumber 
 , F.ZipKey = U.ZipKey 
-- , F.CountyKey = U.CountyKey 
 , F.CountryKey = U.CountryKey 
 , F.CustomerTypeID = U.CustomerTypeID 
 , F.IndustryTypeID = U.IndustryTypeID 
 , F.OutstandingBalance = U.OutstandingBalance 
 , F.ChargeAccount = U.ChargeAccount 
 , F.CreditLimit = U.CreditLimit 
 , F.CreditLimitUsed = U.CreditLimitUsed 
 , F.CreditBalance = U.CreditBalance 
 , F.TaxExempt = U.TaxExempt 
 , F.TaxExemptNumber = U.TaxExemptNumber 
 , F.AlternateStateTax = U.AlternateStateTax 
 , F.AlternateCountyTax = U.AlternateCountyTax 
-- , F.NotesKey = U.NotesKey 
 , F.Prospect = U.Prospect 
 , F.CreateDate = U.CreateDate 
-- , F.ImportBatchKey = U.ImportBatchKey 
 , F.FirstOrderDate = U.FirstOrderDate 
 , F.LastOrderDate = U.LastOrderDate 
 , F.LastPickedUpDate = U.LastPickedUpDate 
 , F.LastEstimateDate = U.LastEstimateDate 
 , F.LastStatementDate = U.LastStatementDate 
 , F.LastContact1 = U.LastContact1 
 , F.LastContact2 = U.LastContact2 
 , F.LastContact3 = U.LastContact3 
 , F.LastContact4 = U.LastContact4 
 , F.LastContact5 = U.LastContact5 
 , F.TaxRegion = U.TaxRegion 
 , F.ImportDate = U.ImportDate 
-- , F.FlagsKey = U.FlagsKey 
 , F.ActiveCustomer = U.ActiveCustomer 
 , F.PaymentTerms = U.PaymentTerms 
 , F.LastContactDate = U.LastContactDate 
 --, F.MarketingFlag6 = U.MarketingFlag6 
 --, F.MarketingFlag7 = U.MarketingFlag7 
 --, F.MarketingFlag8 = U.MarketingFlag8 
 --, F.MarketingFlag9 = U.MarketingFlag9 
 --, F.MarketingFlag10 = U.MarketingFlag10 
 --, F.MarketingFlag11 = U.MarketingFlag11 
 --, F.MarketingFlag12 = U.MarketingFlag12 
 --, F.MarketingFlag13 = U.MarketingFlag13 
 --, F.MarketingFlag14 = U.MarketingFlag14 
 --, F.MarketingFlag15 = U.MarketingFlag15 
 --, F.MarketingFlag16 = U.MarketingFlag16 
 --, F.MarketingFlag17 = U.MarketingFlag17 
 --, F.MarketingFlag18 = U.MarketingFlag18 
 --, F.MarketingFlag19 = U.MarketingFlag19 
 --, F.MarketingFlag20 = U.MarketingFlag20 
 --, F.MarketingFlag21 = U.MarketingFlag21 
 --, F.MarketingFlag22 = U.MarketingFlag22 
 --, F.MarketingFlag23 = U.MarketingFlag23 
 --, F.MarketingFlag24 = U.MarketingFlag24 
 --, F.MarketingFlag25 = U.MarketingFlag25 
 --, F.MktgList1Key = U.MktgList1Key 
 --, F.MktgList2Key = U.MktgList2Key 
 , F.ChargeStatusDate = U.ChargeStatusDate 
 , F.PORequired = U.PORequired 
 , F.OLTP_InsertDate = U.OLTP_InsertDate 
 , F.OLTP_UpdateDate = U.OLTP_UpdateDate 
 , F.UpdateCheckSum = U.UpdateCheckSum 
 , F.URL = U.URL
 , F.TaxIDExpDate = U.TaxIDExpDate
 , F.KeystoneCustomerKey = U.KeystoneCustomerKey
FROM [Staging].[dbo].[CustomerFactUpdate] U 
     JOIN [Contact].[CustomerFact] F ON U.CustomerKey = F.CustomerKey 
 WHERE U.CustomerKey > 0 

UPDATE FM SET [IsModified] = 1
FROM [Staging].[dbo].[CustomerFactUpdate] U 
 	 JOIN [Contact].[FastMailDim] FM ON U.CustomerKey = FM.CustomerKey
 WHERE U.CenterKey > 0 

INSERT INTO  [Contact].[CustomerFact] 
    ( ZW_Franchise_ID 
 , CustomerID 
 , CompanyNameKey 
 , DepartmentKey 
 , PrimaryContactID 
 , PrimaryContactKey 
 , APContactID 
 , APContactKey 
 , APSameAsPrimary 
 , SalesPersonID 
 , SalesPersonKey 
 , PricingRatio 
 , BillingAddress1 
 , BillingAddress2 
 , City 
 , State 
 , P2PhoneNumber 
 , ZipKey 
-- , CountyKey 
 , CountryKey 
 , CustomerTypeID 
 , IndustryTypeID 
 , OutstandingBalance 
 , ChargeAccount 
 , CreditLimit 
 , CreditLimitUsed 
 , CreditBalance 
 , TaxExempt 
 , TaxExemptNumber 
 , AlternateStateTax 
 , AlternateCountyTax 
-- , NotesKey 
 , Prospect 
 , CreateDate 
-- , ImportBatchKey 
 , FirstOrderDate 
 , LastOrderDate 
 , LastPickedUpDate 
 , LastEstimateDate 
 , LastStatementDate 
 , LastContact1 
 , LastContact2 
 , LastContact3 
 , LastContact4 
 , LastContact5 
 , TaxRegion 
 , ImportDate 
-- , FlagsKey 
 , ActiveCustomer 
 , PaymentTerms 
 , LastContactDate 
 --, MarketingFlag6 
 --, MarketingFlag7 
 --, MarketingFlag8 
 --, MarketingFlag9 
 --, MarketingFlag10 
 --, MarketingFlag11 
 --, MarketingFlag12 
 --, MarketingFlag13 
 --, MarketingFlag14 
 --, MarketingFlag15 
 --, MarketingFlag16 
 --, MarketingFlag17 
 --, MarketingFlag18 
 --, MarketingFlag19 
 --, MarketingFlag20 
 --, MarketingFlag21 
 --, MarketingFlag22 
 --, MarketingFlag23 
 --, MarketingFlag24 
 --, MarketingFlag25 
 --, MktgList1Key 
 --, MktgList2Key 
 , ChargeStatusDate 
 , PORequired 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum 
 , CenterKey
 , URL 
 , TaxIDExpDate
 , KeystoneCustomerKey
 ) SELECT ZW_Franchise_ID 
 , CustomerID 
 , CompanyNameKey 
 , DepartmentKey 
 , PrimaryContactID 
 , PrimaryContactKey 
 , APContactID 
 , APContactKey 
 , APSameAsPrimary 
 , SalesPersonID 
 , SalesPersonKey 
 , PricingRatio 
 , BillingAddress1 
 , BillingAddress2 
 , City 
 , State 
 , P2PhoneNumber 
 , ZipKey 
-- , CountyKey 
 , CountryKey 
 , CustomerTypeID 
 , IndustryTypeID 
 , OutstandingBalance 
 , ChargeAccount 
 , CreditLimit 
 , CreditLimitUsed 
 , CreditBalance 
 , TaxExempt 
 , TaxExemptNumber 
 , AlternateStateTax 
 , AlternateCountyTax 
-- , NotesKey 
 , Prospect 
 , CreateDate 
-- , ImportBatchKey 
 , FirstOrderDate 
 , LastOrderDate 
 , LastPickedUpDate 
 , LastEstimateDate 
 , LastStatementDate 
 , LastContact1 
 , LastContact2 
 , LastContact3 
 , LastContact4 
 , LastContact5 
 , TaxRegion 
 , ImportDate 
-- , FlagsKey 
 , ActiveCustomer 
 , PaymentTerms 
 , LastContactDate 
 --, MarketingFlag6 
 --, MarketingFlag7 
 --, MarketingFlag8 
 --, MarketingFlag9 
 --, MarketingFlag10 
 --, MarketingFlag11 
 --, MarketingFlag12 
 --, MarketingFlag13 
 --, MarketingFlag14 
 --, MarketingFlag15 
 --, MarketingFlag16 
 --, MarketingFlag17 
 --, MarketingFlag18 
 --, MarketingFlag19 
 --, MarketingFlag20 
 --, MarketingFlag21 
 --, MarketingFlag22 
 --, MarketingFlag23 
 --, MarketingFlag24 
 --, MarketingFlag25 
 --, MktgList1Key 
 --, MktgList2Key 
 , ChargeStatusDate 
 , PORequired 
 , OLTP_InsertDate 
 , OLTP_UpdateDate 
 , UpdateCheckSum 
 , CenterKey
 , URL 
 , TaxIDExpDate
 , KeystoneCustomerKey
 FROM [Staging].[dbo].[CustomerFactUpdate] WHERE CustomerKey = 0 AND CenterKey IS NOT null

TRUNCATE TABLE Staging.dbo.CustomerFactUpdate 
-- Keystone update CuspomerID
UPDATE [Contact].[CustomerFact] SET CustomerID = CustomerKey 
--SELECT * from [Contact].[CustomerFact] 
WHERE CustomerID IS NULL AND LEN(KeystoneCustomerKey)=32

GO
