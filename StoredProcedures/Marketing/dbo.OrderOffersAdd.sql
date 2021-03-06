/****** Object:  StoredProcedure [dbo].[OrderOffersAdd]    Script Date: 5/15/2018 12:10:21 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderOffersAdd
(
	@OrdOStoreId int = NULL,
	@OrdHid int = NULL,
	@OrdPSId int = NULL,
	@OrdOffId int = NULL,
	@PrdDPrdId int = NULL,
	@OrdOffType tinyint = NULL,
	@OrdOffImage varchar(50) = NULL
)
AS
INSERT INTO OrderOffers (OrdOStoreId, OrdHid, OrdPSId, OrdOffId, PrdDPrdId, OrdOffType, OrdOffImage)
 VALUES (@OrdOStoreId, @OrdHid, @OrdPSId, @OrdOffId, @PrdDPrdId, @OrdOffType, @OrdOffImage);


GO
