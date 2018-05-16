/****** Object:  StoredProcedure [dbo].[SICTemplateHdrAdd]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.SICTemplateHdrAdd
(
	@SicHStoreId int = NULL,
	@SicHId int = NULL,
	@SicHName varchar(50) = NULL,
	@SicHSicCodes text = NULL
)
AS
INSERT INTO SICTemplateHdr (SicHStoreId, SicHId, SicHName, SicHSicCodes)
 VALUES (@SicHStoreId, @SicHId, @SicHName, @SicHSicCodes);


GO
