/****** Object:  StoredProcedure [dbo].[VendorFeesAdd]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorFeesAdd
(
	@VendorId int = NULL,
	@VfConstId int = NULL,
	@VfQty int = NULL,
	@VfQtyFee real = NULL,
	@VfExtraFee real = NULL
)
AS
INSERT INTO VendorFees (VendorId, VfConstId, VfQty, VfQtyFee, VfExtraFee)
 VALUES (@VendorId, @VfConstId, @VfQty, @VfQtyFee, @VfExtraFee);


GO
