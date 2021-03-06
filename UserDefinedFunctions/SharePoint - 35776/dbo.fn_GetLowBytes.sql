/****** Object:  UserDefinedFunction [dbo].[fn_GetLowBytes]    Script Date: 5/15/2018 12:15:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_GetLowBytes(@in bigint)
RETURNS int
AS
BEGIN
    DECLARE @low  bigint
    SET @low =  @in%0x100000000
    IF @in < 0 AND @low < 0
        SET @low = @low + 0x100000000
    IF @low > 0x80000000
        SET @low = @low - 0x100000000
    RETURN CAST(@low as int)
END

GO
