/****** Object:  View [dbo].[SSIS_CustomerFact_StageLoad_COR]    Script Date: 5/15/2018 12:13:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE VIEW [dbo].[SSIS_CustomerFact_StageLoad_COR]
 AS 
SELECT [Staging].[dbo].[CustomerFact].* 
   ,CompanyNameKey 
   ,[Contact].[DepartmentDim].DepartmentKey 
   ,[Contact].[ZipDim].ZipKey 
   ,CountyKey 
   , [Contact].[CountryDim].CountryKey 
   --,NotesKey 
   --,ImportBatchKey 
   --,FlagsKey 
   --,MktgList1Key 
   --,MktgList2Key
   ,Store.CenterKey
   --,ISNULL(Employee.EmployeeKey,-255) AS SalesPersonKey
   --,ISNULL(Contact.ContactKey,-255) AS PrimaryContactKey
   ,Contact.IndustryTypeDim.IndustryTypeKey
FROM [Staging].[dbo].[CustomerFact] 
LEFT JOIN [Contact].[CompanyNameDim] WITH (NOLOCK) ON [Contact].[CompanyNameDim].[CompanyNameName]=[CustomerFact].[CompanyName] 
LEFT JOIN [Contact].[DepartmentDim] WITH (NOLOCK) ON [Contact].[DepartmentDim].[DepartmentName]=[CustomerFact].[Department] 
LEFT JOIN [Contact].[ZipDim] WITH (NOLOCK) ON [Contact].[ZipDim].[ZipName]=[CustomerFact].[Zip] 
LEFT JOIN [Contact].[CountyDim] WITH (NOLOCK) ON [Contact].[CountyDim].[CountyName]=[CustomerFact].[County] 
LEFT JOIN [Contact].[CountryDim] WITH (NOLOCK) ON [Contact].[CountryDim].[CountryName]=[CustomerFact].[Country] 
--LEFT JOIN [Contact].[NotesDim] WITH (NOLOCK) ON [Contact].[NotesDim].[NotesName]=[CustomerFact].[Notes] 
--LEFT JOIN [Contact].[ImportBatchDim] WITH (NOLOCK) ON [Contact].[ImportBatchDim].[ImportBatchName]=[CustomerFact].[ImportBatch] 
--LEFT JOIN [Contact].[FlagsDim] WITH (NOLOCK) ON [Contact].[FlagsDim].[FlagsName]=[CustomerFact].[Flags] 
--LEFT JOIN [Contact].[MktgList1Dim] WITH (NOLOCK) ON [Contact].[MktgList1Dim].[MktgList1Name]=[CustomerFact].[MktgList1] 
--LEFT JOIN [Contact].[MktgList2Dim] WITH (NOLOCK) ON [Contact].[MktgList2Dim].[MktgList2Name]=[CustomerFact].[MktgList2] 
LEFT JOIN Store.StoreFact Store WITH (NOLOCK) ON CustomerFact.ZW_Franchise_ID = Store.ZW_Franchise_ID
--LEFT JOIN Contact.EmployeeFact Employee WITH (NOLOCK) ON Store.CenterKey = Employee.CenterKey AND Employee.EmployeeID = SalesPersonID
--LEFT JOIN contact.ContactFact Contact WITH (NOLOCK) ON Store.CenterKey = Contact.CenterKey AND Contact.ContactID = PrimaryContactID
LEFT JOIN Contact.IndustryTypeDim ON contact.IndustryTypeDim.IndustryTypeName=IndustryType




GO
