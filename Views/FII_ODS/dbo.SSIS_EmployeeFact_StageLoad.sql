/****** Object:  View [dbo].[SSIS_EmployeeFact_StageLoad]    Script Date: 5/15/2018 12:13:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[SSIS_EmployeeFact_StageLoad]
 AS 
SELECT [Staging].[dbo].[EmployeeFact].* 
   ,ZipKey 
   ,DepartmentKey, Store.CenterKey 
FROM [Staging].[dbo].[EmployeeFact] 
LEFT JOIN [Contact].[ZipDim] WITH (NOLOCK) ON [Contact].[ZipDim].[ZipName]=[EmployeeFact].[Zip] 
LEFT JOIN [Contact].[DepartmentDim] WITH (NOLOCK) ON [Contact].[DepartmentDim].[DepartmentName]=[EmployeeFact].[Department] 
LEFT JOIN Store.StoreFact Store WITH (NOLOCK) ON [Staging].[dbo].[EmployeeFact].ZW_Franchise_ID = Store.ZW_Franchise_ID


GO
