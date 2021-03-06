/****** Object:  StoredProcedure [dbo].[ListCountView]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE dbo.ListCountView
(
	@StoreId Int
)
 AS
	IF (@StoreId = 0)
	BEGIN
		Select  OH.OrdHId from OrderHdr OH
			Inner Join OrderDtlMailingProfileHdr MPH On MPH.OrdHId = OH.OrdHId
			Where OH.OrdHStatus = 4
			AND OH.OrdHPrdType <> 1
			AND MPH.OrdDMPHListStatus = 1
			AND MPH.OrdDMPHPurchaseList = 'Y'
	END
	ELSE
	BEGIN
		Select  OH.OrdHId from OrderHdr OH
			Inner Join OrderDtlMailingProfileHdr MPH On MPH.OrdHId = OH.OrdHId
			Where OH.OrdHStatus = 4
			AND OH.OrdHPrdType <> 1
			AND MPH.OrdDMPHListStatus = 1
			AND MPH.OrdDMPHPurchaseList = 'Y'
			AND OH.OrdHStoreId = @StoreId
	END


GO
