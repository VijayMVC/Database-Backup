/****** Object:  StoredProcedure [dbo].[CatalogAdd]    Script Date: 5/15/2018 12:10:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.CatalogAdd
(
	@CatlId int = NULL,
	@CatlName varchar(50) = NULL,
	@CatlMarketingCountry smallint = NULL,
	@CatlDisabled char(1) = NULL
)
AS
INSERT INTO Catalog (CatlId, CatlName, CatlMarketingCountry, CatlDisabled)
 VALUES (@CatlId, @CatlName, @CatlMarketingCountry, @CatlDisabled);


GO
