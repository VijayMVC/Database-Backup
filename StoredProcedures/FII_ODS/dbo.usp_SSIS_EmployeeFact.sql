/****** Object:  StoredProcedure [dbo].[usp_SSIS_EmployeeFact]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_EmployeeFact]
 AS 
-- INSERT [Contact].[ZipDim] table
INSERT INTO [Contact].[ZipDim](
  [ZipName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [Zip] AS [ZipName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[EmployeeFact] 
  WHERE [Zip] NOT IN ( SELECT [ZipName] FROM [Contact].[ZipDim] WHERE [ZipName] IS NOT NULL )

-- INSERT [Contact].[DepartmentDim] table
INSERT INTO [Contact].[DepartmentDim](
  [DepartmentName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [Department] AS [DepartmentName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[EmployeeFact] 
  WHERE [Department] NOT IN ( SELECT [DepartmentName] FROM [Contact].[DepartmentDim] WHERE [DepartmentName] IS NOT NULL )


GO
