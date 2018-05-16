/****** Object:  StoredProcedure [dbo].[sub_CoOpAmountsInsert]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_CoOpAmountsInsert 
(
	@CoOpID int,
	@AmountEarned real,
	@AmountAvailable real,
	@Year int
)
AS
INSERT INTO CoOpAmounts
(
	CoOpID,
	AmountEarned,
	AmountAvailable,
	Year
)
VALUES
(
	@CoOpID,
	@AmountEarned,
	@AmountAvailable,
	@Year
)
return @@Identity



GO
