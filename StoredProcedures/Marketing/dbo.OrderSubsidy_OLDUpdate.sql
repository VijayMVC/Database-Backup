/****** Object:  StoredProcedure [dbo].[OrderSubsidy_OLDUpdate]    Script Date: 5/15/2018 12:10:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.OrderSubsidy_OLDUpdate
(
	@OrdSStoreId int = NULL,
	@OrdSStoreIdFlag bit = NULL,
	@OrdHid int = NULL,
	@OrdDId int = NULL,
	@OrdSHId int = NULL,
	@OrdSDType tinyint = NULL,
	@OrdSHType int = NULL,
	@OrdSHTypeFlag bit = NULL,
	@OrdDPrdId int = NULL,
	@OrdDPrdIdFlag bit = NULL,
	@OrdSAmount float = NULL,
	@OrdSAmountFlag bit = NULL
)
AS
DECLARE @SQL varchar(4000);
SET @SQL = ' ';
IF (@OrdSStoreIdFlag Is Not NULL)
BEGIN
	IF (@OrdSStoreId Is Not NULL)
		SET @SQL = @SQL + 'OrdSStoreId=' + convert(varchar,@OrdSStoreId) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdSStoreId=NULL, ';
END
IF (@OrdSHTypeFlag Is Not NULL)
BEGIN
	IF (@OrdSHType Is Not NULL)
		SET @SQL = @SQL + 'OrdSHType=' + convert(varchar,@OrdSHType) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdSHType=NULL, ';
END
IF (@OrdDPrdIdFlag Is Not NULL)
BEGIN
	IF (@OrdDPrdId Is Not NULL)
		SET @SQL = @SQL + 'OrdDPrdId=' + convert(varchar,@OrdDPrdId) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdDPrdId=NULL, ';
END
IF (@OrdSAmountFlag Is Not NULL)
BEGIN
	IF (@OrdSAmount Is Not NULL)
		SET @SQL = @SQL + 'OrdSAmount=' + convert(varchar,@OrdSAmount) + ', ';
	ELSE
		SET @SQL = @SQL + 'OrdSAmount=NULL, ';
END
IF (Len(@SQL) > 0)
BEGIN
	SET @SQL = 'UPDATE OrderSubsidy_OLD SET ' + Left(@SQL, Len(@SQL)-1) + ' Where OrdHid = ' + convert(varchar,@OrdHid) + ' AND OrdDId = ' + convert(varchar,@OrdDId) + ' AND OrdSHId = ' + convert(varchar,@OrdSHId) + ' AND OrdSDType = ' + convert(varchar,@OrdSDType) 
	EXEC(@SQL)
END
SET QUOTED_IDENTIFIER OFF 


GO
