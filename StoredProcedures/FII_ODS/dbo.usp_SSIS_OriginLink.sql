/****** Object:  StoredProcedure [dbo].[usp_SSIS_OriginLink]    Script Date: 5/15/2018 12:09:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE PROCEDURE [dbo].[usp_SSIS_OriginLink]
 AS 
-- INSERT [Orders].[OriginTypeDim] table
INSERT INTO [Orders].[OriginTypeDim](
  [OriginTypeName] ,
  [IsValid] ) 
 SELECT DISTINCT 
  [OriginTypeName] AS [OriginTypeName] ,
  1 as IsVaild 
FROM [Staging].[dbo].[OriginType] 
  WHERE [OriginTypeName] NOT IN ( SELECT [OriginTypeName] FROM [Orders].[OriginTypeDim] )


GO
