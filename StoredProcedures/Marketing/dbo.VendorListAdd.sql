/****** Object:  StoredProcedure [dbo].[VendorListAdd]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorListAdd
(
	@VndId int = NULL,
	@VndLId int = NULL,
	@VndLType tinyint = NULL,
	@VndLDesc varchar(50) = NULL,
	@VndLValues text = NULL,
	@VndLDisable char(1) = NULL
)
AS
INSERT INTO VendorList (VndId, VndLId, VndLType, VndLDesc, VndLValues, VndLDisable)
 VALUES (@VndId, @VndLId, @VndLType, @VndLDesc, @VndLValues, @VndLDisable);


GO
