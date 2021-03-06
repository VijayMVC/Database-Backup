/****** Object:  StoredProcedure [dbo].[MaterialLotViewGet]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialLotViewGet
(
	@Filter  varchar(4000) = null,
	@OrderBy varchar(4000) = null
)
AS
	DECLARE @SQL varchar(4000);
	SET @SQL =  'SELECT DISTINCT MaterialLot.MatId FROM  MaterialLot INNER JOIN Material ON MaterialLot.MatId = Material.MatId';
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
