/****** Object:  StoredProcedure [dbo].[MaterialLotUpdate]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialLotUpdate
(
	@MatId int = NULL,
	@MatLotId int = NULL,
	@MatLotDesc varchar(20) = NULL,
	@MatLotDescFlag bit = NULL,
	@MatLotVQOH int = NULL,
	@MatLotVQOHFlag bit = NULL,
	@MatLotVQtyAllocated int = NULL,
	@MatLotVQtyAllocatedFlag bit = NULL,
	@MatLotSMatQtyAllocated int = NULL,
	@MatLotSMatQtyAllocatedFlag bit = NULL,
	@MatLotSMailQtyAllocated int = NULL,
	@MatLotSMailQtyAllocatedFlag bit = NULL,
	@MatLotQtyOnOrder int = NULL,
	@MatLotQtyOnOrderFlag bit = NULL,
	@MatLotOriginalOrderAmount int = NULL,
	@MatLotOriginalOrderAmountFlag bit = NULL,
	@MatLotUnitCost real = NULL,
	@MatLotUnitCostFlag bit = NULL,
	@MatLotUnitPrice real = NULL,
	@MatLotUnitPriceFlag bit = NULL,
	@MatLotUnitSalePrice real = NULL,
	@MatLotUnitSalePriceFlag bit = NULL,
	@MatLotDateAdded smalldatetime = NULL,
	@MatLotDateAddedFlag bit = NULL,
	@MatLotPDFFileName varchar(50) = NULL,
	@MatLotPDFFileNameFlag bit = NULL,
	@MatLotOwner tinyint = NULL,
	@MatLotOwnerFlag bit = NULL,
	@MatLotStatus tinyint = NULL,
	@MatLotStatusFlag bit = NULL,
	@MatLotImageFile varchar(50) = NULL,
	@MatLotImageFileFlag bit = NULL,
	@MatLotImage varchar(50) = NULL,
	@MatLotImageFlag bit = NULL,
	@MatLotProofImageFile varchar(50) = NULL,
	@MatLotProofImageFileFlag bit = NULL,
	@MatLotProofImage varchar(50) = NULL,
	@MatLotProofImageFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@MatLotDescFlag Is Not NULL)
BEGIN
	IF (@MatLotDesc Is Not NULL)
		SET @SQL = @SQL + 'MatLotDesc=''' + @MatLotDesc + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatLotDesc=NULL, ';
END
IF (@MatLotVQOHFlag Is Not NULL)
BEGIN
	IF (@MatLotVQOH Is Not NULL)
		SET @SQL = @SQL + 'MatLotVQOH=' + convert(varchar,@MatLotVQOH) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotVQOH=NULL, ';
END
IF (@MatLotVQtyAllocatedFlag Is Not NULL)
BEGIN
	IF (@MatLotVQtyAllocated Is Not NULL)
		SET @SQL = @SQL + 'MatLotVQtyAllocated=' + convert(varchar,@MatLotVQtyAllocated) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotVQtyAllocated=NULL, ';
END
IF (@MatLotSMatQtyAllocatedFlag Is Not NULL)
BEGIN
	IF (@MatLotSMatQtyAllocated Is Not NULL)
		SET @SQL = @SQL + 'MatLotSMatQtyAllocated=' + convert(varchar,@MatLotSMatQtyAllocated) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotSMatQtyAllocated=NULL, ';
END
IF (@MatLotSMailQtyAllocatedFlag Is Not NULL)
BEGIN
	IF (@MatLotSMailQtyAllocated Is Not NULL)
		SET @SQL = @SQL + 'MatLotSMailQtyAllocated=' + convert(varchar,@MatLotSMailQtyAllocated) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotSMailQtyAllocated=NULL, ';
END
IF (@MatLotQtyOnOrderFlag Is Not NULL)
BEGIN
	IF (@MatLotQtyOnOrder Is Not NULL)
		SET @SQL = @SQL + 'MatLotQtyOnOrder=' + convert(varchar,@MatLotQtyOnOrder) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotQtyOnOrder=NULL, ';
END
IF (@MatLotOriginalOrderAmountFlag Is Not NULL)
BEGIN
	IF (@MatLotOriginalOrderAmount Is Not NULL)
		SET @SQL = @SQL + 'MatLotOriginalOrderAmount=' + convert(varchar,@MatLotOriginalOrderAmount) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotOriginalOrderAmount=NULL, ';
END
IF (@MatLotUnitCostFlag Is Not NULL)
BEGIN
	IF (@MatLotUnitCost Is Not NULL)
		SET @SQL = @SQL + 'MatLotUnitCost=' + convert(varchar,@MatLotUnitCost) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotUnitCost=NULL, ';
END
IF (@MatLotUnitPriceFlag Is Not NULL)
BEGIN
	IF (@MatLotUnitPrice Is Not NULL)
		SET @SQL = @SQL + 'MatLotUnitPrice=' + convert(varchar,@MatLotUnitPrice) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotUnitPrice=NULL, ';
END
IF (@MatLotUnitSalePriceFlag Is Not NULL)
BEGIN
	IF (@MatLotUnitSalePrice Is Not NULL)
		SET @SQL = @SQL + 'MatLotUnitSalePrice=' + convert(varchar,@MatLotUnitSalePrice) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotUnitSalePrice=NULL, ';
END
IF (@MatLotDateAddedFlag Is Not NULL)
BEGIN
	IF (@MatLotDateAdded Is Not NULL)
		SET @SQL = @SQL + 'MatLotDateAdded=''' + convert(varchar,@MatLotDateAdded) + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatLotDateAdded=NULL, ';
END
IF (@MatLotPDFFileNameFlag Is Not NULL)
BEGIN
	IF (@MatLotPDFFileName Is Not NULL)
		SET @SQL = @SQL + 'MatLotPDFFileName=''' + @MatLotPDFFileName + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatLotPDFFileName=NULL, ';
END
IF (@MatLotOwnerFlag Is Not NULL)
BEGIN
	IF (@MatLotOwner Is Not NULL)
		SET @SQL = @SQL + 'MatLotOwner=' + convert(varchar,@MatLotOwner) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotOwner=NULL, ';
END
IF (@MatLotStatusFlag Is Not NULL)
BEGIN
	IF (@MatLotStatus Is Not NULL)
		SET @SQL = @SQL + 'MatLotStatus=' + convert(varchar,@MatLotStatus) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatLotStatus=NULL, ';
END
IF (@MatLotImageFileFlag Is Not NULL)
BEGIN
	IF (@MatLotImageFile Is Not NULL)
		SET @SQL = @SQL + 'MatLotImageFile=''' + @MatLotImageFile + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatLotImageFile=NULL, ';
END
IF (@MatLotImageFlag Is Not NULL)
BEGIN
	IF (@MatLotImage Is Not NULL)
		SET @SQL = @SQL + 'MatLotImage=''' + @MatLotImage + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatLotImage=NULL, ';
END
IF (@MatLotProofImageFileFlag Is Not NULL)
BEGIN
	IF (@MatLotProofImageFile Is Not NULL)
		SET @SQL = @SQL + 'MatLotProofImageFile=''' + @MatLotProofImageFile + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatLotProofImageFile=NULL, ';
END
IF (@MatLotProofImageFlag Is Not NULL)
BEGIN
	IF (@MatLotProofImage Is Not NULL)
		SET @SQL = @SQL + 'MatLotProofImage=''' + @MatLotProofImage + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatLotProofImage=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE MaterialLot SET ' + Left(@SQL, Len(@SQL)-1) + ' Where MatId = ' + convert(varchar,@MatId) + ' AND MatLotId = ' + convert(varchar,@MatLotId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
