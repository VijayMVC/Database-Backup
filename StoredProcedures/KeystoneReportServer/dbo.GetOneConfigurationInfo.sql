/****** Object:  StoredProcedure [dbo].[GetOneConfigurationInfo]    Script Date: 5/15/2018 12:09:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[GetOneConfigurationInfo]
@Name nvarchar (260)
AS
SELECT [Value]
FROM [ConfigurationInfo]
WHERE [Name] = @Name

GO
