/****** Object:  StoredProcedure [dbo].[CatalogUpdate]    Script Date: 5/15/2018 12:10:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.CatalogUpdate
(
	@CatlId int = NULL,
	@CatlName varchar(50) = NULL,
	@CatlNameFlag bit = NULL,
	@CatlMarketingCountry smallint = NULL,
	@CatlMarketingCountryFlag bit = NULL,
	@CatlDisabled char(1) = NULL,
	@CatlDisabledFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@CatlNameFlag Is Not NULL)
BEGIN
	IF (@CatlName Is Not NULL)
		SET @SQL = @SQL + 'CatlName=''' + @CatlName + ''', ';
	ELSE
		SET @SQL = @SQL + 'CatlName=NULL, ';
END
IF (@CatlMarketingCountryFlag Is Not NULL)
BEGIN
	IF (@CatlMarketingCountry Is Not NULL)
		SET @SQL = @SQL + 'CatlMarketingCountry=' + convert(varchar,@CatlMarketingCountry) + ', ';
	ELSE
		SET @SQL = @SQL + 'CatlMarketingCountry=NULL, ';
END
IF (@CatlDisabledFlag Is Not NULL)
BEGIN
	IF (@CatlDisabled Is Not NULL)
		SET @SQL = @SQL + 'CatlDisabled=''' + @CatlDisabled + ''', ';
	ELSE
		SET @SQL = @SQL + 'CatlDisabled=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE Catalog SET ' + Left(@SQL, Len(@SQL)-1) + ' Where CatlId = ' + convert(varchar,@CatlId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
