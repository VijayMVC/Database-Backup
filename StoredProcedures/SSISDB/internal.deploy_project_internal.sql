/****** Object:  StoredProcedure [internal].[deploy_project_internal]    Script Date: 5/15/2018 12:13:11 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE [internal].[deploy_project_internal]
	@deploy_id [bigint],
	@version_id [bigint],
	@project_id [bigint],
	@project_name [nvarchar](128)
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.ServerApi].[DeployProjectInternal]
GO
