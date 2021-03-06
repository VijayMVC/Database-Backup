/****** Object:  StoredProcedure [dbo].[VendorAdd]    Script Date: 5/15/2018 12:10:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.VendorAdd
(
	@VndId int = NULL,
	@VndDesc varchar(50) = NULL,
	@VndSignUpDeadline smallint = NULL,
	@VndUploadDBDeadline smallint = NULL,
	@VndPickAndPackShipDays smallint = NULL,
	@VndPickAndPackQtyNotAvail smallint = NULL,
	@VndPickAndPackQtyNotOrd smallint = NULL,
	@VndImprintShipDays smallint = NULL,
	@VndInventoryProcessing char(1) = NULL,
	@VndInventoryRequestStartTime char(5) = NULL,
	@VndCreditCardProcessing char(1) = NULL,
	@VndCreditCardStartTime char(5) = NULL,
	@VndOrderProcessing char(1) = NULL,
	@VndOrderStartTime char(1) = NULL,
	@VndDatabaseRequiredOveragePrc float = NULL,
	@VndPDFFilePath varchar(225) = NULL,
	@VndDBUploadPath varchar(255) = NULL,
	@VndMinImprintCount int = NULL,
	@MarketingCountry int = NULL,
	@VndEmail varchar(255) = NULL,
	@VndPlacedToAcceptedDeadline smallint = NULL,
	@VndListLeadDays smallint = NULL
)
AS
INSERT INTO Vendor (VndId, VndDesc, VndSignUpDeadline, VndUploadDBDeadline, VndPickAndPackShipDays, VndPickAndPackQtyNotAvail, VndPickAndPackQtyNotOrd, VndImprintShipDays, VndInventoryProcessing, VndInventoryRequestStartTime, VndCreditCardProcessing, VndCreditCardStartTime, VndOrderProcessing, VndOrderStartTime, VndDatabaseRequiredOveragePrc, VndPDFFilePath, VndDBUploadPath, VndMinImprintCount, MarketingCountry, VndEmail, VndPlacedToAcceptedDeadline, VndListLeadDays)
 VALUES (@VndId, @VndDesc, @VndSignUpDeadline, @VndUploadDBDeadline, @VndPickAndPackShipDays, @VndPickAndPackQtyNotAvail, @VndPickAndPackQtyNotOrd, @VndImprintShipDays, @VndInventoryProcessing, @VndInventoryRequestStartTime, @VndCreditCardProcessing, @VndCreditCardStartTime, @VndOrderProcessing, @VndOrderStartTime, @VndDatabaseRequiredOveragePrc, @VndPDFFilePath, @VndDBUploadPath, @VndMinImprintCount, @MarketingCountry, @VndEmail, @VndPlacedToAcceptedDeadline, @VndListLeadDays);


GO
