/****** Object:  StoredProcedure [dbo].[OrderHdrAdd]    Script Date: 5/15/2018 12:10:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderHdrAdd
(
	@OrdHId int = NULL,
	@OrdHType tinyint = NULL,
	@OrdHOrigOrderId int = NULL,
	@OrdHVendorId int = NULL,
	@OrdHPrdType tinyint = NULL,
	@OrdHStoreNum int = NULL,
	@OrdHStoreId int = NULL,
	@OrdHDesc varchar(255) = NULL,
	@OrdHDate smalldatetime = NULL,
	@OrdHSignUpDeadline smalldatetime = NULL,
	@OrdHAmount float = NULL,
	@OrdHHandlingFee float = NULL,
	@OrdHMailOnDemandFee float = NULL,
	@OrdHMailOnDemandQty int = NULL,
	@OrdHMailOnDemandAmount float = NULL,
	@OrdHStatus tinyint = NULL,
	@OrdHSubStatus tinyint = NULL,
	@OrdHFulfillmentDate smalldatetime = NULL,
	@OrdHCCValidationDate smalldatetime = NULL,
	@OrdHShipAddr1 varchar(255) = NULL,
	@OrdHShipAddr2 varchar(255) = NULL,
	@OrdHShipCity varchar(50) = NULL,
	@OrdHShipState varchar(50) = NULL,
	@OrdHShipPostalCode varchar(50) = NULL,
	@OrdHShipCountry varchar(50) = NULL,
	@OrdHShipSpecialInst varchar(4000) = NULL,
	@OrdHShipMethod tinyint = NULL,
	@OrdHShipEstCost float = NULL,
	@OrdhTrackingNumber varchar(50) = NULL,
	@OrdHOrdered smalldatetime = NULL,
	@OrdHStateChanged smalldatetime = NULL,
	@OrdHFulfillmentEmailSent varchar(1) = NULL,
	@OrdHMailingType tinyint = NULL,
	@OrdHFoldingAmount float = NULL,
	@OrdHImprintAmount float = NULL,
	@OrdHUserId int = NULL,
	@OrdHFCGList bit = NULL
)
AS
INSERT INTO OrderHdr (OrdHId, OrdHType, OrdHOrigOrderId, OrdHVendorId, OrdHPrdType, OrdHStoreNum, OrdHStoreId, OrdHDesc, OrdHDate, OrdHSignUpDeadline, OrdHAmount, OrdHHandlingFee, OrdHMailOnDemandFee, OrdHMailOnDemandQty, OrdHMailOnDemandAmount, OrdHStatus, OrdHSubStatus, OrdHFulfillmentDate, OrdHCCValidationDate, OrdHShipAddr1, OrdHShipAddr2, OrdHShipCity, OrdHShipState, OrdHShipPostalCode, OrdHShipCountry, OrdHShipSpecialInst, OrdHShipMethod, OrdHShipEstCost, OrdhTrackingNumber, OrdHOrdered, OrdHStateChanged, OrdHFulfillmentEmailSent, OrdHMailingType, OrdHFoldingAmount, OrdHImprintAmount, OrdHUserId, OrdHFCGList)
 VALUES (@OrdHId, @OrdHType, @OrdHOrigOrderId, @OrdHVendorId, @OrdHPrdType, @OrdHStoreNum, @OrdHStoreId, @OrdHDesc, @OrdHDate, @OrdHSignUpDeadline, @OrdHAmount, @OrdHHandlingFee, @OrdHMailOnDemandFee, @OrdHMailOnDemandQty, @OrdHMailOnDemandAmount, @OrdHStatus, @OrdHSubStatus, @OrdHFulfillmentDate, @OrdHCCValidationDate, @OrdHShipAddr1, @OrdHShipAddr2, @OrdHShipCity, @OrdHShipState, @OrdHShipPostalCode, @OrdHShipCountry, @OrdHShipSpecialInst, @OrdHShipMethod, @OrdHShipEstCost, @OrdhTrackingNumber, @OrdHOrdered, @OrdHStateChanged, @OrdHFulfillmentEmailSent, @OrdHMailingType, @OrdHFoldingAmount, @OrdHImprintAmount, @OrdHUserId, @OrdHFCGList);


GO
