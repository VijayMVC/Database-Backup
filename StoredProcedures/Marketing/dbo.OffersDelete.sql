/****** Object:  StoredProcedure [dbo].[OffersDelete]    Script Date: 5/15/2018 12:10:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OffersDelete
(
	@OffId int
)
AS
	DELETE FROM Offers WHERE OffId=@OffId;
RETURN @@Rowcount;


GO
