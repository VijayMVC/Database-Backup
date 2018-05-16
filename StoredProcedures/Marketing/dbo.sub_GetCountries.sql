/****** Object:  StoredProcedure [dbo].[sub_GetCountries]    Script Date: 5/15/2018 12:10:26 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF




CREATE PROCEDURE sub_GetCountries
AS
SELECT 
DISTINCT(A.CountryMarketingCountry), dbo.fn_ConvertToUK(A.CountryName) AS CountryName
FROM Contact.dbo.Country A
ORDER BY A.CountryMarketingCountry



GO
