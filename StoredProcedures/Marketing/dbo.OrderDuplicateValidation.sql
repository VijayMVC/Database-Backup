/****** Object:  StoredProcedure [dbo].[OrderDuplicateValidation]    Script Date: 5/15/2018 12:10:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF

CREATE     PROCEDURE dbo.OrderDuplicateValidation
(
	@StoreId int,
	@PrdType int,
	@PrdId	 int,
	@MailDate datetime = null
)
AS
	DECLARE @SQL varchar(4000);
	SET @SQL =  '(Select D.OrdHId as ID From OrderDtl D Inner Join OrderHdr H On D.OrdHId=H.OrdHId';
	SET @SQL = @SQL + ' Where ';
	SET @SQL = @SQL + 'H.OrdHStoreId = ' + convert(varchar,@StoreId);
	SET @SQL = @SQL + ' AND H.OrdHPrdType = ' + convert(varchar,@PrdType);
	SET @SQL = @SQL + ' AND D.OrdDPrdGId = ' + convert(varchar,@PrdId);
	SET @SQL = @SQL + ' AND (H.OrdHStatus <> 5 and H.OrdHStatus <> 6)';
	IF (@MailDate Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' AND D.OrdDPrdGDMailDate = ''' + convert(varchar,@MailDate) + '''';
	END
	SET @SQL = @SQL + ') union (';
	SET @SQL = @SQL + 'Select ScId as ID From ShoppingCart';
	SET @SQL = @SQL + ' Where ';
	SET @SQL = @SQL + 'ScStoreId = ' + convert(varchar,@StoreId);
	SET @SQL = @SQL + ' AND ScType = 1';
	SET @SQL = @SQL + ' AND ScOrderPrdType = ' + convert(varchar,@PrdType);
	SET @SQL = @SQL + ' AND ScPrdGId = ' + convert(varchar,@PrdId);
	IF (@MailDate Is Not NULL)
	BEGIN
		SET @SQL = @SQL + ' AND ScMailDate = ''' + convert(varchar,@MailDate) + '''';
	END
	SET @SQL = @SQL + ')';
Print(@SQL);
EXEC(@SQL);


GO
