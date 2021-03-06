/****** Object:  StoredProcedure [dbo].[SubsidyAmountGet]    Script Date: 5/15/2018 12:10:28 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF

CREATE     PROCEDURE dbo.SubsidyAmountGet
(
	@OrderId  int,
	@OrdDPrdId int = null,
	@MarketingCountry int = null,
	@OrderBy varchar(4000) = null
)
AS
	DECLARE @SQL varchar(4000);
	SET @SQL = 'SELECT ' +
		'OrderHdr.OrdHStoreId, (OrderHdr.OrdHAmount - OrderHdr.OrdHHandlingFee - OrderHdr.OrdHShipEstCost) as OrderCost, YEAR(OrderHdr.OrdHDate) AS CalendarYear,  ' +
		'OrderDtl.OrdDPrdId, OrderDtl.OrdDAmount, ' +
		'MaterialSubsidy.SubHId, SubsidyDtl.SubDId, SubsidyHdr.SubHDesc, ' +
		'SubsidyHdr.SubHType, SubsidyDtl.SubDUptoAmount, SubsidyDtl.SubDAmount, ' +
		'isnull(StoreSubsidy.StoreSubRemainingAmount, SubsidyDtl.SubDAmount) as Amount  ' +
		'from OrderHdr  ' +
		'INNER JOIN OrderDtl ON  ' +
		'	OrderHdr.OrdHId = OrderDtl.OrdHId  ' +
		'INNER JOIN MaterialSubsidy ON  ' +
		'	OrderDtl.OrdDPrdId = MaterialSubsidy.MatId  ' +
		'INNER JOIN SubsidyHdr ON  ' +
		'	MaterialSubsidy.SubHId = SubsidyHdr.SubHId  ' +
		'	AND SubsidyHdr.SubHDisable <> "Y"  ' +
		'	AND SubsidyHdr.SubHType <> 4  ' +
		'INNER JOIN SubsidyDtl ON  ' +
		'	SubsidyDtl.SubHId = SubsidyHdr.SubHId  ' +
		'	AND SubsidyDtl.SubDCalanderYear = YEAR(OrderHdr.OrdHDate) ' +
		'LEFT OUTER JOIN StoreSubsidy ON  ' +
		'	MaterialSubsidy.SubHId = StoreSubsidy.StoreSubHId  ' +
		'	AND StoreSubsidy.StoreSId = OrderHdr.OrdHStoreId  ' +
		'	AND StoreSubsidy.StoreSubYear = YEAR(OrderHdr.OrdHDate)  ' +
		'Where OrderHdr.OrdHId = ' + Convert(varchar(50),@OrderId)
	
	IF (@OrdDPrdId Is Not NULL)
	BEGIN
	 	SET @SQL = @SQL + ' AND OrderDtl.OrdDPrdId = ' + Convert(varchar(50),@OrdDPrdId);
	END		
		
	IF (@MarketingCountry Is Not NULL)
	BEGIN
	 	SET @SQL = @SQL + ' AND SubsidyHdr.SubHMrktCountry = ' + Convert(varchar(50),@MarketingCountry);
	END
	
	IF (@OrderBy Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' Order By  ' + @OrderBy;
	END
;
PRINT @SQL;
EXEC(@SQL);


GO
