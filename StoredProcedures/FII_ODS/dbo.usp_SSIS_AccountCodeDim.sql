/****** Object:  StoredProcedure [dbo].[usp_SSIS_AccountCodeDim]    Script Date: 5/15/2018 12:09:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_AccountCodeDim]
 AS 
-- INSERT [GL].[DescriptionDim] table
INSERT INTO [GL].[DescriptionDim](
  [DescriptionName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [Description] AS [DescriptionName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AccountCodeDim] 
  WHERE [Description] NOT IN ( SELECT ISNULL([DescriptionName],'') FROM [GL].[DescriptionDim] )

-- INSERT [GL].[TextDim] table
INSERT INTO [GL].[TextDim](
  [TextName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [Text] AS [TextName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AccountCodeDim] 
  WHERE [Text] NOT IN ( SELECT ISNULL([TextName],'') FROM [GL].[TextDim] )

-- INSERT [GL].[BaseTextDim] table
INSERT INTO [GL].[BaseTextDim](
  [BaseTextName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [BaseText] AS [BaseTextName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AccountCodeDim] 
  WHERE [BaseText] NOT IN ( SELECT ISNULL([BaseTextName],'') FROM [GL].[BaseTextDim] )

-- INSERT [GL].[ModifierTextDim] table
INSERT INTO [GL].[ModifierTextDim](
  [ModifierTextName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [ModifierText] AS [ModifierTextName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AccountCodeDim] 
  WHERE [ModifierText] NOT IN ( SELECT ISNULL([ModifierTextName],'') FROM [GL].[ModifierTextDim] )

-- INSERT [GL].[DiscountTextDim] table
INSERT INTO [GL].[DiscountTextDim](
  [DiscountTextName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [DiscountText] AS [DiscountTextName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AccountCodeDim] 
  WHERE [DiscountText] NOT IN ( SELECT ISNULL([DiscountTextName],'') FROM [GL].[DiscountTextDim] )

-- INSERT [GL].[InstallTextDim] table
INSERT INTO [GL].[InstallTextDim](
  [InstallTextName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [InstallText] AS [InstallTextName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AccountCodeDim] 
  WHERE [InstallText] NOT IN ( SELECT ISNULL([InstallTextName],'') FROM [GL].[InstallTextDim] )


GO
