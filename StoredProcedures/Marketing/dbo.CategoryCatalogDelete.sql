/****** Object:  StoredProcedure [dbo].[CategoryCatalogDelete]    Script Date: 5/15/2018 12:10:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.CategoryCatalogDelete
(
	@CatlId int,
	@CatId int
)
AS
	DELETE FROM CategoryCatalog WHERE CatlId=@CatlId AND CatId=@CatId;
RETURN @@Rowcount;


GO
