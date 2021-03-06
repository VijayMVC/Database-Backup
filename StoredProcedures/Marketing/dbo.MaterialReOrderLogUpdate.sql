/****** Object:  StoredProcedure [dbo].[MaterialReOrderLogUpdate]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialReOrderLogUpdate
(
	@MatId int = NULL,
	@MatIdFlag bit = NULL,
	@MatLotId int = NULL,
	@MatLotIdFlag bit = NULL,
	@MatRId int = NULL,
	@MatRQty smallint = NULL,
	@MatRQtyFlag bit = NULL,
	@MatRPrice float = NULL,
	@MatRPriceFlag bit = NULL,
	@MatRDate smalldatetime = NULL,
	@MatRDateFlag bit = NULL,
	@MatRPDFFileName varchar(50) = NULL,
	@MatRPDFFileNameFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@MatIdFlag Is Not NULL)
BEGIN
	IF (@MatId Is Not NULL)
		SET @SQL = @SQL + 'MatId=' + convert(varchar,@MatId) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatId=NULL, ';
END
IF (@MatLotIdFlag Is Not NULL)
BEGIN
	IF (@MatLotId Is Not NULL)
		SET @SQL = @SQL + 'MatLotId=' + convert(varchar,@MatLotId) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotId=NULL, ';
END
IF (@MatRQtyFlag Is Not NULL)
BEGIN
	IF (@MatRQty Is Not NULL)
		SET @SQL = @SQL + 'MatRQty=' + convert(varchar,@MatRQty) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatRQty=NULL, ';
END
IF (@MatRPriceFlag Is Not NULL)
BEGIN
	IF (@MatRPrice Is Not NULL)
		SET @SQL = @SQL + 'MatRPrice=' + convert(varchar,@MatRPrice) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatRPrice=NULL, ';
END
IF (@MatRDateFlag Is Not NULL)
BEGIN
	IF (@MatRDate Is Not NULL)
		SET @SQL = @SQL + 'MatRDate=''' + convert(varchar,@MatRDate) + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatRDate=NULL, ';
END
IF (@MatRPDFFileNameFlag Is Not NULL)
BEGIN
	IF (@MatRPDFFileName Is Not NULL)
		SET @SQL = @SQL + 'MatRPDFFileName=''' + @MatRPDFFileName + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatRPDFFileName=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE MaterialReOrderLog SET ' + Left(@SQL, Len(@SQL)-1) + ' Where MatRId = ' + convert(varchar,@MatRId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
