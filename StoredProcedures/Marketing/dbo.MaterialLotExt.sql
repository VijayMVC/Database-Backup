/****** Object:  StoredProcedure [dbo].[MaterialLotExt]    Script Date: 5/15/2018 12:10:16 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE dbo.MaterialLotExt
(
	@Filter  varchar(4000) = null,
	@OrderBy varchar(4000) = null
)
AS
	DECLARE @SQL varchar(4000);
	SET @SQL =  'SELECT MatName, MatDesc, Material.MatId, Material.MatVendorSku, MaterialLot.* FROM Material';
	SET @SQL = @SQL + ' JOIN MaterialLot ON Material.MatId = MaterialLot.MatId';
	IF (@Filter Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' Where ' + @Filter;
	END
	IF (@OrderBy Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' Order By  ' + @OrderBy;
	END
;
EXEC(@SQL);


GO
