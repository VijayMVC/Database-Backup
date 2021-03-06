/****** Object:  StoredProcedure [dbo].[sub_VerifyStoreFunds]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
CREATE PROCEDURE sub_VerifyStoreFunds
(
	@StoreSID int,
	@SubLAmount float,
	@SubLYear int,
	@SubHID int
)
AS

DECLARE 
	@LocalStoreSRA int,
	@retVal int

SELECT @LocalStoreSRA = StoreSubRemainingAmount
FROM StoreSubsidy
WHERE
	StoreSID = @StoreSID AND
	StoreSubYear = @SubLYear AND
	StoreSubHID = @SubHID

IF (@@ROWCOUNT < 1)
	BEGIN
		RETURN 0
	END
ELSE
	BEGIN
		IF (@LocalStoreSRA < @SubLAmount)
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
