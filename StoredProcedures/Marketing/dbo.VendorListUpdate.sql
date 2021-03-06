/****** Object:  StoredProcedure [dbo].[VendorListUpdate]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorListUpdate
(
	@VndId int = NULL,
	@VndIdFlag bit = NULL,
	@VndLId int = NULL,
	@VndLType tinyint = NULL,
	@VndLTypeFlag bit = NULL,
	@VndLDesc varchar(50) = NULL,
	@VndLDescFlag bit = NULL,
	@VndLValues text = NULL,
	@VndLValuesFlag bit = NULL,
	@VndLDisable char(1) = NULL,
	@VndLDisableFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@VndIdFlag Is Not NULL)
BEGIN
	IF (@VndId Is Not NULL)
		SET @SQL = @SQL + 'VndId=' + convert(varchar,@VndId) + ', ';
	ELSE
		SET @SQL = @SQL + 'VndId=NULL, ';
END
IF (@VndLTypeFlag Is Not NULL)
BEGIN
	IF (@VndLType Is Not NULL)
		SET @SQL = @SQL + 'VndLType=' + convert(varchar,@VndLType) + ', ';
	ELSE
		SET @SQL = @SQL + 'VndLType=NULL, ';
END
IF (@VndLDescFlag Is Not NULL)
BEGIN
	IF (@VndLDesc Is Not NULL)
		SET @SQL = @SQL + 'VndLDesc=''' + @VndLDesc + ''', ';
	ELSE
		SET @SQL = @SQL + 'VndLDesc=NULL, ';
END
IF (@VndLDisableFlag Is Not NULL)
BEGIN
	IF (@VndLDisable Is Not NULL)
		SET @SQL = @SQL + 'VndLDisable=''' + @VndLDisable + ''', ';
	ELSE
		SET @SQL = @SQL + 'VndLDisable=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE VendorList SET ' + Left(@SQL, Len(@SQL)-1) + ' Where VndLId = ' + convert(varchar,@VndLId) 
	EXEC(@SQL)
END
IF (@VndLValuesFlag Is Not NULL)
BEGIN
	DECLARE 	@ptrval0 binary(16)
	SELECT		@ptrval0 = TEXTPTR(VndLValues)
	FROM		VendorList
	WHERE		VndLId = @VndLId
	WRITETEXT	VendorList.VndLValues @ptrval0 @VndLValues
END


GO
