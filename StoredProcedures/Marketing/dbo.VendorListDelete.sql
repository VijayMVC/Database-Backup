/****** Object:  StoredProcedure [dbo].[VendorListDelete]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorListDelete
(
	@VndLId int
)
AS
	DELETE FROM VendorList WHERE VndLId=@VndLId;
RETURN @@Rowcount;


GO
