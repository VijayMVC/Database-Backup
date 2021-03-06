/****** Object:  StoredProcedure [dbo].[ConstDescUpdate]    Script Date: 5/15/2018 12:10:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ConstDescUpdate
(
	@ConstGroupId int = NULL,
	@ConstId int = NULL,
	@Description varchar(50) = NULL,
	@DescriptionFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@DescriptionFlag Is Not NULL)
BEGIN
	IF (@Description Is Not NULL)
		SET @SQL = @SQL + 'Description=''' + @Description + ''', ';
	ELSE
		SET @SQL = @SQL + 'Description=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE ConstDesc SET ' + Left(@SQL, Len(@SQL)-1) + ' Where ConstGroupId = ' + convert(varchar,@ConstGroupId) + ' AND ConstId = ' + convert(varchar,@ConstId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
