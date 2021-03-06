/****** Object:  StoredProcedure [dbo].[VendorShippingUpdate]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorShippingUpdate
(
	@VndSId int = NULL,
	@VndId int = NULL,
	@VndIdFlag bit = NULL,
	@VndSType tinyint = NULL,
	@VndSTypeFlag bit = NULL,
	@VndSDesc varchar(50) = NULL,
	@VndSDescFlag bit = NULL,
	@VndSVar1 float = NULL,
	@VndSVar1Flag bit = NULL,
	@VndSVar2 float = NULL,
	@VndSVar2Flag bit = NULL,
	@VndSVar3 float = NULL,
	@VndSVar3Flag bit = NULL
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
IF (@VndSTypeFlag Is Not NULL)
BEGIN
	IF (@VndSType Is Not NULL)
		SET @SQL = @SQL + 'VndSType=' + convert(varchar,@VndSType) + ', ';
	ELSE
		SET @SQL = @SQL + 'VndSType=NULL, ';
END
IF (@VndSDescFlag Is Not NULL)
BEGIN
	IF (@VndSDesc Is Not NULL)
		SET @SQL = @SQL + 'VndSDesc=''' + @VndSDesc + ''', ';
	ELSE
		SET @SQL = @SQL + 'VndSDesc=NULL, ';
END
IF (@VndSVar1Flag Is Not NULL)
BEGIN
	IF (@VndSVar1 Is Not NULL)
		SET @SQL = @SQL + 'VndSVar1=' + convert(varchar,@VndSVar1) + ', ';
	ELSE
		SET @SQL = @SQL + 'VndSVar1=NULL, ';
END
IF (@VndSVar2Flag Is Not NULL)
BEGIN
	IF (@VndSVar2 Is Not NULL)
		SET @SQL = @SQL + 'VndSVar2=' + convert(varchar,@VndSVar2) + ', ';
	ELSE
		SET @SQL = @SQL + 'VndSVar2=NULL, ';
END
IF (@VndSVar3Flag Is Not NULL)
BEGIN
	IF (@VndSVar3 Is Not NULL)
		SET @SQL = @SQL + 'VndSVar3=' + convert(varchar,@VndSVar3) + ', ';
	ELSE
		SET @SQL = @SQL + 'VndSVar3=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE VendorShipping SET ' + Left(@SQL, Len(@SQL)-1) + ' Where VndSId = ' + convert(varchar,@VndSId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
