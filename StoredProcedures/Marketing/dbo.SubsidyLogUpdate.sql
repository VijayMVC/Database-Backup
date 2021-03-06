/****** Object:  StoredProcedure [dbo].[SubsidyLogUpdate]    Script Date: 5/15/2018 12:10:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.SubsidyLogUpdate
(
	@SubLStoreId int = NULL,
	@SubLStoreIdFlag bit = NULL,
	@SubLYear smallint = NULL,
	@SubLId int = NULL,
	@SubLType tinyint = NULL,
	@SubLTypeFlag bit = NULL,
	@SubLOrdHId int = NULL,
	@SubLOrdHIdFlag bit = NULL,
	@SubLOrdDId int = NULL,
	@SubLOrdDIdFlag bit = NULL,
	@SubLPrdId int = NULL,
	@SubLPrdIdFlag bit = NULL,
	@SubLHId int = NULL,
	@SubLHIdFlag bit = NULL,
	@SubLHType tinyint = NULL,
	@SubLHTypeFlag bit = NULL,
	@SubLDType tinyint = NULL,
	@SubLDTypeFlag bit = NULL,
	@SubLDesc varchar(255) = NULL,
	@SubLDescFlag bit = NULL,
	@SubLAmount real = NULL,
	@SubLAmountFlag bit = NULL,
	@SubLDate datetime = NULL,
	@SubLDateFlag bit = NULL,
	@InvoiceAmount real = NULL,
	@InvoiceAmountFlag bit = NULL,
	@SubsidyQualifierID int = NULL,
	@SubsidyQualifierIDFlag bit = NULL,
	@UsageDateFrom datetime = NULL,
	@UsageDateFromFlag bit = NULL,
	@UsageDateTo datetime = NULL,
	@UsageDateToFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@SubLStoreIdFlag Is Not NULL)
BEGIN
	IF (@SubLStoreId Is Not NULL)
		SET @SQL = @SQL + 'SubLStoreId=' + convert(varchar,@SubLStoreId) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLStoreId=NULL, ';
END
IF (@SubLTypeFlag Is Not NULL)
BEGIN
	IF (@SubLType Is Not NULL)
		SET @SQL = @SQL + 'SubLType=' + convert(varchar,@SubLType) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLType=NULL, ';
END
IF (@SubLOrdHIdFlag Is Not NULL)
BEGIN
	IF (@SubLOrdHId Is Not NULL)
		SET @SQL = @SQL + 'SubLOrdHId=' + convert(varchar,@SubLOrdHId) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLOrdHId=NULL, ';
END
IF (@SubLOrdDIdFlag Is Not NULL)
BEGIN
	IF (@SubLOrdDId Is Not NULL)
		SET @SQL = @SQL + 'SubLOrdDId=' + convert(varchar,@SubLOrdDId) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLOrdDId=NULL, ';
END
IF (@SubLPrdIdFlag Is Not NULL)
BEGIN
	IF (@SubLPrdId Is Not NULL)
		SET @SQL = @SQL + 'SubLPrdId=' + convert(varchar,@SubLPrdId) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLPrdId=NULL, ';
END
IF (@SubLHIdFlag Is Not NULL)
BEGIN
	IF (@SubLHId Is Not NULL)
		SET @SQL = @SQL + 'SubLHId=' + convert(varchar,@SubLHId) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLHId=NULL, ';
END
IF (@SubLHTypeFlag Is Not NULL)
BEGIN
	IF (@SubLHType Is Not NULL)
		SET @SQL = @SQL + 'SubLHType=' + convert(varchar,@SubLHType) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLHType=NULL, ';
END
IF (@SubLDTypeFlag Is Not NULL)
BEGIN
	IF (@SubLDType Is Not NULL)
		SET @SQL = @SQL + 'SubLDType=' + convert(varchar,@SubLDType) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLDType=NULL, ';
END
IF (@SubLDescFlag Is Not NULL)
BEGIN
	IF (@SubLDesc Is Not NULL)
		SET @SQL = @SQL + 'SubLDesc=''' + @SubLDesc + ''', ';
	ELSE
		SET @SQL = @SQL + 'SubLDesc=NULL, ';
END
IF (@SubLAmountFlag Is Not NULL)
BEGIN
	IF (@SubLAmount Is Not NULL)
		SET @SQL = @SQL + 'SubLAmount=' + convert(varchar,@SubLAmount) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubLAmount=NULL, ';
END
IF (@SubLDateFlag Is Not NULL)
BEGIN
	IF (@SubLDate Is Not NULL)
		SET @SQL = @SQL + 'SubLDate=''' + convert(varchar,@SubLDate) + ''', ';
	ELSE
		SET @SQL = @SQL + 'SubLDate=NULL, ';
END
IF (@InvoiceAmountFlag Is Not NULL)
BEGIN
	IF (@InvoiceAmount Is Not NULL)
		SET @SQL = @SQL + 'InvoiceAmount=' + convert(varchar,@InvoiceAmount) + ', ';
	ELSE
		SET @SQL = @SQL + 'InvoiceAmount=NULL, ';
END
IF (@SubsidyQualifierIDFlag Is Not NULL)
BEGIN
	IF (@SubsidyQualifierID Is Not NULL)
		SET @SQL = @SQL + 'SubsidyQualifierID=' + convert(varchar,@SubsidyQualifierID) + ', ';
	ELSE
		SET @SQL = @SQL + 'SubsidyQualifierID=NULL, ';
END
IF (@UsageDateFromFlag Is Not NULL)
BEGIN
	IF (@UsageDateFrom Is Not NULL)
		SET @SQL = @SQL + 'UsageDateFrom=''' + convert(varchar,@UsageDateFrom) + ''', ';
	ELSE
		SET @SQL = @SQL + 'UsageDateFrom=NULL, ';
END
IF (@UsageDateToFlag Is Not NULL)
BEGIN
	IF (@UsageDateTo Is Not NULL)
		SET @SQL = @SQL + 'UsageDateTo=''' + convert(varchar,@UsageDateTo) + ''', ';
	ELSE
		SET @SQL = @SQL + 'UsageDateTo=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE SubsidyLog SET ' + Left(@SQL, Len(@SQL)-1) + ' Where SubLYear = ' + convert(varchar,@SubLYear) + ' AND SubLId = ' + convert(varchar,@SubLId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
