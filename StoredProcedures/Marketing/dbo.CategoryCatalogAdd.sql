/****** Object:  StoredProcedure [dbo].[CategoryCatalogAdd]    Script Date: 5/15/2018 12:10:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.CategoryCatalogAdd
(
	@CatlId int = NULL,
	@CatId int = NULL
)
AS
INSERT INTO CategoryCatalog (CatlId, CatId)
 VALUES (@CatlId, @CatId);


GO
