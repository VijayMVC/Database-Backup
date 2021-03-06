/****** Object:  StoredProcedure [dbo].[OrderDtlProofSetUpdate]    Script Date: 5/15/2018 12:10:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlProofSetUpdate
(
	@PrfSId int = NULL,
	@PrfSIdFlag bit = NULL,
	@OrdHId int = NULL,
	@OrdHIdFlag bit = NULL,
	@OrdPSId int = NULL,
	@OrdPSName varchar(50) = NULL,
	@OrdPSNameFlag bit = NULL,
	@OrdPSHandOutOption char(1) = NULL,
	@OrdPSHandOutOptionFlag bit = NULL,
	@OrdPSFoldingOption char(1) = NULL,
	@OrdPSFoldingOptionFlag bit = NULL,
	@OrdPSFoldingFee float = NULL,
	@OrdPSFoldingFeeFlag bit = NULL,
	@OrdPSFoldingQty int = NULL,
	@OrdPSFoldingQtyFlag bit = NULL,
	@OrdPSImprintFee float = NULL,
	@OrdPSImprintFeeFlag bit = NULL,
	@OrdPSImprintQty int = NULL,
	@OrdPSImprintQtyFlag bit = NULL,
	@OrdPSImageName varchar(50) = NULL,
	@OrdPSImageNameFlag bit = NULL,
	@OrdPSPDFName varchar(50) = NULL,
	@OrdPSPDFNameFlag bit = NULL,
	@OrdPSApprovedDate datetime = NULL,
	@OrdPSApprovedDateFlag bit = NULL,
	@OrdPSChangeRequest bit = NULL,
	@OrdPSChangeRequestFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@PrfSIdFlag Is Not NULL)
BEGIN
	IF (@PrfSId Is Not NULL)
		SET @SQL = @SQL + 'PrfSId=' + convert(varchar,@PrfSId) + ', ';
	ELSE
		SET @SQL = @SQL + 'PrfSId=NULL, ';
END
IF (@OrdHIdFlag Is Not NULL)
BEGIN
	IF (@OrdHId Is Not NULL)
		SET @SQL = @SQL + 'OrdHId=' + convert(varchar,@OrdHId) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdHId=NULL, ';
END
IF (@OrdPSNameFlag Is Not NULL)
BEGIN
	IF (@OrdPSName Is Not NULL)
		SET @SQL = @SQL + 'OrdPSName=''' + @OrdPSName + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSName=NULL, ';
END
IF (@OrdPSHandOutOptionFlag Is Not NULL)
BEGIN
	IF (@OrdPSHandOutOption Is Not NULL)
		SET @SQL = @SQL + 'OrdPSHandOutOption=''' + @OrdPSHandOutOption + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSHandOutOption=NULL, ';
END
IF (@OrdPSFoldingOptionFlag Is Not NULL)
BEGIN
	IF (@OrdPSFoldingOption Is Not NULL)
		SET @SQL = @SQL + 'OrdPSFoldingOption=''' + @OrdPSFoldingOption + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSFoldingOption=NULL, ';
END
IF (@OrdPSFoldingFeeFlag Is Not NULL)
BEGIN
	IF (@OrdPSFoldingFee Is Not NULL)
		SET @SQL = @SQL + 'OrdPSFoldingFee=' + convert(varchar,@OrdPSFoldingFee) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSFoldingFee=NULL, ';
END
IF (@OrdPSFoldingQtyFlag Is Not NULL)
BEGIN
	IF (@OrdPSFoldingQty Is Not NULL)
		SET @SQL = @SQL + 'OrdPSFoldingQty=' + convert(varchar,@OrdPSFoldingQty) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSFoldingQty=NULL, ';
END
IF (@OrdPSImprintFeeFlag Is Not NULL)
BEGIN
	IF (@OrdPSImprintFee Is Not NULL)
		SET @SQL = @SQL + 'OrdPSImprintFee=' + convert(varchar,@OrdPSImprintFee) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSImprintFee=NULL, ';
END
IF (@OrdPSImprintQtyFlag Is Not NULL)
BEGIN
	IF (@OrdPSImprintQty Is Not NULL)
		SET @SQL = @SQL + 'OrdPSImprintQty=' + convert(varchar,@OrdPSImprintQty) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSImprintQty=NULL, ';
END
IF (@OrdPSImageNameFlag Is Not NULL)
BEGIN
	IF (@OrdPSImageName Is Not NULL)
		SET @SQL = @SQL + 'OrdPSImageName=''' + @OrdPSImageName + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSImageName=NULL, ';
END
IF (@OrdPSPDFNameFlag Is Not NULL)
BEGIN
	IF (@OrdPSPDFName Is Not NULL)
		SET @SQL = @SQL + 'OrdPSPDFName=''' + @OrdPSPDFName + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSPDFName=NULL, ';
END
IF (@OrdPSApprovedDateFlag Is Not NULL)
BEGIN
	IF (@OrdPSApprovedDate Is Not NULL)
		SET @SQL = @SQL + 'OrdPSApprovedDate=''' + convert(varchar,@OrdPSApprovedDate) + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSApprovedDate=NULL, ';
END
IF (@OrdPSChangeRequestFlag Is Not NULL)
BEGIN
	IF (@OrdPSChangeRequest Is Not NULL)
		SET @SQL = @SQL + 'OrdPSChangeRequest=' + convert(varchar,@OrdPSChangeRequest) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdPSChangeRequest=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE OrderDtlProofSet SET ' + Left(@SQL, Len(@SQL)-1) + ' Where OrdPSId = ' + convert(varchar,@OrdPSId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
