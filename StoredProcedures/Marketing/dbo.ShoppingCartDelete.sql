/****** Object:  StoredProcedure [dbo].[ShoppingCartDelete]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.ShoppingCartDelete
(
	@ScId int
)
AS
	DELETE FROM ShoppingCart WHERE ScId=@ScId;
RETURN @@Rowcount;


GO
