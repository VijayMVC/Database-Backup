/****** Object:  StoredProcedure [dbo].[sub_VerifyCoOpFunds]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE sub_VerifyCoOpFunds
(
	@CoOpID int,
	@SubLAmount float,
	@Year int
)
AS
DECLARE 
	@LocalAmountAvailable int,
	@retVal int
SELECT @LocalAmountAvailable = AmountAvailable
FROM CoOpAmounts
WHERE
	CoOpID = @CoOpID AND
	[Year] = @Year
IF (@@ROWCOUNT < 1)
	BEGIN
		RETURN 0
	END
ELSE
	BEGIN
		IF (@LocalAmountAvailable < @SubLAmount)
			BEGIN
				RETURN 0
			END
		ELSE
			BEGIN
				RETURN 1
			END
	END
RETURN @retVal
GO
