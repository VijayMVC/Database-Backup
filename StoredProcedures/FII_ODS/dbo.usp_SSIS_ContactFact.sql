/****** Object:  StoredProcedure [dbo].[usp_SSIS_ContactFact]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_ContactFact]
 AS 
-- INSERT [Contact].[AlternateAddressDim] table
INSERT INTO [Contact].[AlternateAddressDim](
  [AlternateAddressName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [AlternateAddress] AS [AlternateAddressName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[ContactFact] 
  WHERE [AlternateAddress] NOT IN ( SELECT [AlternateAddressName] FROM [Contact].[AlternateAddressDim] WHERE [AlternateAddressName] IS NOT NULL )


GO
