/****** Object:  View [dbo].[vw_EstimateHeaderFact]    Script Date: 5/15/2018 12:13:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vw_EstimateHeaderFact]
AS
    SELECT
        Estimate.EstimateHeaderFact.EstimateHeaderKey ,
        Estimate.EstimateHeaderFact.OrderID ,
        Estimate.EstimateHeaderFact.ZW_Franchise_ID ,
        Estimate.EstimateHeaderFact.PricingRatio ,
        Estimate.DescriptionDim.DescriptionName AS Description ,
        Estimate.EstimateHeaderFact.NumberItems ,
        Estimate.EstimateHeaderFact.CustomerID ,
        Estimate.EstimateHeaderFact.CustomerKey ,
        Estimate.EstimateHeaderFact.ContactID ,
        Estimate.CustomerNameDim.CustomerNameName AS CustomerName ,
        Estimate.CustomerNameDim.CustomerNameName AS AcountName ,
        --Contact.CompanyNameDim.CompanyNameName AS AcountName ,
        Estimate.OrdererFirstNameDim.OrdererFirstNameName AS OrdererFirstName ,
        Estimate.OrdererLastNameDim.OrdererLastNameName AS OrdererLastName ,
        Estimate.OrdererTitleDim.OrdererTitleName AS OrdererTitle ,
        Estimate.EstimateHeaderFact.OrdererPareaCode ,
        Estimate.EstimateHeaderFact.OrdererPhoneNumber ,
        Estimate.EstimateHeaderFact.OrdererPhoneExtention ,
        Estimate.EstimateHeaderFact.OrdererFareaCode ,
        Estimate.EstimateHeaderFact.OrdererFaxNumber ,
        Estimate.EstimateHeaderFact.OrdererEmailAddress ,
        Estimate.EstimateHeaderFact.SalePersonID ,
        Estimate.EstimateHeaderFact.SalePersonKey ,
        Estimate.EstimateHeaderFact.EnteredByID ,
        Estimate.EstimateHeaderFact.EnteredByKey ,
        Estimate.StatusDim.StatusName AS Status ,
        Estimate.EstimateHeaderFact.OnHold ,
        Estimate.EstimateHeaderFact.EstimateDate ,
        Estimate.EstimateHeaderFact.OrderDate ,
        Estimate.EstimateHeaderFact.DueDate ,
        Estimate.EstimateHeaderFact.BuiltDate ,
        Estimate.EstimateHeaderFact.VoidDate ,
        Estimate.EstimateHeaderFact.PickedUpDate ,
        Estimate.EstimateHeaderFact.WriteoffDate ,
        Estimate.EstimateHeaderFact.HoldDate ,
        Estimate.EstimateHeaderFact.LastInterestDate ,
        Estimate.EstimateHeaderFact.ClosedDate ,
        Estimate.EstimateHeaderFact.SignSales ,
        Estimate.EstimateHeaderFact.AVISales ,
        Estimate.EstimateHeaderFact.InstallSales ,
        Estimate.EstimateHeaderFact.ProductionCat1Sales ,
        Estimate.EstimateHeaderFact.ProductionCat2Sales ,
        Estimate.EstimateHeaderFact.ProductionCat3Sales ,
        Estimate.EstimateHeaderFact.ItemsTotal ,
        Estimate.EstimateHeaderFact.SalesSubtotal ,
        Estimate.EstimateHeaderFact.TaxableAmount ,
        Estimate.EstimateHeaderFact.TaxExemptAmount ,
        Estimate.EstimateHeaderFact.TaxExemptAmountCalculated ,
        Estimate.EstimateHeaderFact.TaxExemptAmountOverridden ,
        Estimate.EstimateHeaderFact.TaxExempt ,
        Estimate.EstimateHeaderFact.TaxIDNumber ,
        Estimate.EstimateHeaderFact.TaxRegionID ,
        Estimate.EstimateHeaderFact.CountySalesTax ,
        Estimate.EstimateHeaderFact.CountySalesTaxRate ,
        Estimate.EstimateHeaderFact.StateSalesTax ,
        Estimate.EstimateHeaderFact.StateSalesTaxRate ,
        Estimate.EstimateHeaderFact.TaxTotal ,
        Estimate.EstimateHeaderFact.DiscountAmount ,
        Estimate.EstimateHeaderFact.DiscountPercent ,
        Estimate.EstimateHeaderFact.ShippingCharge ,
        Estimate.EstimateHeaderFact.InterestAmount ,
        Estimate.EstimateHeaderFact.SalesTotal ,
        Estimate.EstimateHeaderFact.TotalPayments ,
        Estimate.EstimateHeaderFact.BalanceOutstanding ,
        Estimate.EstimateHeaderFact.WriteoffAmount ,
        Estimate.EstimateHeaderFact.PurchaseOrderNumberKey ,
        Estimate.EstimateHeaderFact.ShippingAddressKey ,
        Estimate.EstimateHeaderFact.DispositionOnCompletionKey ,
        Estimate.EstimateHeaderFact.EstimateNumber
    FROM
        Estimate.EstimateHeaderFact   WITH ( NOLOCK ) 
        LEFT JOIN Estimate.DescriptionDim   WITH ( NOLOCK ) ON Estimate.EstimateHeaderFact.DescriptionKey = Estimate.DescriptionDim.DescriptionKey
        LEFT JOIN Estimate.OrdererFirstNameDim   WITH ( NOLOCK ) ON Estimate.EstimateHeaderFact.OrdererFirstNameKey = Estimate.OrdererFirstNameDim.OrdererFirstNameKey
        LEFT JOIN Estimate.OrdererLastNameDim   WITH ( NOLOCK ) ON Estimate.EstimateHeaderFact.OrdererLastNameKey = Estimate.OrdererLastNameDim.OrdererLastNameKey
        LEFT JOIN Estimate.OrdererTitleDim   WITH ( NOLOCK ) ON Estimate.EstimateHeaderFact.OrdererTitleKey = Estimate.OrdererTitleDim.OrdererTitleKey
        JOIN Estimate.StatusDim   WITH ( NOLOCK ) ON Estimate.EstimateHeaderFact.StatusKey = Estimate.StatusDim.StatusKey
        --INNER JOIN Contact.CustomerFact ON Estimate.EstimateHeaderFact.CustomerKey = Contact.CustomerFact.CustomerKey
        --LEFT JOIN Contact.CompanyNameDim ON Contact.CustomerFact.CompanyNameKey = Contact.CompanyNameDim.CompanyNameKey
        Left JOIN Estimate.CustomerNameDim   WITH ( NOLOCK ) ON Estimate.EstimateHeaderFact.CustomerNameKey = Estimate.CustomerNameDim.CustomerNameKey





GO
