/****** Object:  StoredProcedure [dbo].[MaterialReOrderLogAdd]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialReOrderLogAdd
(
	@MatId int = NULL,
	@MatLotId int = NULL,
	@MatRId int = NULL,
	@MatRQty smallint = NULL,
	@MatRPrice float = NULL,
	@MatRDate smalldatetime = NULL,
	@MatRPDFFileName varchar(50) = NULL
)
AS
INSERT INTO MaterialReOrderLog (MatId, MatLotId, MatRId, MatRQty, MatRPrice, MatRDate, MatRPDFFileName)
 VALUES (@MatId, @MatLotId, @MatRId, @MatRQty, @MatRPrice, @MatRDate, @MatRPDFFileName);


GO
