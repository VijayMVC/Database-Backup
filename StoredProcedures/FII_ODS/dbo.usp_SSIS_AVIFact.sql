/****** Object:  StoredProcedure [dbo].[usp_SSIS_AVIFact]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_AVIFact]
 AS 
-- INSERT [Product].[AVCodeDim] table
INSERT INTO [Product].[AVCodeDim](
  [AVCodeName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [AVCode] AS [AVCodeName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AVIFact] 
  WHERE [AVCode] NOT IN ( SELECT [AVCodeName] FROM [Product].[AVCodeDim] )

-- INSERT [Product].[PrintAsDim] table
INSERT INTO [Product].[PrintAsDim](
  [PrintAsName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [PrintAs] AS [PrintAsName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AVIFact] 
  WHERE [PrintAs] NOT IN ( SELECT [PrintAsName] FROM [Product].[PrintAsDim] )

-- INSERT [Product].[DescriptionDim] table
INSERT INTO [Product].[DescriptionDim](
  [DescriptionName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [Description] AS [DescriptionName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AVIFact] 
  WHERE [Description] NOT IN ( SELECT [DescriptionName] FROM [Product].[DescriptionDim] )

-- INSERT [Product].[QuestionDim] table
INSERT INTO [Product].[QuestionDim](
  [QuestionName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [Question] AS [QuestionName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[AVIFact] 
  WHERE [Question] NOT IN ( SELECT [QuestionName] FROM [Product].[QuestionDim] )


GO
