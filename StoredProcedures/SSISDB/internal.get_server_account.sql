/****** Object:  StoredProcedure [internal].[get_server_account]    Script Date: 5/15/2018 12:13:12 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE [internal].[get_server_account]
	@account_name [internal].[adt_name] OUTPUT
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.ServerApi].[GetServerAccount]
GO
