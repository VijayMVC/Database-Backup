/****** Object:  StoredProcedure [dbo].[ProofSetUpdate]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ProofSetUpdate
(
	@PrfSId int = NULL,
	@PrfSName varchar(50) = NULL,
	@PrfSNameFlag bit = NULL,
	@PrfSFirstClassPostage float = NULL,
	@PrfSFirstClassPostageFlag bit = NULL,
	@PrfSMailingHandOut char(1) = NULL,
	@PrfSMailingHandOutFlag bit = NULL,
	@PrfSFolding char(1) = NULL,
	@PrfSFoldingFlag bit = NULL,
	@PrfSHandOut char(1) = NULL,
	@PrfSHandOutFlag bit = NULL,
	@PrfSMultiStore char(1) = NULL,
	@PrfSMultiStoreFlag bit = NULL,
	@PrfSMap char(1) = NULL,
	@PrfSMapFlag bit = NULL,
	@PrfSImprintFee float = NULL,
	@PrfSImprintFeeFlag bit = NULL,
	@PrfSImprintQty smallint = NULL,
	@PrfSImprintQtyFlag bit = NULL,
	@PrfSWidth int = NULL,
	@PrfSWidthFlag bit = NULL,
	@PrfSHeight int = NULL,
	@PrfSHeightFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@PrfSNameFlag Is Not NULL)
BEGIN
	IF (@PrfSName Is Not NULL)
		SET @SQL = @SQL + 'PrfSName=''' + @PrfSName + ''', ';
	ELSE
		SET @SQL = @SQL + 'PrfSName=NULL, ';
END
IF (@PrfSFirstClassPostageFlag Is Not NULL)
BEGIN
	IF (@PrfSFirstClassPostage Is Not NULL)
		SET @SQL = @SQL + 'PrfSFirstClassPostage=' + convert(varchar,@PrfSFirstClassPostage) + ', ';
	ELSE
		SET @SQL = @SQL + 'PrfSFirstClassPostage=NULL, ';
END
IF (@PrfSMailingHandOutFlag Is Not NULL)
BEGIN
	IF (@PrfSMailingHandOut Is Not NULL)
		SET @SQL = @SQL + 'PrfSMailingHandOut=''' + @PrfSMailingHandOut + ''', ';
	ELSE
		SET @SQL = @SQL + 'PrfSMailingHandOut=NULL, ';
END
IF (@PrfSFoldingFlag Is Not NULL)
BEGIN
	IF (@PrfSFolding Is Not NULL)
		SET @SQL = @SQL + 'PrfSFolding=''' + @PrfSFolding + ''', ';
	ELSE
		SET @SQL = @SQL + 'PrfSFolding=NULL, ';
END
IF (@PrfSHandOutFlag Is Not NULL)
BEGIN
	IF (@PrfSHandOut Is Not NULL)
		SET @SQL = @SQL + 'PrfSHandOut=''' + @PrfSHandOut + ''', ';
	ELSE
		SET @SQL = @SQL + 'PrfSHandOut=NULL, ';
END
IF (@PrfSMultiStoreFlag Is Not NULL)
BEGIN
	IF (@PrfSMultiStore Is Not NULL)
		SET @SQL = @SQL + 'PrfSMultiStore=''' + @PrfSMultiStore + ''', ';
	ELSE
		SET @SQL = @SQL + 'PrfSMultiStore=NULL, ';
END
IF (@PrfSMapFlag Is Not NULL)
BEGIN
	IF (@PrfSMap Is Not NULL)
		SET @SQL = @SQL + 'PrfSMap=''' + @PrfSMap + ''', ';
	ELSE
		SET @SQL = @SQL + 'PrfSMap=NULL, ';
END
IF (@PrfSImprintFeeFlag Is Not NULL)
BEGIN
	IF (@PrfSImprintFee Is Not NULL)
		SET @SQL = @SQL + 'PrfSImprintFee=' + convert(varchar,@PrfSImprintFee) + ', ';
	ELSE
		SET @SQL = @SQL + 'PrfSImprintFee=NULL, ';
END
IF (@PrfSImprintQtyFlag Is Not NULL)
BEGIN
	IF (@PrfSImprintQty Is Not NULL)
		SET @SQL = @SQL + 'PrfSImprintQty=' + convert(varchar,@PrfSImprintQty) + ', ';
	ELSE
		SET @SQL = @SQL + 'PrfSImprintQty=NULL, ';
END
IF (@PrfSWidthFlag Is Not NULL)
BEGIN
	IF (@PrfSWidth Is Not NULL)
		SET @SQL = @SQL + 'PrfSWidth=' + convert(varchar,@PrfSWidth) + ', ';
	ELSE
		SET @SQL = @SQL + 'PrfSWidth=NULL, ';
END
IF (@PrfSHeightFlag Is Not NULL)
BEGIN
	IF (@PrfSHeight Is Not NULL)
		SET @SQL = @SQL + 'PrfSHeight=' + convert(varchar,@PrfSHeight) + ', ';
	ELSE
		SET @SQL = @SQL + 'PrfSHeight=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE ProofSet SET ' + Left(@SQL, Len(@SQL)-1) + ' Where PrfSId = ' + convert(varchar,@PrfSId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
