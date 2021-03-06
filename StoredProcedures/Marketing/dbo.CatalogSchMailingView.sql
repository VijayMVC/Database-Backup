/****** Object:  StoredProcedure [dbo].[CatalogSchMailingView]    Script Date: 5/15/2018 12:10:09 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE  PROCEDURE [dbo].[CatalogSchMailingView] 
(
	@CatalogId int
)
AS
(
SELECT MH.MatGHId, MH.MatGHType, MH.MatGHName, Null as MatGPrdId, MH.MatGHSignUpDate as SignUpDate,
	Min(MD.MatGDMailDate) As MatGDMailDate
	FROM MaterialGroupsHdr MH 
	inner join MaterialGroupsDtl MD
		on MD.MatGHId = MH.MatGHId
	Inner Join ProductCategory PC
		On PC.PrdId=MH.MatGHId
	Inner Join CategoryCatalog CC
		On PC.CatId=CC.CatId
	Where MH.MatGHType = 1 And CC.CatlId=@CatalogId
		AND MH.MatGHSignUpDate > getdate()
	Group By MH.MatGHId, MH.MatGHType, MH.MatGHName, MH.MatGHSignUpDate
	
)
Union
(
Select MH.MatGHId, MH.MatGHType, MH.MatGHName, MD.MatGPrdId, MD.MatGDSignUpDate as SignUpDate,
	MD.MatGDMailDate As MatGDMailDate
	FROM MaterialGroupsHdr MH inner join MaterialGroupsDtl MD
		On MD.MatGHId = MH.MatGHId
	Inner Join ProductCategory PC
		On PC.PrdId=MH.MatGHId
	Inner Join CategoryCatalog CC
		On PC.CatId=CC.CatId
	Where MH.MatGHType = 2 And CC.CatlId=@CatalogId
		AND MD.MatGDSignUpDate > getdate()
)
	
Order By MatGDMailDate


GO
