/****** Object:  UserDefinedFunction [dbo].[nop_getnotnullnotempty]    Script Date: 5/15/2018 12:15:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE FUNCTION [dbo].[nop_getnotnullnotempty]
(
    @p1 nvarchar(max) = null, 
    @p2 nvarchar(max) = null
)
RETURNS nvarchar(max)
AS
BEGIN
    IF @p1 IS NULL
        return @p2
    IF @p1 =''
        return @p2

    return @p1
END

GO
