/****** Object:  StoredProcedure [dbo].[OrderDtlProofSetDelete]    Script Date: 5/15/2018 12:10:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlProofSetDelete
(
	@OrdPSId int
)
AS
	DELETE FROM OrderDtlProofSet WHERE OrdPSId=@OrdPSId;
RETURN @@Rowcount;


GO
