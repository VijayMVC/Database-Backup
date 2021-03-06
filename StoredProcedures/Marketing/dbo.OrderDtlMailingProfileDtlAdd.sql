/****** Object:  StoredProcedure [dbo].[OrderDtlMailingProfileDtlAdd]    Script Date: 5/15/2018 12:10:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderDtlMailingProfileDtlAdd
(
	@OrdDMPHId int = NULL,
	@OrdDMPDId int = NULL,
	@OrdDMPDType tinyint = NULL,
	@OrdDMPDSelection char(1) = NULL,
	@OrdDMPDQty int = NULL,
	@OrdDMPDQtyFee float = NULL,
	@OrdDMPDExtraFee float = NULL,
	@OrdDMPDAmount float = NULL,
	@OrdDMPDSICTemplateId int = NULL,
	@OrdDMPDSICTemplateName varchar(255) = NULL,
	@OrdDMPDSICModified bit = NULL,
	@OrdDMPDValues text = NULL,
	@OrdDMPDVisited bit = NULL
)
AS
INSERT INTO OrderDtlMailingProfileDtl (OrdDMPHId, OrdDMPDId, OrdDMPDType, OrdDMPDSelection, OrdDMPDQty, OrdDMPDQtyFee, OrdDMPDExtraFee, OrdDMPDAmount, OrdDMPDSICTemplateId, OrdDMPDSICTemplateName, OrdDMPDSICModified, OrdDMPDValues, OrdDMPDVisited)
 VALUES (@OrdDMPHId, @OrdDMPDId, @OrdDMPDType, @OrdDMPDSelection, @OrdDMPDQty, @OrdDMPDQtyFee, @OrdDMPDExtraFee, @OrdDMPDAmount, @OrdDMPDSICTemplateId, @OrdDMPDSICTemplateName, @OrdDMPDSICModified, @OrdDMPDValues, @OrdDMPDVisited);


GO
