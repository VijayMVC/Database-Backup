/****** Object:  UserDefinedFunction [internal].[is_valid_name]    Script Date: 5/15/2018 12:15:14 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE FUNCTION [internal].[is_valid_name](@object_name [nvarchar](max))
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.ServerApi].[IsValidName]
GO
