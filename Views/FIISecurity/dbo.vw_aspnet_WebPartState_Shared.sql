/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 5/15/2018 12:13:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
