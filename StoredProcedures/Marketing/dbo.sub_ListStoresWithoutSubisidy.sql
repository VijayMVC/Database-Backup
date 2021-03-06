/****** Object:  StoredProcedure [dbo].[sub_ListStoresWithoutSubisidy]    Script Date: 5/15/2018 12:10:27 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_ListStoresWithoutSubisidy 
(
	@year int
)
AS
SELECT 
	UWebNumber  as WebNumber
FROM 
	Contact.Dbo.Contact1 
WHERE 
	UWebNumber NOT IN (
				SELECT DISTINCT
					StoreSId
				FROM
					StoreSubsidy
			              WHERE
					StoreSubYear = @year
				)
ORDER BY CAST(UWebNumber AS INT)



GO
