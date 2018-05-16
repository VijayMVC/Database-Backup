/****** Object:  StoredProcedure [dbo].[sub_CoOpBalanceSelect]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE sub_CoOpBalanceSelect
(
	@CoOpID int,
	@year int

)
 AS

SELECT AmountEarned, AmountAvailable
FROM
	CoOpAmounts
WHERE
	CoOpID = @CoOpID
AND 
	Year = @year
GO
