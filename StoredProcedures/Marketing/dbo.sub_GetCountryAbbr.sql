/****** Object:  StoredProcedure [dbo].[sub_GetCountryAbbr]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetCountryAbbr
(
	@CountryMarketingCountry varchar(50)
)
AS
SELECT Distinct(dbo.fn_ConvertToUKAbbr(A.CountryName, A.CountryAbbr)) AS CountryAbbr
FROM Contact.dbo.Country A
WHERE CountryMarketingCountry = @CountryMarketingCountry



GO
