/****** Object:  StoredProcedure [dbo].[MaterialQtyIncrementsDelete]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialQtyIncrementsDelete
(
	@MatId int,
	@MatIncId int
)
AS
	DELETE FROM MaterialQtyIncrements WHERE MatId=@MatId AND MatIncId=@MatIncId;
RETURN @@Rowcount;


GO
