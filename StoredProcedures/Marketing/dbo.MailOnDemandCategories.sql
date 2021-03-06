/****** Object:  StoredProcedure [dbo].[MailOnDemandCategories]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE dbo.MailOnDemandCategories
(
	@Filter  varchar(4000) = null,
	@OrderBy varchar(4000) = null
)
AS
	DECLARE @SQL varchar(4000);
	SET @SQL =  'SELECT Category.* FROM CategoryCatalog ';
	SET @SQL =  @SQL + 'inner join ProductCategory on CategoryCatalog.CatId = ProductCategory.CatId ';
	SET @SQL =  @SQL + 'inner join Category on CategoryCatalog.CatId = Category.CatId ';
	SET @SQL =  @SQL + 'inner join Material on ProductCategory.PrdId = Material.MatId ';
	SET @SQL =  @SQL + 'WHERE Material.MatAvailMailOnDemand = "Y"'
	IF (@OrderBy Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' Order By  ' + @OrderBy;
	END
;
EXEC(@SQL);


GO
