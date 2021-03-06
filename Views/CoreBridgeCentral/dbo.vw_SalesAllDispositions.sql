/****** Object:  View [dbo].[vw_SalesAllDispositions]    Script Date: 5/15/2018 12:13:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW vw_SalesAllDispositions
AS
    SELECT
        vw_Locations.ZW_Franchise_ID ,
        SalesResultsAllDispositions.PK_ID ,
        SalesResultsAllDispositions.FranchiseName ,
        SalesResultsAllDispositions.IncomeTypeId ,
        SalesResultsAllDispositions.IncomeTypeDescription ,
        SalesResultsAllDispositions.IncomeTypeText ,
        SalesResultsAllDispositions.SortAccount ,
        SalesResultsAllDispositions.LocationId ,
        SalesResultsAllDispositions.LocationName ,
        SalesResultsAllDispositions.InvoiceNumber ,
        SalesResultsAllDispositions.OrderActive ,
        SalesResultsAllDispositions.OrderStatusId ,
        SalesResultsAllDispositions.OrderCompletionDate ,
        SalesResultsAllDispositions.OrderClosedDate ,
        SalesResultsAllDispositions.OrderBuiltDate ,
        SalesResultsAllDispositions.OrderCreatedDate ,
        SalesResultsAllDispositions.CategoryId ,
        SalesResultsAllDispositions.ProductCategory ,
        SalesResultsAllDispositions.CompanyName ,
        SalesResultsAllDispositions.IndustryType ,
        SalesResultsAllDispositions.CustomerType ,
        SalesResultsAllDispositions.SalesPersonName ,
        SalesResultsAllDispositions.GLAcctId ,
        SalesResultsAllDispositions.GL_Account ,
        SalesResultsAllDispositions.CostOfGoodsSold ,
        SalesResultsAllDispositions.AdditionalCosts ,
        SalesResultsAllDispositions.Amount ,
        SalesResultsAllDispositions.SubTotalPrice ,
        SalesResultsAllDispositions.DiscountPrice ,
        SalesResultsAllDispositions.TaxesPrice ,
        SalesResultsAllDispositions.ShippingAmount ,
        SalesResultsAllDispositions.PostageAmount ,
        SalesResultsAllDispositions.TaxableAmount ,
        SalesResultsAllDispositions.NonTaxableAmount ,
        SalesResultsAllDispositions.Id ,
        SalesResultsAllDispositions.OrderId ,
        SalesResultsAllDispositions.OrderProductId ,
        SalesResultsAllDispositions.OrderProductPartId ,
        SalesResultsAllDispositions.OrderProductLineItem ,
        SalesResultsAllDispositions.MaxProductLineItem ,
        SalesResultsAllDispositions.IsVended ,
        SalesResultsAllDispositions.OrderContactName ,
        SalesResultsAllDispositions.BillingAddress1 ,
        SalesResultsAllDispositions.BillingAddress2 ,
        SalesResultsAllDispositions.BillingAddress3 ,
        SalesResultsAllDispositions.BillingCity ,
        SalesResultsAllDispositions.BillingState ,
        SalesResultsAllDispositions.BillingCounty ,
        SalesResultsAllDispositions.BillingZip ,
        SalesResultsAllDispositions.BillngZipExtended ,
        SalesResultsAllDispositions.ShippingAddress1 ,
        SalesResultsAllDispositions.ShippingAddress2 ,
        SalesResultsAllDispositions.ShippingAddress3 ,
        SalesResultsAllDispositions.ShippingCity ,
        SalesResultsAllDispositions.ShippingState ,
        SalesResultsAllDispositions.ShippingCounty ,
        SalesResultsAllDispositions.ShippingZip ,
        SalesResultsAllDispositions.ShippingZipExtended ,
        SalesResultsAllDispositions.OLTP_InsertDate ,
        SalesResultsAllDispositions.CorebridgeOrder
    FROM
        SalesResultsAllDispositions
        INNER JOIN vw_Locations ON vw_Locations.Value = SalesResultsAllDispositions.CompanyLocationId
GO
