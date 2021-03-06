/****** Object:  UserDefinedFunction [dbo].[fn_ChangeEndian8]    Script Date: 5/15/2018 12:15:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_ChangeEndian8(@in bigint)
RETURNS binary(8)
AS
BEGIN
    DECLARE @high bigint
    DECLARE @low  bigint
    SET @high = @in/0x100000000
    SET @low =  @in%0x100000000
    IF @in < 0 AND @low < 0
    BEGIN
        SET @high = @high - 1
        SET @low = @low + 0x100000000
    END
    IF @low >= 0x80000000
        SET @low = @low - 0x100000000
    RETURN dbo.fn_ChangeEndian4(@low) + dbo.fn_ChangeEndian4(@high)
END

GO
