/****** Object:  StoredProcedure [dbo].[GetAllConfigurationInfo]    Script Date: 5/15/2018 12:11:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[GetAllConfigurationInfo]
AS
SELECT [Name], [Value]
FROM [ConfigurationInfo]

GO
