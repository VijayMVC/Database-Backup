/****** Object:  StoredProcedure [internal].[create_execution_dump_internal]    Script Date: 5/15/2018 12:13:11 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE [internal].[create_execution_dump_internal]
	@execution_id [bigint]
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.ServerApi].[CreateExecutionDumpInternal]
GO
