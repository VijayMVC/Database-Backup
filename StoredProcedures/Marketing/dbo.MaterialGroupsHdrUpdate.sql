/****** Object:  StoredProcedure [dbo].[MaterialGroupsHdrUpdate]    Script Date: 5/15/2018 12:10:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialGroupsHdrUpdate
(
	@MatGHId int = NULL,
	@MatGHType tinyint = NULL,
	@MatGHTypeFlag bit = NULL,
	@MatGHName varchar(125) = NULL,
	@MatGHNameFlag bit = NULL,
	@MatGHDesc varchar(250) = NULL,
	@MatGHDescFlag bit = NULL,
	@MatGHSignUpDate smalldatetime = NULL,
	@MatGHSignUpDateFlag bit = NULL,
	@MatGHImage varchar(50) = NULL,
	@MatGHImageFlag bit = NULL,
	@MatGHDisplayType tinyint = NULL,
	@MatGHDisplayTypeFlag bit = NULL,
	@MatGHMalPId int = NULL,
	@MatGHMalPIdFlag bit = NULL,
	@MatGHSignUpDeadline smallint = NULL,
	@MatGHSignUpDeadlineFlag bit = NULL,
	@MatGHUploadDBDeadline smallint = NULL,
	@MatGHUploadDBDeadlineFlag bit = NULL,
	@MatGHCreditCardValidation smallint = NULL,
	@MatGHCreditCardValidationFlag bit = NULL,
	@MatGHPlanSignUpDeadline smallint = NULL,
	@MatGHPlanSignUpDeadlineFlag bit = NULL,
	@MatGHMailingType tinyint = NULL,
	@MatGHMailingTypeFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@MatGHTypeFlag Is Not NULL)
BEGIN
	IF (@MatGHType Is Not NULL)
		SET @SQL = @SQL + 'MatGHType=' + convert(varchar,@MatGHType) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatGHType=NULL, ';
END
IF (@MatGHNameFlag Is Not NULL)
BEGIN
	IF (@MatGHName Is Not NULL)
		SET @SQL = @SQL + 'MatGHName=''' + @MatGHName + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatGHName=NULL, ';
END
IF (@MatGHDescFlag Is Not NULL)
BEGIN
	IF (@MatGHDesc Is Not NULL)
		SET @SQL = @SQL + 'MatGHDesc=''' + @MatGHDesc + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatGHDesc=NULL, ';
END
IF (@MatGHSignUpDateFlag Is Not NULL)
BEGIN
	IF (@MatGHSignUpDate Is Not NULL)
		SET @SQL = @SQL + 'MatGHSignUpDate=''' + convert(varchar,@MatGHSignUpDate) + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatGHSignUpDate=NULL, ';
END
IF (@MatGHImageFlag Is Not NULL)
BEGIN
	IF (@MatGHImage Is Not NULL)
		SET @SQL = @SQL + 'MatGHImage=''' + @MatGHImage + ''', ';
	ELSE
		SET @SQL = @SQL + 'MatGHImage=NULL, ';
END
IF (@MatGHDisplayTypeFlag Is Not NULL)
BEGIN
	IF (@MatGHDisplayType Is Not NULL)
		SET @SQL = @SQL + 'MatGHDisplayType=' + convert(varchar,@MatGHDisplayType) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatGHDisplayType=NULL, ';
END
IF (@MatGHMalPIdFlag Is Not NULL)
BEGIN
	IF (@MatGHMalPId Is Not NULL)
		SET @SQL = @SQL + 'MatGHMalPId=' + convert(varchar,@MatGHMalPId) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatGHMalPId=NULL, ';
END
IF (@MatGHSignUpDeadlineFlag Is Not NULL)
BEGIN
	IF (@MatGHSignUpDeadline Is Not NULL)
		SET @SQL = @SQL + 'MatGHSignUpDeadline=' + convert(varchar,@MatGHSignUpDeadline) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatGHSignUpDeadline=NULL, ';
END
IF (@MatGHUploadDBDeadlineFlag Is Not NULL)
BEGIN
	IF (@MatGHUploadDBDeadline Is Not NULL)
		SET @SQL = @SQL + 'MatGHUploadDBDeadline=' + convert(varchar,@MatGHUploadDBDeadline) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatGHUploadDBDeadline=NULL, ';
END
IF (@MatGHCreditCardValidationFlag Is Not NULL)
BEGIN
	IF (@MatGHCreditCardValidation Is Not NULL)
		SET @SQL = @SQL + 'MatGHCreditCardValidation=' + convert(varchar,@MatGHCreditCardValidation) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatGHCreditCardValidation=NULL, ';
END
IF (@MatGHPlanSignUpDeadlineFlag Is Not NULL)
BEGIN
	IF (@MatGHPlanSignUpDeadline Is Not NULL)
		SET @SQL = @SQL + 'MatGHPlanSignUpDeadline=' + convert(varchar,@MatGHPlanSignUpDeadline) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatGHPlanSignUpDeadline=NULL, ';
END
IF (@MatGHMailingTypeFlag Is Not NULL)
BEGIN
	IF (@MatGHMailingType Is Not NULL)
		SET @SQL = @SQL + 'MatGHMailingType=' + convert(varchar,@MatGHMailingType) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatGHMailingType=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE MaterialGroupsHdr SET ' + Left(@SQL, Len(@SQL)-1) + ' Where MatGHId = ' + convert(varchar,@MatGHId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF


GO
