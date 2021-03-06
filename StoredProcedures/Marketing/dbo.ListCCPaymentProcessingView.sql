/****** Object:  StoredProcedure [dbo].[ListCCPaymentProcessingView]    Script Date: 5/15/2018 12:10:14 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE PROCEDURE dbo.ListCCPaymentProcessingView
(
	@Filter  varchar(1000) = null,
	@OrderBy varchar(1000) = null
)
AS
	DECLARE @SQL varchar(4000);
	SET @SQL = 'SELECT oh.*,
	op.OrdPmDate, op.OrdPmType, op.OrdPmCCStatus, odmph.OrdDMPHListStatus
	FROM OrderHdr oh
	INNER JOIN OrderPayment op ON (op.OrdHId = oh.OrdHId)
	LEFT OUTER JOIN OrderDtlMailingProfileHdr odmph ON (odmph.OrdHId = oh.OrdHId)
	WHERE oh.OrdHStatus = 4 AND oh.OrdHSubStatus = 1 AND op.OrdPmType = 2 AND
	(op.OrdPmCCStatus IS NULL OR op.OrdPmCCStatus = 0) AND
	(odmph.OrdDMPHListStatus IS NULL OR odmph.OrdDMPHListStatus = 3)';
	
	IF (@Filter Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' AND ' + @Filter;
	END
	IF (@OrderBy Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' ORDER BY  ' + @OrderBy;
	END
	;
	EXEC(@SQL);


GO
