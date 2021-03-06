/****** Object:  UserDefinedFunction [dbo].[ufn_GetFirstDayOfMonth]    Script Date: 5/15/2018 12:14:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE FUNCTION [dbo].[ufn_GetFirstDayOfMonth] ( @pInputDate    DATETIME )
RETURNS DATETIME
BEGIN

    RETURN CAST(CAST(YEAR(@pInputDate) AS VARCHAR(4)) + '/' + 
                CAST(MONTH(@pInputDate) AS VARCHAR(2)) + '/01' AS DATETIME)

END


GO
