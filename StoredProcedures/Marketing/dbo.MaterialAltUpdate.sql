/****** Object:  StoredProcedure [dbo].[MaterialAltUpdate]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialAltUpdate
(
	@MatId int = NULL,
	@MatAltId int = NULL,
	@MatAltOrder smallint = NULL,
	@MatAltOrderFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@MatAltOrderFlag Is Not NULL)
BEGIN
	IF (@MatAltOrder Is Not NULL)
		SET @SQL = @SQL + 'MatAltOrder=' + convert(varchar,@MatAltOrder) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatAltOrder=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE MaterialAlt SET ' + Left(@SQL, Len(@SQL)-1) + ' Where MatId = ' + convert(varchar,@MatId) + ' AND MatAltId = ' + convert(varchar,@MatAltId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
