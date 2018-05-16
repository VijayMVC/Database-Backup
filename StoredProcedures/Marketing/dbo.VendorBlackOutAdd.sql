/****** Object:  StoredProcedure [dbo].[VendorBlackOutAdd]    Script Date: 5/15/2018 12:10:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorBlackOutAdd
(
	@VendorId int = NULL,
	@VboMonth tinyint = NULL,
	@VboDay tinyint = NULL,
	@VboDisabled char(1) = NULL
)
AS
INSERT INTO VendorBlackOut (VendorId, VboMonth, VboDay, VboDisabled)
 VALUES (@VendorId, @VboMonth, @VboDay, @VboDisabled);


GO
