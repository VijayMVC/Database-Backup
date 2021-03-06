/****** Object:  StoredProcedure [dbo].[OrderDtlProofSetLayersAdd]    Script Date: 5/15/2018 12:10:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlProofSetLayersAdd
(
	@PrfSId int = NULL,
	@PrfLId int = NULL,
	@OrdPSId int = NULL,
	@OrdPSLId int = NULL,
	@OrdPSLType tinyint = NULL,
	@OrdPSLOffId int = NULL,
	@OrdPSLLock char(1) = NULL,
	@OrdPSLCoordX1 int = NULL,
	@OrdPSLCoordY1 int = NULL,
	@OrdPSLCoordX2 int = NULL,
	@OrdPSLCoordY2 int = NULL,
	@OrdPSLRotation int = NULL,
	@OrdPSLImage varchar(50) = NULL,
	@OrdPSLText text = NULL
)
AS
INSERT INTO OrderDtlProofSetLayers (PrfSId, PrfLId, OrdPSId, OrdPSLId, OrdPSLType, OrdPSLOffId, OrdPSLLock, OrdPSLCoordX1, OrdPSLCoordY1, OrdPSLCoordX2, OrdPSLCoordY2, OrdPSLRotation, OrdPSLImage, OrdPSLText)
 VALUES (@PrfSId, @PrfLId, @OrdPSId, @OrdPSLId, @OrdPSLType, @OrdPSLOffId, @OrdPSLLock, @OrdPSLCoordX1, @OrdPSLCoordY1, @OrdPSLCoordX2, @OrdPSLCoordY2, @OrdPSLRotation, @OrdPSLImage, @OrdPSLText);


GO
