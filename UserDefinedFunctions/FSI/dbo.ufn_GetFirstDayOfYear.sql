/****** Object:  UserDefinedFunction [dbo].[ufn_GetFirstDayOfYear]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION [dbo].[ufn_GetFirstDayOfYear] ( @pInputDate    DATETIME )
RETURNS DATETIME
BEGIN

    RETURN CAST(CAST(YEAR(@pInputDate) AS VARCHAR(4)) + '/01/01' AS DATETIME)

END


GO
