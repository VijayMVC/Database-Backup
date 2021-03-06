/****** Object:  StoredProcedure [dbo].[ns_GetOwnersYearsOfService]    Script Date: 5/15/2018 12:13:21 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE ns_GetOwnersYearsOfService
(
	@WebNumber int,
	@YearsOfService varchar(20) OUTPUT
)
AS

DECLARE @ResaleOpenDate datetime
DECLARE @YearsSince datetime
DECLARE @DateDifference float

SELECT @ResaleOpenDate = C2.UResaleOpd FROM Contact.dbo.Contact2 C2
	INNER JOIN Contact.dbo.Contact1 C1 ON C1.AccountNo = C2.AccountNo
WHERE
	C1.UWebNumber = @WebNumber

IF (@ResaleOpenDate is null) OR (Len(@ResaleOpenDate) < 1)
	BEGIN
		SELECT @YearsSince = (SELECT C2.UStoreOpd FROM Contact.dbo.Contact2 C2 INNER JOIN Contact.dbo.Contact1 C1 ON C1.AccountNo = C2.AccountNo WHERE C1.UWebNumber = @WebNumber)
	END

IF Len(@ResaleOpenDate) > 0
	BEGIN
		SELECT @YearsSince = cast(@ResaleOpenDate as varchar)
	END

SELECT @DateDifference = DateDiff(month, @YearsSince, getDate())

IF (@DateDifference < 12)
	BEGIN
		SELECT @YearsOfService = cast(@DateDifference as varchar) + ' Months'
	END

IF (@DateDifference > 11)
	BEGIN
		SELECT @YearsOfService = cast(ROUND(@DateDifference / 12, 0) as varchar) + ' Years'
	END
GO
