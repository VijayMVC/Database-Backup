/****** Object:  StoredProcedure [dbo].[OffersUpdate]    Script Date: 5/15/2018 12:10:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OffersUpdate
(
	@OffId int = NULL,
	@OffType tinyint = NULL,
	@OffTypeFlag bit = NULL,
	@OffName varchar(50) = NULL,
	@OffNameFlag bit = NULL,
	@OffImage varchar(50) = NULL,
	@OffImageFlag bit = NULL,
	@OffDisabled char(1) = NULL,
	@OffDisabledFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@OffTypeFlag Is Not NULL)
BEGIN
	IF (@OffType Is Not NULL)
		SET @SQL = @SQL + 'OffType=' + convert(varchar,@OffType) + ', ';
	ELSE
		SET @SQL = @SQL + 'OffType=NULL, ';
END
IF (@OffNameFlag Is Not NULL)
BEGIN
	IF (@OffName Is Not NULL)
		SET @SQL = @SQL + 'OffName=''' + @OffName + ''', ';
	ELSE
		SET @SQL = @SQL + 'OffName=NULL, ';
END
IF (@OffImageFlag Is Not NULL)
BEGIN
	IF (@OffImage Is Not NULL)
		SET @SQL = @SQL + 'OffImage=''' + @OffImage + ''', ';
	ELSE
		SET @SQL = @SQL + 'OffImage=NULL, ';
END
IF (@OffDisabledFlag Is Not NULL)
BEGIN
	IF (@OffDisabled Is Not NULL)
		SET @SQL = @SQL + 'OffDisabled=''' + @OffDisabled + ''', ';
	ELSE
		SET @SQL = @SQL + 'OffDisabled=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE Offers SET ' + Left(@SQL, Len(@SQL)-1) + ' Where OffId = ' + convert(varchar,@OffId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
