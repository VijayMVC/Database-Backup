/****** Object:  StoredProcedure [dbo].[sub_GetCountriesForSubsidyType]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetCountriesForSubsidyType 
(
  @subType int
)
AS
SELECT DISTINCT
	(A.CountryMarketingCountry), 
	dbo.fn_ConvertToUK(A.CountryName) AS CountryName
FROM 
	Contact.dbo.Country A
WHERE 
	A.CountryMarketingCountry NOT IN 
	(
  	SELECT DISTINCT 
			subhmrktcountry 
	FROM 
		subsidyhdr 
 	 WHERE
		subhtype = @subType 
)
ORDER BY A.CountryMarketingCountry



GO
