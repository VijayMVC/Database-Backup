/****** Object:  UserDefinedFunction [dbo].[fn_RoundDateToNearestSecond]    Script Date: 5/15/2018 12:15:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION dbo.fn_RoundDateToNearestSecond(@x datetime)
RETURNS datetime
AS
BEGIN
    DECLARE @y datetime
    SELECT @y = DATEADD(
        ms,
        CASE
            WHEN DATEPART(ms, @x) < 500 THEN -DATEPART(ms, @x)
        ELSE
            1000 - DATEPART(ms, @x)
        END,
        @x)
    RETURN @y
END

GO
