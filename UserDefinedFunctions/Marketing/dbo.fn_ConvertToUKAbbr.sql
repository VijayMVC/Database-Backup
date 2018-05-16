/****** Object:  UserDefinedFunction [dbo].[fn_ConvertToUKAbbr]    Script Date: 5/15/2018 12:14:53 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE  FUNCTION fn_ConvertToUKAbbr
(
	@CountryName varchar(50),
	@CountryAbbr varchar(6)
)
RETURNS varchar(6)
AS
BEGIN
	IF @CountryName = 'Wales' OR @CountryName = 'England' OR @CountryName = 'Ireland' OR @CountryName = 'Scotland'
		BEGIN
			SELECT @CountryName = 'United Kingdom'
			SELECT @CountryAbbr = 'UK'
		END

	RETURN @CountryAbbr
END









GO
