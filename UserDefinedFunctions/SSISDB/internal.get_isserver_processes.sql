/****** Object:  UserDefinedFunction [internal].[get_isserver_processes]    Script Date: 5/15/2018 12:15:14 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE FUNCTION [internal].[get_isserver_processes]()
RETURNS  TABLE (
	[process_id] [bigint] NULL
) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.StartupApi].[GetISServerProcesses]
GO
