/****** Object:  StoredProcedure [dbo].[CategoryDelete]    Script Date: 5/15/2018 12:10:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.CategoryDelete
(
	@CatId int
)
AS
	DELETE FROM Category WHERE CatId=@CatId;
RETURN @@Rowcount;


GO
