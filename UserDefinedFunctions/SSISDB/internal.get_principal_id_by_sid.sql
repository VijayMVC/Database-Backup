/****** Object:  UserDefinedFunction [internal].[get_principal_id_by_sid]    Script Date: 5/15/2018 12:15:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE FUNCTION [internal].[get_principal_id_by_sid]
(
        @sid        [internal].[adt_sid] 
)
RETURNS INT
AS
BEGIN
	DECLARE @Result INT
	select @Result = [principal_id] from [sys].[database_principals] where [sid]=@sid;
	RETURN @Result
END


GO
