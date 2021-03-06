/****** Object:  View [dbo].[SSIS_EstimateDetailFact_StageLoad]    Script Date: 5/15/2018 12:13:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[SSIS_EstimateDetailFact_StageLoad]
 AS 
SELECT [Staging].[dbo].[EstimateDetailFact].* 
   ,ProductCodeKey 
   ,ForegroundColorKey 
   ,BackgroundColorKey 
   ,FontKey 
   ,DescriptionKey 
   ,SignTextKey 
   ,AVAdditionalDescriptionKey 
   ,ProductionNotesKey 
FROM [Staging].[dbo].[EstimateDetailFact] WITH (NOLOCK)
LEFT JOIN [Estimate].[ProductCodeDim] WITH (NOLOCK) ON [Estimate].[ProductCodeDim].[ProductCodeName]=[EstimateDetailFact].[ProductCode] 
LEFT JOIN [Estimate].[ForegroundColorDim] WITH (NOLOCK) ON [Estimate].[ForegroundColorDim].[ForegroundColorName]=[EstimateDetailFact].[ForegroundColor] 
LEFT JOIN [Estimate].[BackgroundColorDim] WITH (NOLOCK) ON [Estimate].[BackgroundColorDim].[BackgroundColorName]=[EstimateDetailFact].[BackgroundColor] 
LEFT JOIN [Estimate].[FontDim] WITH (NOLOCK) ON [Estimate].[FontDim].[FontName]=[EstimateDetailFact].[Font] 
LEFT JOIN [Estimate].[DescriptionDim] WITH (NOLOCK) ON [Estimate].[DescriptionDim].[DescriptionName]=[EstimateDetailFact].[Description] 
LEFT JOIN [Estimate].[SignTextDim] WITH (NOLOCK) ON [Estimate].[SignTextDim].[SignTextName]=[EstimateDetailFact].[SignText] 
LEFT JOIN [Estimate].[AVAdditionalDescriptionDim] WITH (NOLOCK) ON [Estimate].[AVAdditionalDescriptionDim].[AVAdditionalDescriptionName]=[EstimateDetailFact].[AVAdditionalDescription] 
LEFT JOIN [Estimate].[ProductionNotesDim] WITH (NOLOCK) ON [Estimate].[ProductionNotesDim].[ProductionNotesName]=[EstimateDetailFact].[ProductionNotes] 



GO
