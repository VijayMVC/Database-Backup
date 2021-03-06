/****** Object:  StoredProcedure [dbo].[MaterialLotGetExt]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE dbo.MaterialLotGetExt
(
	@Filter  varchar(4000) = null,
	@OrderBy varchar(4000) = null
)
AS
	DECLARE @SQL varchar(4000);
	SET @SQL =  'SELECT  Material.VendorSKU, Material.MatFolding, MaterialLot.* FROM Material';
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
