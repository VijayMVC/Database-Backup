/****** Object:  StoredProcedure [dbo].[CatalogGetByID]    Script Date: 5/15/2018 12:10:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.CatalogGetByID
(
	@CatlId int
)
AS
	SELECT * FROM Catalog WHERE CatlId=@CatlId;


GO
