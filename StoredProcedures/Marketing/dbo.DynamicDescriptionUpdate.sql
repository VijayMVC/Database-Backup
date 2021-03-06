/****** Object:  StoredProcedure [dbo].[DynamicDescriptionUpdate]    Script Date: 5/15/2018 12:10:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.DynamicDescriptionUpdate
(
	@DynDescId int = NULL,
	@DynDescFilename varchar(50) = NULL,
	@DynDescFilenameFlag bit = NULL,
	@DynDescCategory varchar(50) = NULL,
	@DynDescCategoryFlag bit = NULL,
	@DynDescDescription varchar(1500) = NULL,
	@DynDescDescriptionFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@DynDescFilenameFlag Is Not NULL)
BEGIN
	IF (@DynDescFilename Is Not NULL)
		SET @SQL = @SQL + 'DynDescFilename=''' + @DynDescFilename + ''', ';
	ELSE
		SET @SQL = @SQL + 'DynDescFilename=NULL, ';
END
IF (@DynDescCategoryFlag Is Not NULL)
BEGIN
	IF (@DynDescCategory Is Not NULL)
		SET @SQL = @SQL + 'DynDescCategory=''' + @DynDescCategory + ''', ';
	ELSE
		SET @SQL = @SQL + 'DynDescCategory=NULL, ';
END
IF (@DynDescDescriptionFlag Is Not NULL)
BEGIN
	IF (@DynDescDescription Is Not NULL)
		SET @SQL = @SQL + 'DynDescDescription=''' + @DynDescDescription + ''', ';
	ELSE
		SET @SQL = @SQL + 'DynDescDescription=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE DynamicDescription SET ' + Left(@SQL, Len(@SQL)-1) + ' Where DynDescId = ' + convert(varchar,@DynDescId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
