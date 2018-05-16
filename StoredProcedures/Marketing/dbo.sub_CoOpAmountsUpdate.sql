/****** Object:  StoredProcedure [dbo].[sub_CoOpAmountsUpdate]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_CoOpAmountsUpdate 
(
	@CoOpID int,
	@AmountEarned real,
	@AmountAvailable real,
	@Year int
)
AS
UPDATE CoOpAmounts
SET	
	AmountEarned = @AmountEarned,
	AmountAvailable = @AmountAvailable
WHERE
	Year = @Year 
AND	
	CoOpID = @CoOpID



GO
