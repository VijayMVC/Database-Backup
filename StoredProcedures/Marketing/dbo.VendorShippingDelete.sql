/****** Object:  StoredProcedure [dbo].[VendorShippingDelete]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorShippingDelete
(
	@VndSId int
)
AS
	DELETE FROM VendorShipping WHERE VndSId=@VndSId;
RETURN @@Rowcount;


GO
