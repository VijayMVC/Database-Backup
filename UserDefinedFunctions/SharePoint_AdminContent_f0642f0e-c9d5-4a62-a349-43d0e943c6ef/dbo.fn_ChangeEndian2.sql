/****** Object:  UserDefinedFunction [dbo].[fn_ChangeEndian2]    Script Date: 5/15/2018 12:15:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_ChangeEndian2(@in smallint)
RETURNS binary(2)
AS
BEGIN
    DECLARE @unsigned int
    SET @unsigned = @in
    IF @unsigned < 0
        SET @unsigned = @unsigned + 0x10000
    RETURN (@unsigned%256)*256 + @unsigned/256
END

GO
