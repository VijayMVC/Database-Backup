/****** Object:  StoredProcedure [dbo].[VendorShippingAdd]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorShippingAdd
(
	@VndSId int = NULL,
	@VndId int = NULL,
	@VndSType tinyint = NULL,
	@VndSDesc varchar(50) = NULL,
	@VndSVar1 float = NULL,
	@VndSVar2 float = NULL,
	@VndSVar3 float = NULL
)
AS
INSERT INTO VendorShipping (VndSId, VndId, VndSType, VndSDesc, VndSVar1, VndSVar2, VndSVar3)
 VALUES (@VndSId, @VndId, @VndSType, @VndSDesc, @VndSVar1, @VndSVar2, @VndSVar3);


GO
