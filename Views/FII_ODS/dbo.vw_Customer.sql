/****** Object:  View [dbo].[vw_Customer]    Script Date: 5/15/2018 12:13:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE VIEW [dbo].[vw_Customer] AS 
SELECT 
	Contact.CustomerFact.CustomerKey,
    Contact.CustomerFact.CustomerID ,
    Contact.CustomerFact.ZW_Franchise_ID ,
    Contact.CompanyNameDim.CompanyNameName AS CompanyName ,
    Contact.DepartmentDim.DepartmentName ,
    Contact.CustomerFact.PrimaryContactID ,
    Contact.CustomerFact.APContactID ,
    Contact.CustomerFact.SalesPersonID ,
    Contact.CustomerFact.PricingRatio ,
    Contact.CustomerFact.BillingAddress1 ,
    Contact.CustomerFact.BillingAddress2 ,
    Contact.CustomerFact.City ,
    Contact.CustomerFact.State ,
    Contact.ZipDim.ZipName ,
    Contact.CountyDim.CountyName ,
    Contact.CountryDim.CountryName ,
    Contact.CustomerFact.CustomerTypeID ,
    Contact.CustomerFact.IndustryTypeID ,
    Contact.CustomerFact.OutstandingBalance ,
    Contact.CustomerFact.ChargeAccount ,
    Contact.CustomerFact.CreditLimit ,
    Contact.CustomerFact.CreditLimitUsed ,
    Contact.CustomerFact.CreditBalance ,
    Contact.CustomerFact.TaxExempt ,
    Contact.CustomerFact.TaxExemptNumber ,
    Contact.CustomerFact.AlternateStateTax ,
    Contact.CustomerFact.AlternateCountyTax ,
    Contact.NotesDim.NotesName ,
    Contact.CustomerFact.Prospect ,
    Contact.CustomerFact.CreateDate ,
    Contact.ImportBatchDim.ImportBatchName ,
    Contact.CustomerFact.FirstOrderDate ,
    Contact.CustomerFact.LastOrderDate ,
    Contact.CustomerFact.LastPickedUpDate ,
    Contact.CustomerFact.LastEstimateDate ,
    Contact.CustomerFact.LastStatementDate ,
    Contact.CustomerFact.LastContact1 ,
    Contact.CustomerFact.LastContact2 ,
    Contact.CustomerFact.LastContact3 ,
    Contact.CustomerFact.LastContact4 ,
    Contact.CustomerFact.TaxRegion ,
    Contact.CustomerFact.ImportDate ,
    Contact.FlagsDim.FlagsName ,
    Contact.CustomerFact.ActiveCustomer ,
    Contact.CustomerFact.PaymentTerms ,
    Contact.CustomerFact.LastContactDate ,
    Contact.CustomerFact.MarketingFlag6 ,
    Contact.CustomerFact.MarketingFlag7 ,
    Contact.CustomerFact.MarketingFlag8 ,
    Contact.CustomerFact.MarketingFlag9 ,
    Contact.CustomerFact.MarketingFlag10 ,
    Contact.CustomerFact.MarketingFlag11 ,
    Contact.CustomerFact.MarketingFlag12 ,
    Contact.CustomerFact.MarketingFlag13 ,
    Contact.CustomerFact.MarketingFlag14 ,
    Contact.CustomerFact.MarketingFlag15 ,
    Contact.CustomerFact.MarketingFlag16 ,
    Contact.CustomerFact.MarketingFlag17 ,
    Contact.CustomerFact.MarketingFlag18 ,
    Contact.CustomerFact.MarketingFlag19 ,
    Contact.CustomerFact.MarketingFlag20 ,
    Contact.CustomerFact.MarketingFlag21 ,
    Contact.CustomerFact.MarketingFlag22 ,
    Contact.CustomerFact.MarketingFlag23 ,
    Contact.CustomerFact.MarketingFlag24 ,
    Contact.CustomerFact.MarketingFlag25 ,
    Contact.MktgList1Dim.MktgList1Name ,
    Contact.MktgList2Dim.MktgList2Name ,
    Contact.CustomerFact.ChargeStatusDate ,
    Contact.CustomerFact.PORequired ,
    Contact.EmployeeFact.FirstName AS SalesPersonFirstName ,
    Contact.EmployeeFact.LastName AS SalesPersonLastName
FROM
    Contact.CustomerFact   WITH ( NOLOCK ) 
    LEFT JOIN Contact.ZipDim   WITH ( NOLOCK ) ON ZipDim.ZipKey = Contact.CustomerFact.ZipKey
	LEFT JOIN Contact.EmployeeFact   WITH ( NOLOCK ) ON Contact.CustomerFact.SalesPersonID = Contact.EmployeeFact.EmployeeID
                                       AND Contact.CustomerFact.ZW_Franchise_ID = Contact.EmployeeFact.ZW_Franchise_ID
    LEFT JOIN Contact.MktgList2Dim   WITH ( NOLOCK ) ON Contact.MktgList2Dim.MktgList2Key = Contact.CustomerFact.MktgList2Key
    LEFT JOIN Contact.CompanyNameDim   WITH ( NOLOCK ) ON Contact.CustomerFact.CompanyNameKey = Contact.CompanyNameDim.CompanyNameKey
    LEFT JOIN Contact.CountryDim   WITH ( NOLOCK ) ON Contact.CustomerFact.CountryKey = Contact.CountryDim.CountryKey
    LEFT JOIN Contact.CountyDim   WITH ( NOLOCK ) ON Contact.CustomerFact.CountyKey = Contact.CountyDim.CountyKey
    LEFT JOIN Contact.DepartmentDim   WITH ( NOLOCK ) ON Contact.CustomerFact.DepartmentKey = Contact.DepartmentDim.DepartmentKey 
    LEFT JOIN Contact.FlagsDim   WITH ( NOLOCK ) ON Contact.CustomerFact.FlagsKey = Contact.FlagsDim.FlagsKey
    LEFT JOIN Contact.ImportBatchDim   WITH ( NOLOCK ) ON Contact.CustomerFact.ImportBatchKey = Contact.ImportBatchDim.ImportBatchKey
    LEFT JOIN Contact.MktgList1Dim   WITH ( NOLOCK ) ON Contact.CustomerFact.MktgList1Key = Contact.MktgList1Dim.MktgList1Key
    LEFT JOIN Contact.NotesDim   WITH ( NOLOCK ) ON Contact.CustomerFact.NotesKey = Contact.NotesDim.NotesKey



GO
