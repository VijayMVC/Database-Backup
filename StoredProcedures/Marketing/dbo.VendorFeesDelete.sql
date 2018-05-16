/****** Object:  StoredProcedure [dbo].[VendorFeesDelete]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorFeesDelete
(
	@VendorId int,
	@VfConstId int
)
AS
	DELETE FROM VendorFees WHERE VendorId=@VendorId AND VfConstId=@VfConstId;
RETURN @@Rowcount;


GO
