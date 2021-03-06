/****** Object:  StoredProcedure [dbo].[MaterialQtyIncrementsUpdate]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialQtyIncrementsUpdate
(
	@MatId int = NULL,
	@MatIncId int = NULL,
	@MatIncQty int = NULL,
	@MatIncQtyFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@MatIncQtyFlag Is Not NULL)
BEGIN
	IF (@MatIncQty Is Not NULL)
		SET @SQL = @SQL + 'MatIncQty=' + convert(varchar,@MatIncQty) + ', ';
	ELSE
		SET @SQL = @SQL + 'MatIncQty=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE MaterialQtyIncrements SET ' + Left(@SQL, Len(@SQL)-1) + ' Where MatId = ' + convert(varchar,@MatId) + ' AND MatIncId = ' + convert(varchar,@MatIncId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
