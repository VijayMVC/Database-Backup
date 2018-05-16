/****** Object:  StoredProcedure [dbo].[MaterialQtyIncrementsAdd]    Script Date: 5/15/2018 12:10:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.MaterialQtyIncrementsAdd
(
	@MatId int = NULL,
	@MatIncId int = NULL,
	@MatIncQty int = NULL
)
AS
INSERT INTO MaterialQtyIncrements (MatId, MatIncId, MatIncQty)
 VALUES (@MatId, @MatIncId, @MatIncQty);


GO
