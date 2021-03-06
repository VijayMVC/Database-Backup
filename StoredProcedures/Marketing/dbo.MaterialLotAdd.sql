/****** Object:  StoredProcedure [dbo].[MaterialLotAdd]    Script Date: 5/15/2018 12:10:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialLotAdd
(
	@MatId int = NULL,
	@MatLotId int = NULL,
	@MatLotDesc varchar(20) = NULL,
	@MatLotVQOH int = NULL,
	@MatLotVQtyAllocated int = NULL,
	@MatLotSMatQtyAllocated int = NULL,
	@MatLotSMailQtyAllocated int = NULL,
	@MatLotQtyOnOrder int = NULL,
	@MatLotOriginalOrderAmount int = NULL,
	@MatLotUnitCost real = NULL,
	@MatLotUnitPrice real = NULL,
	@MatLotUnitSalePrice real = NULL,
	@MatLotDateAdded smalldatetime = NULL,
	@MatLotPDFFileName varchar(50) = NULL,
	@MatLotOwner tinyint = NULL,
	@MatLotStatus tinyint = NULL,
	@MatLotImageFile varchar(50) = NULL,
	@MatLotImage varchar(50) = NULL,
	@MatLotProofImageFile varchar(50) = NULL,
	@MatLotProofImage varchar(50) = NULL
)
AS
INSERT INTO MaterialLot (MatId, MatLotId, MatLotDesc, MatLotVQOH, MatLotVQtyAllocated, MatLotSMatQtyAllocated, MatLotSMailQtyAllocated, MatLotQtyOnOrder, MatLotOriginalOrderAmount, MatLotUnitCost, MatLotUnitPrice, MatLotUnitSalePrice, MatLotDateAdded, MatLotPDFFileName, MatLotOwner, MatLotStatus, MatLotImageFile, MatLotImage, MatLotProofImageFile, MatLotProofImage)
 VALUES (@MatId, @MatLotId, @MatLotDesc, @MatLotVQOH, @MatLotVQtyAllocated, @MatLotSMatQtyAllocated, @MatLotSMailQtyAllocated, @MatLotQtyOnOrder, @MatLotOriginalOrderAmount, @MatLotUnitCost, @MatLotUnitPrice, @MatLotUnitSalePrice, @MatLotDateAdded, @MatLotPDFFileName, @MatLotOwner, @MatLotStatus, @MatLotImageFile, @MatLotImage, @MatLotProofImageFile, @MatLotProofImage);


GO
