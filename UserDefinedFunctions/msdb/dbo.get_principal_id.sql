/****** Object:  UserDefinedFunction [dbo].[get_principal_id]    Script Date: 5/15/2018 12:14:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE FUNCTION dbo.get_principal_id(@principal_sid varbinary(85))
RETURNS int
AS
BEGIN
    DECLARE @principal_id int
    SELECT @principal_id=principal_id FROM msdb.sys.database_principals WHERE sid=@principal_sid
    RETURN @principal_id
END

GO
