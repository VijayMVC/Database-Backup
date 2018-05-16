/****** Object:  StoredProcedure [dbo].[OrderProperties_OLDAdd]    Script Date: 5/15/2018 12:10:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderProperties_OLDAdd
(
	@OrdHId int = NULL,
	@OrdPId int = NULL,
	@OrdPEstShipDate smalldatetime = NULL,
	@OrdPActShipDate smalldatetime = NULL
)
AS
INSERT INTO OrderProperties_OLD (OrdHId, OrdPId, OrdPEstShipDate, OrdPActShipDate)
 VALUES (@OrdHId, @OrdPId, @OrdPEstShipDate, @OrdPActShipDate);


GO
