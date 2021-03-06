/****** Object:  StoredProcedure [dbo].[MultiImpressionSchMailingView]    Script Date: 5/15/2018 12:10:18 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE   PROCEDURE dbo.MultiImpressionSchMailingView
(
	@CatalogId  varchar(4000) = null,
	@Year varchar(100) = null,
	@OrderBy varchar(4000) = null
)
AS
	DECLARE @SQL varchar(4000);
--	isnull(RMP1.RMPHId, isnull(RMP2.RMPHId, '''')) as RMPHId, isnull(RMP1.RMPHName, isnull(RMP2.RMPHName, '''')) as RMPHName,
	SET @SQL = 
		'SELECT DISTINCT   
			MaterialGroupsHdr.MatGHId, MaterialGroupsHdr.MatGHType, MaterialGroupsHdr.MatGHSignUpDate, MaterialGroupsDtl.MatGDSignUpDate, 
			MaterialGroupsDtl.MatGDMailDate, MaterialGroupsHdr.MatGHName, MaterialGroupsDtl.MatGPrdId, 
			DatePart(MONTH, MaterialGroupsDtl.MatGDMailDate) as MailDateMonth, CategoryCatalog.CatId
		FROM  	CategoryCatalog
			INNER JOIN ProductCategory ON 
				CategoryCatalog.CatId = ProductCategory.CatId
			INNER JOIN MaterialGroupsHdr ON 
				ProductCategory.PrdId = MaterialGroupsHdr.MatGHId AND 
				ProductCategory.CatType = MaterialGroupsHdr.MatGHType 
			INNER JOIN MaterialGroupsDtl ON 
				MaterialGroupsHdr.MatGHId = MaterialGroupsDtl.MatGHId 
			INNER JOIN Material ON
				Material.MatID = MaterialGroupsDtl.MatGPrdId
			INNER JOIN Category ON 
				CategoryCatalog.CatId = Category.CatId 
--			Left outer join
--			(
--				SELECT distinct RMPHdr.RMPHId, RMPHdr.RMPHName, RMPDtl.MatGHType, RMPDtl.MatGHId, RMPDtl.MatGPrdId, RMPDtl.MatGDMailDate
--				FROM  	CategoryCatalog 
--					INNER JOIN ProductCategory ON 
--						CategoryCatalog.CatId = ProductCategory.CatId 
--					INNER JOIN RMPHdr ON 
--						ProductCategory.PrdId = RMPHdr.RMPHId 
--					INNER JOIN Category ON 
--						CategoryCatalog.CatId = Category.CatId 
--					INNER JOIN RMPDtl ON 
--						RMPHdr.RMPHId = RMPDtl.RMPHId 
--				WHERE (CategoryCatalog.CatlId = '  + @CatalogId + ') AND (YEAR(RMPDtl.MatGDMailDate) = ' + @Year + ') AND (ProductCategory.CatType = 3) AND (RMPHdr.RMPHDisabled = ''N'') AND (Category.CatDisabled = ''N'') AND (RMPDtl.MatGHType = 2)
--			) RMP2 on 
--				RMP2.MatGHId = MaterialGroupsDtl.MatGHId AND RMP2.MatGPrdId = MaterialGroupsDtl.MatGPrdId AND RMP2.MatGDMailDate = MaterialGroupsDtl.MatGDMailDate
--			Left outer join
--			(
--				SELECT distinct RMPHdr.RMPHId, RMPHdr.RMPHName, RMPDtl.MatGHType, RMPDtl.MatGHId, RMPDtl.MatGPrdId, RMPDtl.MatGDMailDate
--				FROM  CategoryCatalog 
--					INNER JOIN ProductCategory ON 
--						CategoryCatalog.CatId = ProductCategory.CatId 
--					INNER JOIN RMPHdr ON 
--						ProductCategory.PrdId = RMPHdr.RMPHId 
--					INNER JOIN Category ON 
--						CategoryCatalog.CatId = Category.CatId 
--					INNER JOIN RMPDtl ON 
--						RMPHdr.RMPHId = RMPDtl.RMPHId 
--				WHERE (CategoryCatalog.CatlId = '  + @CatalogId + ') AND (YEAR(RMPDtl.MatGDMailDate) = ' + @Year + ') AND (ProductCategory.CatType = 3) AND (RMPHdr.RMPHDisabled = ''N'') AND (Category.CatDisabled = ''N'') AND (RMPDtl.MatGHType = 1)
--			) 
--			RMP1 ON 
--				RMP1.MatGHId = MaterialGroupsDtl.MatGHId 
		WHERE (ProductCategory.CatType = 1 OR ProductCategory.CatType = 2) AND (YEAR(MaterialGroupsDtl.MatGDMailDate) =  ' + @Year +')  AND (Category.CatDisabled = ''N'') AND (CategoryCatalog.CatlId = '  + @CatalogId + ')';
	IF (@OrderBy Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' Order By  ' + @OrderBy;
	END
;
--PRINT(@SQL);
EXEC(@SQL);


GO
