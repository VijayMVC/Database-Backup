/****** Object:  StoredProcedure [internal].[set_system_informations]    Script Date: 5/15/2018 12:13:12 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE [internal].[set_system_informations]
	@operation_id [bigint]
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.SystemInformations].[SetSystemInformations]
GO
