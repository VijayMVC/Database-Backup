/****** Object:  StoredProcedure [dbo].[ProofSetOfferAdd]    Script Date: 5/15/2018 12:10:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ProofSetOfferAdd
(
	@PrfSId int = NULL,
	@OffId int = NULL
)
AS
INSERT INTO ProofSetOffer (PrfSId, OffId)
 VALUES (@PrfSId, @OffId);


GO
