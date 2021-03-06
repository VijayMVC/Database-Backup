/****** Object:  View [dbo].[vw_SalesResultsDetails]    Script Date: 5/15/2018 12:13:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE VIEW vw_SalesResultsDetails
AS
Select
  vw_Locations.ZW_Franchise_ID,
  SalesResultsDetails.ID,
  SalesResultsDetails.FranchiseName,
  SalesResultsDetails.LocationId,
  SalesResultsDetails.LocationName,
  SalesResultsDetails.OrderId,
  SalesResultsDetails.OrderActive,
  SalesResultsDetails.OrderStatusId,
  SalesResultsDetails.InvoiceNumber,
  SalesResultsDetails.OrderCompletionDate,
  SalesResultsDetails.OrderClosedDate,
  SalesResultsDetails.OrderBuiltDate,
  SalesResultsDetails.OrderCreatedDate,
  SalesResultsDetails.AccountId,
  SalesResultsDetails.CompanyName,
  SalesResultsDetails.IndustryType,
  SalesResultsDetails.CustomerType,
  SalesResultsDetails.ReferredByTypeId,
  SalesResultsDetails.CustomerOrigin,
  SalesResultsDetails.SalesPersonId,
  SalesResultsDetails.SalesPersonName,
  SalesResultsDetails.EnteredByUserId,
  SalesResultsDetails.CostOfGoodsSold,
  SalesResultsDetails.AdditionalCosts,
  SalesResultsDetails.Amount,
  SalesResultsDetails.NewSubtotal,
  SalesResultsDetails.ShippingAmount,
  SalesResultsDetails.PostageAmount,
  SalesResultsDetails.TaxesPrice,
  SalesResultsDetails.MasterAccountId,
  SalesResultsDetails.MasterAccountName,
  SalesResultsDetails.MasterAccountSortName,
  SalesResultsDetails.OrderContactName,
  SalesResultsDetails.BillingAddress1,
  SalesResultsDetails.BillingAddress2,
  SalesResultsDetails.BillingAddress3,
  SalesResultsDetails.BillingCity,
  SalesResultsDetails.BillingState,
  SalesResultsDetails.BillingCounty,
  SalesResultsDetails.BillingZip,
  SalesResultsDetails.BillngZipExtended,
  SalesResultsDetails.ShippingAddress1,
  SalesResultsDetails.ShippingAddress2,
  SalesResultsDetails.ShippingAddress3,
  SalesResultsDetails.ShippingCity,
  SalesResultsDetails.ShippingState,
  SalesResultsDetails.ShippingCounty,
  SalesResultsDetails.ShippingZip,
  SalesResultsDetails.ShippingZipExtended,
  SalesResultsDetails.OLTP_InsertDate
From
  SalesResultsDetails
  Inner Join vw_Locations
    On vw_Locations.Value = SalesResultsDetails.CompanyLocationId
GO
