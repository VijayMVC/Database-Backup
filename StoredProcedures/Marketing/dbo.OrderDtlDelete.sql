/****** Object:  StoredProcedure [dbo].[OrderDtlDelete]    Script Date: 5/15/2018 12:10:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlDelete
(
	@OrdHId int,
	@OrdDId int
)
AS
	DELETE FROM OrderDtl WHERE OrdHId=@OrdHId AND OrdDId=@OrdDId;
RETURN @@Rowcount;


GO
