/****** Object:  View [dbo].[SSIS_CustomerFact_StageLoad]    Script Date: 5/15/2018 12:13:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON






CREATE VIEW [dbo].[SSIS_CustomerFact_StageLoad]
 AS 
SELECT [Staging].[dbo].[CustomerFact].* 
   ,CompanyNameKey 
   , [Contact].[DepartmentDim].DepartmentKey 
   ,[Contact].[ZipDim].ZipKey 
   ,CountyKey 
   , [Contact].[CountryDim].CountryKey 
   ,NotesKey 
   ,ImportBatchKey 
   ,FlagsKey 
   ,MktgList1Key 
   ,MktgList2Key
   ,Store.CenterKey
   ,ISNULL(Employee.EmployeeKey,-255) AS SalesPersonKey
   ,ISNULL(Contact.ContactKey,-255) AS PrimaryContactKey
FROM [Staging].[dbo].[CustomerFact]
LEFT JOIN [Contact].[CompanyNameDim]  ON [Contact].[CompanyNameDim].[CompanyNameName]=[CustomerFact].[CompanyName] 
LEFT JOIN [Contact].[DepartmentDim]  ON [Contact].[DepartmentDim].[DepartmentName]=[CustomerFact].[Department] 
LEFT JOIN [Contact].[ZipDim]  ON [Contact].[ZipDim].[ZipName]=[CustomerFact].[Zip] 
LEFT JOIN [Contact].[CountyDim]  ON [Contact].[CountyDim].[CountyName]=[CustomerFact].[County] 
LEFT JOIN [Contact].[CountryDim]  ON [Contact].[CountryDim].[CountryName]=[CustomerFact].[Country] 
LEFT JOIN [Contact].[NotesDim]  ON [Contact].[NotesDim].[NotesName]=[CustomerFact].[Notes] 
LEFT JOIN [Contact].[ImportBatchDim]  ON [Contact].[ImportBatchDim].[ImportBatchName]=[CustomerFact].[ImportBatch] 
LEFT JOIN [Contact].[FlagsDim]  ON [Contact].[FlagsDim].[FlagsName]=[CustomerFact].[Flags] 
LEFT JOIN [Contact].[MktgList1Dim]  ON [Contact].[MktgList1Dim].[MktgList1Name]=[CustomerFact].[MktgList1] 
LEFT JOIN [Contact].[MktgList2Dim]  ON [Contact].[MktgList2Dim].[MktgList2Name]=[CustomerFact].[MktgList2] 
LEFT JOIN Store.StoreFact Store on  CustomerFact.ZW_Franchise_ID = Store.ZW_Franchise_ID
LEFT JOIN Contact.EmployeeFact Employee  ON Store.CenterKey = Employee.CenterKey AND Employee.EmployeeID = SalesPersonID
LEFT JOIN contact.ContactFact Contact  ON Store.CenterKey = Contact.CenterKey AND Contact.ContactID = PrimaryContactID






GO
