/****** Object:  UserDefinedFunction [internal].[convert_value]    Script Date: 5/15/2018 12:15:13 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE FUNCTION [internal].[convert_value](@origin_value [sql_variant], @data_type [nvarchar](128))
RETURNS [sql_variant] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.ServerApi].[ConvertValue]
GO
