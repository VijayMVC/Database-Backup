/****** Object:  StoredProcedure [internal].[create_key_information]    Script Date: 5/15/2018 12:13:11 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE [internal].[create_key_information]
	@algorithm_name [nvarchar](255),
	@key [varbinary](8000) OUTPUT,
	@IV [varbinary](8000) OUTPUT
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.Security.CryptoGraphy].[CreateKeyInformation]
GO
