/****** Object:  StoredProcedure [dbo].[SubsidyLogAdd]    Script Date: 5/15/2018 12:10:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE dbo.SubsidyLogAdd
(
	@SubLStoreId int = NULL,
	@SubLYear smallint = NULL,
	@SubLId int = NULL,
	@SubLType tinyint = NULL,
	@SubLOrdHId int = NULL,
	@SubLOrdDId int = NULL,
	@SubLPrdId int = NULL,
	@SubLHId int = NULL,
	@SubLHType tinyint = NULL,
	@SubLDType tinyint = NULL,
	@SubLDesc varchar(255) = NULL,
	@SubLAmount real = NULL,
	@SubLDate datetime = NULL,
	@InvoiceAmount real = NULL,
	@SubsidyQualifierID int = NULL,
	@UsageDateFrom datetime = NULL,
	@UsageDateTo datetime = NULL
)
AS
INSERT INTO SubsidyLog (SubLStoreId, SubLYear, SubLId, SubLType, SubLOrdHId, SubLOrdDId, SubLPrdId, SubLHId, SubLHType, SubLDType, SubLDesc, SubLAmount, SubLDate, InvoiceAmount, SubsidyQualifierID, UsageDateFrom, UsageDateTo)
 VALUES (@SubLStoreId, @SubLYear, @SubLId, @SubLType, @SubLOrdHId, @SubLOrdDId, @SubLPrdId, @SubLHId, @SubLHType, @SubLDType, @SubLDesc, @SubLAmount, @SubLDate, @InvoiceAmount, @SubsidyQualifierID, @UsageDateFrom, @UsageDateTo);


GO
