/****** Object:  StoredProcedure [dbo].[sp_insertFactSubsidy]    Script Date: 5/15/2018 12:10:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE PROCEDURE [dbo].[sp_insertFactSubsidy]
AS
BEGIN
	SET NOCOUNT ON;

declare @count int, @lastTransactionID int
set @count = (select count(*) from MarketingReports.Analysis.FactSubsidy)

if @count > 0 
begin 
set @lastTransactionID = (select TOP (1) TransactionID FROM MarketingReports.Analysis.FactSubsidy
                            ORDER BY TransactionID DESC)
end 
else
begin
set @lastTransactionID =0
end 


INSERT into MarketingReports.Analysis.FactSubsidy (FK_DateFrom, FK_DateTo, FK_Store, FK_Subsidy, TransactionID, InvoiceAmount, ClaimedAmount, RemainingAmount)
SELECT     a.DateFrom, a.DateTo, f.PK_Store, g.PK_Subsidy, a.TransactionID , 
			a.InvoiceAmount, a.AmountReimbursed, a.AmountRemaining
FROM        [01DALSPRODSQL1].Marketing.dbo.sub_Transactions AS a INNER JOIN
                     [01DALSPRODSQL1].Marketing.dbo.sub_Subsidies AS b ON a.SubsidyID = b.SubsidyID INNER JOIN
                      [01DALSPRODSQL1].Marketing.dbo.Sub_Categories AS c ON c.CategoryID = b.CategoryID INNER JOIN
                      [01DALSPRODSQL1].Marketing.dbo.Sub_SubsidyTypes AS d ON d.SubsidyTypeID = a.SubsidyTypeID INNER JOIN
                      MarketingReports.Analysis.DimDate AS e ON e.PK_Date = a.DateFrom INNER JOIN
                      MarketingReports.Analysis.DimDate AS h ON h.PK_Date = a.DateTo INNER JOIN
                      MarketingReports.Analysis.DimStore AS f ON f.Webnumber = a.SourceID and f.DimStore_SCD_End_Date is null INNER JOIN
                      MarketingReports.Analysis.DimSubsidy AS g ON g.Category = c.CategoryName AND g.SubsidyType = d.Description
where a.TransactionID > @lastTransactionID


END

GO
