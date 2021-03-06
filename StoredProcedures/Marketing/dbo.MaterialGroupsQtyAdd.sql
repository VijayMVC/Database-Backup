/****** Object:  StoredProcedure [dbo].[MaterialGroupsQtyAdd]    Script Date: 5/15/2018 12:10:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialGroupsQtyAdd
(
	@MatGHid int = NULL,
	@MatGPrdId int = NULL,
	@MatGDDate smalldatetime = NULL,
	@MatGQId int = NULL,
	@MatGQtyBreak smallint = NULL,
	@MatGPriceBreak float = NULL,
	@MatGDBPriceBreak float = NULL
)
AS
INSERT INTO MaterialGroupsQty (MatGHid, MatGPrdId, MatGDDate, MatGQId, MatGQtyBreak, MatGPriceBreak, MatGDBPriceBreak)
 VALUES (@MatGHid, @MatGPrdId, @MatGDDate, @MatGQId, @MatGQtyBreak, @MatGPriceBreak, @MatGDBPriceBreak);


GO
