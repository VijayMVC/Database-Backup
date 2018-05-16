/****** Object:  StoredProcedure [dbo].[ProductCategoryAdd]    Script Date: 5/15/2018 12:10:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ProductCategoryAdd
(
	@CatId int = NULL,
	@PrdId int = NULL,
	@CatType tinyint = NULL
)
AS
INSERT INTO ProductCategory (CatId, PrdId, CatType)
 VALUES (@CatId, @PrdId, @CatType);


GO
