/****** Object:  StoredProcedure [dbo].[ShoppingCartMaterialView]    Script Date: 5/15/2018 12:10:24 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE   PROCEDURE dbo.ShoppingCartMaterialView 
(
	@StoreId int,
	@VendorId int
)
AS
SELECT SC.ScId, SC.ScPrdId, SC.ScCatId, SC.ScQty, M.MatName, IsNull(P.PrfSName,'Non-Imprintable') as PrfSName, IsNull(P.PrfSId,0) as PrfSId FROM ShoppingCart SC
Inner Join Material M On Sc.ScPrdId=M.MatID
Left Outer Join ProofSet P On M.MatProofSetId=P.PrfSId
Where SC.ScOrderPrdType=1 and SC.ScType=1 AND SC.ScStoreId = @StoreId AND M.MatVendorId=@VendorId
Order By P.PrfSId, M.MatName

GO
