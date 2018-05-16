/****** Object:  StoredProcedure [dbo].[ProofSetOfferUpdate]    Script Date: 5/15/2018 12:10:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ProofSetOfferUpdate
(
	@PrfSId int = NULL,
	@OffId int = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE ProofSetOffer SET ' + Left(@SQL, Len(@SQL)-1) + ' Where PrfSId = ' + convert(varchar,@PrfSId) + ' AND OffId = ' + convert(varchar,@OffId) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
