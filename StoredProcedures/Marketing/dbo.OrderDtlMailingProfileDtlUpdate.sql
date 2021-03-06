/****** Object:  StoredProcedure [dbo].[OrderDtlMailingProfileDtlUpdate]    Script Date: 5/15/2018 12:10:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlMailingProfileDtlUpdate
(
	@OrdDMPHId int = NULL,
	@OrdDMPDId int = NULL,
	@OrdDMPDType tinyint = NULL,
	@OrdDMPDTypeFlag bit = NULL,
	@OrdDMPDSelection char(1) = NULL,
	@OrdDMPDSelectionFlag bit = NULL,
	@OrdDMPDQty int = NULL,
	@OrdDMPDQtyFlag bit = NULL,
	@OrdDMPDQtyFee float = NULL,
	@OrdDMPDQtyFeeFlag bit = NULL,
	@OrdDMPDExtraFee float = NULL,
	@OrdDMPDExtraFeeFlag bit = NULL,
	@OrdDMPDAmount float = NULL,
	@OrdDMPDAmountFlag bit = NULL,
	@OrdDMPDSICTemplateId int = NULL,
	@OrdDMPDSICTemplateIdFlag bit = NULL,
	@OrdDMPDSICTemplateName varchar(255) = NULL,
	@OrdDMPDSICTemplateNameFlag bit = NULL,
	@OrdDMPDSICModified bit = NULL,
	@OrdDMPDSICModifiedFlag bit = NULL,
	@OrdDMPDValues text = NULL,
	@OrdDMPDValuesFlag bit = NULL,
	@OrdDMPDVisited bit = NULL,
	@OrdDMPDVisitedFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@OrdDMPDTypeFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDType Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDType=' + convert(varchar,@OrdDMPDType) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDType=NULL, ';
END
IF (@OrdDMPDSelectionFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDSelection Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDSelection=''' + @OrdDMPDSelection + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDSelection=NULL, ';
END
IF (@OrdDMPDQtyFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDQty Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDQty=' + convert(varchar,@OrdDMPDQty) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDQty=NULL, ';
END
IF (@OrdDMPDQtyFeeFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDQtyFee Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDQtyFee=' + convert(varchar,@OrdDMPDQtyFee) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDQtyFee=NULL, ';
END
IF (@OrdDMPDExtraFeeFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDExtraFee Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDExtraFee=' + convert(varchar,@OrdDMPDExtraFee) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDExtraFee=NULL, ';
END
IF (@OrdDMPDAmountFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDAmount Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDAmount=' + convert(varchar,@OrdDMPDAmount) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDAmount=NULL, ';
END
IF (@OrdDMPDSICTemplateIdFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDSICTemplateId Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDSICTemplateId=' + convert(varchar,@OrdDMPDSICTemplateId) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDSICTemplateId=NULL, ';
END
IF (@OrdDMPDSICTemplateNameFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDSICTemplateName Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDSICTemplateName=''' + @OrdDMPDSICTemplateName + ''', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDSICTemplateName=NULL, ';
END
IF (@OrdDMPDSICModifiedFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDSICModified Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDSICModified=' + convert(varchar,@OrdDMPDSICModified) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDSICModified=NULL, ';
END
IF (@OrdDMPDVisitedFlag Is Not NULL)
BEGIN
	IF (@OrdDMPDVisited Is Not NULL)
		SET @SQL = @SQL + 'OrdDMPDVisited=' + convert(varchar,@OrdDMPDVisited) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDMPDVisited=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE OrderDtlMailingProfileDtl SET ' + Left(@SQL, Len(@SQL)-1) + ' Where OrdDMPHId = ' + convert(varchar,@OrdDMPHId) + ' AND OrdDMPDId = ' + convert(varchar,@OrdDMPDId) 
	EXEC(@SQL)
END
IF (@OrdDMPDValuesFlag Is Not NULL)
BEGIN
	DECLARE 	@ptrval0 binary(16)
	SELECT		@ptrval0 = TEXTPTR(OrdDMPDValues)
	FROM		OrderDtlMailingProfileDtl
	WHERE		OrdDMPHId = @OrdDMPHId AND OrdDMPDId = @OrdDMPDId
	WRITETEXT	OrderDtlMailingProfileDtl.OrdDMPDValues @ptrval0 @OrdDMPDValues
END


GO
