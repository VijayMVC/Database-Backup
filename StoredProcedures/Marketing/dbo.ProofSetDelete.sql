/****** Object:  StoredProcedure [dbo].[ProofSetDelete]    Script Date: 5/15/2018 12:10:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ProofSetDelete
(
	@PrfSId int
)
AS
	DELETE FROM ProofSet WHERE PrfSId=@PrfSId;
RETURN @@Rowcount;


GO
