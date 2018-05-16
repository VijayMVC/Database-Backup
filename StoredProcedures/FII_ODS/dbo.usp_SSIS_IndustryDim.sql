/****** Object:  StoredProcedure [dbo].[usp_SSIS_IndustryDim]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_IndustryDim]
 AS 
-- INSERT [Contact].[IndustryTypeDim] table
INSERT INTO [Contact].[IndustryTypeDim](
  [IndustryTypeName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [IndustryType] AS [IndustryTypeName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[IndustryDim] 
  WHERE [IndustryType] NOT IN ( SELECT [IndustryTypeName] FROM [Contact].[IndustryTypeDim] WHERE [IndustryTypeName] IS NOT NULL  )


GO
