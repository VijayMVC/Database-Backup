/****** Object:  StoredProcedure [dbo].[ListMgmtView]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE dbo.ListMgmtView
(
	@InMarketDate		char(10) = NULL,
	@StatusId		int
)
AS
IF (@InMarketDate Is Null)
BEGIN
	IF (@StatusId = 1)
	BEGIN
		SELECT oh.OrdHId, oh.OrdHDate, oh.OrdHDesc, oh.OrdHStoreId, odmph.OrdDMPHListRequestQty, oh.OrdHPrdType, op.OrdPmCCStatus
		FROM OrderDtlMailingProfileHdr odmph
		INNER JOIN OrderHdr oh ON (odmph.OrdHId = oh.OrdHId)
		INNER JOIN OrderPayment op ON (op.OrdHId = oh.OrdHId)
		WHERE (oh.OrdHPrdType = 2 OR oh.OrdHPrdType = 3 OR oh.OrdHPrdType = 4) AND 
			oh.OrdHStatus = 4 AND odmph.OrdDMPHPurchaseList = 'Y' AND
			(odmph.OrdDMPHListStatus IS NULL OR odmph.OrdDMPHListStatus = 0 OR odmph.OrdDMPHListStatus = @StatusId) 
		ORDER BY oh.OrdHDate, oh.OrdHType
	END
	ELSE
	BEGIN
		SELECT oh.OrdHId, oh.OrdHDate, oh.OrdHDesc, oh.OrdHStoreId, odmph.OrdDMPHListRequestQty, oh.OrdHPrdType, op.OrdPmCCStatus
		FROM OrderDtlMailingProfileHdr odmph
		INNER JOIN OrderHdr oh ON (odmph.OrdHId = oh.OrdHId)
		INNER JOIN OrderPayment op ON (op.OrdHId = oh.OrdHId)
		WHERE (oh.OrdHPrdType = 2 OR oh.OrdHPrdType = 3 OR oh.OrdHPrdType = 4) AND
			oh.OrdHStatus = 4 AND odmph.OrdDMPHPurchaseList = 'Y' AND
			(op.OrdPmCCStatus = 1 OR op.OrdPmCCStatus = 2) AND (odmph.OrdDMPHListStatus = @StatusId) 
		ORDER BY oh.OrdHDate, oh.OrdHType
	END
END
ELSE
BEGIN
	IF (@StatusId = 1)
	BEGIN
		SELECT oh.OrdHId, oh.OrdHDate, oh.OrdHDesc, oh.OrdHStoreId, odmph.OrdDMPHListRequestQty, oh.OrdHPrdType, op.OrdPmCCStatus
		FROM OrderDtlMailingProfileHdr odmph
		INNER JOIN OrderHdr oh ON (odmph.OrdHId = oh.OrdHId)
		INNER JOIN OrderPayment op ON (op.OrdHId = oh.OrdHId)
		WHERE (oh.OrdHPrdType = 2 OR oh.OrdHPrdType = 3 OR oh.OrdHPrdType = 4) AND 
			oh.OrdHStatus = 4 AND odmph.OrdDMPHPurchaseList = 'Y' AND
			(odmph.OrdDMPHListStatus IS NULL OR odmph.OrdDMPHListStatus = 0 OR odmph.OrdDMPHListStatus = @StatusId) 
			AND oh.OrdHDate = @InMarketDate
		ORDER BY oh.OrdHDate, oh.OrdHType
	END
	ELSE
	BEGIN
		SELECT oh.OrdHId, oh.OrdHDate, oh.OrdHDesc, oh.OrdHStoreId, odmph.OrdDMPHListRequestQty, oh.OrdHPrdType, op.OrdPmCCStatus
		FROM OrderDtlMailingProfileHdr odmph
		INNER JOIN OrderHdr oh ON (odmph.OrdHId = oh.OrdHId)
		INNER JOIN OrderPayment op ON (op.OrdHId = oh.OrdHId)
		WHERE (oh.OrdHPrdType = 2 OR oh.OrdHPrdType = 3 OR oh.OrdHPrdType = 4) AND
			oh.OrdHStatus = 4 AND odmph.OrdDMPHPurchaseList = 'Y' AND
			(op.OrdPmCCStatus = 1 OR op.OrdPmCCStatus = 2) AND (odmph.OrdDMPHListStatus = @StatusId) 
			AND oh.OrdHDate = @InMarketDate
		ORDER BY oh.OrdHDate, oh.OrdHType
	END
END
;


GO
