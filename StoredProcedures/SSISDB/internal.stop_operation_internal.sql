/****** Object:  StoredProcedure [internal].[stop_operation_internal]    Script Date: 5/15/2018 12:13:12 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE [internal].[stop_operation_internal]
	@operation_id [bigint],
	@process_id [int],
	@operation_guid [uniqueidentifier]
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.ServerApi].[StopOperationInternal]
GO
