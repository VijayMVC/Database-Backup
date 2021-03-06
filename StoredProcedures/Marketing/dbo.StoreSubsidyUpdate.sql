/****** Object:  StoredProcedure [dbo].[StoreSubsidyUpdate]    Script Date: 5/15/2018 12:10:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.StoreSubsidyUpdate
(
	@StoreSId int = NULL,
	@StoreSubYear smallint = NULL,
	@StoreSubHId int = NULL,
	@StoreSubType tinyint = NULL,
	@StoreSubTypeFlag bit = NULL,
	@StoreSubStartingAmount float = NULL,
	@StoreSubStartingAmountFlag bit = NULL,
	@StoreSubRemainingAmount float = NULL,
	@StoreSubRemainingAmountFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@StoreSubTypeFlag Is Not NULL)
BEGIN
	IF (@StoreSubType Is Not NULL)
		SET @SQL = @SQL + 'StoreSubType=' + convert(varchar,@StoreSubType) + ', ';
	ELSE
		SET @SQL = @SQL + 'StoreSubType=NULL, ';
END
IF (@StoreSubStartingAmountFlag Is Not NULL)
BEGIN
	IF (@StoreSubStartingAmount Is Not NULL)
		SET @SQL = @SQL + 'StoreSubStartingAmount=' + convert(varchar,@StoreSubStartingAmount) + ', ';
	ELSE
		SET @SQL = @SQL + 'StoreSubStartingAmount=NULL, ';
END
IF (@StoreSubRemainingAmountFlag Is Not NULL)
BEGIN
	IF (@StoreSubRemainingAmount Is Not NULL)
		SET @SQL = @SQL + 'StoreSubRemainingAmount=' + convert(varchar,@StoreSubRemainingAmount) + ', ';
	ELSE
		SET @SQL = @SQL + 'StoreSubRemainingAmount=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE StoreSubsidy SET ' + Left(@SQL, Len(@SQL)-1) + ' Where StoreSId = ' + convert(varchar,@StoreSId) + ' AND StoreSubYear = ' + convert(varchar,@StoreSubYear) + ' AND StoreSubHId = ' + convert(varchar,@StoreSubHId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
