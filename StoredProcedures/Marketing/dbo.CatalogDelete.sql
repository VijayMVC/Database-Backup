/****** Object:  StoredProcedure [dbo].[CatalogDelete]    Script Date: 5/15/2018 12:10:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.CatalogDelete
(
	@CatlId int
)
AS
	DELETE FROM Catalog WHERE CatlId=@CatlId;
RETURN @@Rowcount;


GO
