/****** Object:  StoredProcedure [dbo].[sub_GetCountryName]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetCountryName
(
	@CountryMarketingCountry varchar(50)
)
AS
SELECT CountryName
FROM Contact.dbo.Country A
WHERE CountryMarketingCountry = @CountryMarketingCountry



GO
