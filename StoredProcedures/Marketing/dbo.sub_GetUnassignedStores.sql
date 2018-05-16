/****** Object:  StoredProcedure [dbo].[sub_GetUnassignedStores]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetUnassignedStores
(
	@CoOpID int
)
AS
SELECT UWebNumber, StoreDisplay = 'Store ' + A.UWebNumber
FROM Contact.dbo.Contact1 A
WHERE
	UWebNumber NOT IN (
	SELECT B.WebNumber
	FROM CoOpStores B
	)
ORDER BY cast(A.UWebNumber as int)



GO
