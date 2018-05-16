/****** Object:  StoredProcedure [dbo].[ProofSetOfferDelete]    Script Date: 5/15/2018 12:10:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ProofSetOfferDelete
(
	@PrfSId int,
	@OffId int
)
AS
	DELETE FROM ProofSetOffer WHERE PrfSId=@PrfSId AND OffId=@OffId;
RETURN @@Rowcount;


GO
