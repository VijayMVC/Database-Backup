/****** Object:  View [dbo].[SSIS_AccountCodeDim_StageLoad]    Script Date: 5/15/2018 12:13:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[SSIS_AccountCodeDim_StageLoad]
 AS 
SELECT [Staging].[dbo].[AccountCodeDim].* 
   ,DescriptionKey 
   ,TextKey 
   ,BaseTextKey 
   ,ModifierTextKey 
   ,DiscountTextKey 
   ,InstallTextKey,
   StoreFact.CenterKey 
FROM [Staging].[dbo].[AccountCodeDim] WITH (NOLOCK)
LEFT JOIN [GL].[DescriptionDim] WITH (NOLOCK) ON [GL].[DescriptionDim].[DescriptionName]=[AccountCodeDim].[Description] 
LEFT JOIN [GL].[TextDim] WITH (NOLOCK) ON [GL].[TextDim].[TextName]=[AccountCodeDim].[Text] 
LEFT JOIN [GL].[BaseTextDim] WITH (NOLOCK) ON [GL].[BaseTextDim].[BaseTextName]=[AccountCodeDim].[BaseText] 
LEFT JOIN [GL].[ModifierTextDim] WITH (NOLOCK) ON [GL].[ModifierTextDim].[ModifierTextName]=[AccountCodeDim].[ModifierText] 
LEFT JOIN [GL].[DiscountTextDim] WITH (NOLOCK) ON [GL].[DiscountTextDim].[DiscountTextName]=[AccountCodeDim].[DiscountText] 
LEFT JOIN [GL].[InstallTextDim] WITH (NOLOCK) ON [GL].[InstallTextDim].[InstallTextName]=[AccountCodeDim].[InstallText] 
LEFT JOIN Store.StoreFact WITH (NOLOCK) ON AccountCodeDim.ZW_Franchise_ID = StoreFact.ZW_Franchise_ID


GO
