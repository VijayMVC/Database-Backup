/****** Object:  View [dbo].[vw_OrderHeader]    Script Date: 5/15/2018 12:13:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vw_OrderHeader]
AS
    SELECT 
        Orders.OrderHeaderFact.OrderHeaderKey ,
        Orders.OrderHeaderFact.ZW_Franchise_ID ,
        Orders.OrderHeaderFact.OrderID ,
    Orders.OrderHeaderFact.CustomerID,
    Orders.OrderHeaderFact.ContactID,
        Orders.OrderHeaderFact.PricingRatio ,
        Orders.DescriptionDim.DescriptionName AS OrderDescription ,
        Orders.OrderHeaderFact.OrdererFirstName ,
        Orders.OrderHeaderFact.OrdererLastName ,
        Orders.OrderHeaderFact.OrdererTitle ,
        Orders.OrderHeaderFact.OrdererPhoneNumber ,
        Orders.OrderHeaderFact.OrdererPhoneExtention ,
        Orders.OrderHeaderFact.OrdererFareaCode ,
        Orders.OrderHeaderFact.OrdererFaxNumber ,
        Orders.OrderHeaderFact.OrdererEmailAddress ,
        Contact.EmployeeFact.FirstName AS SalespersonFirstName ,
        Contact.EmployeeFact.LastName AS SalespersonLastName ,
        Orders.StatusDim.StatusName AS Status ,
        Orders.OrderHeaderFact.StatusKey ,
        Orders.OrderHeaderFact.OnHold ,
        Orders.OrderHeaderFact.EstimateDate ,
        Orders.OrderHeaderFact.OrderDate ,
        Orders.OrderHeaderFact.DueDate ,
        Orders.OrderHeaderFact.BuiltDate ,
        Orders.OrderHeaderFact.VoidDate ,
        Orders.OrderHeaderFact.PickedUpDate ,
        Orders.OrderHeaderFact.WriteoffDate ,
        Orders.OrderHeaderFact.HoldDate ,
        Orders.OrderHeaderFact.LastInterestDate ,
        Orders.OrderHeaderFact.ClosedDate ,
        Orders.OrderHeaderFact.SignSales ,
        Orders.OrderHeaderFact.AVISales ,
        Orders.OrderHeaderFact.InstallSales ,
        Orders.OrderHeaderFact.ProductionCat1Sales ,
        Orders.OrderHeaderFact.ProductionCat2Sales ,
        Orders.OrderHeaderFact.ProductionCat3Sales ,
        Orders.OrderHeaderFact.ItemsTotal ,
        Orders.OrderHeaderFact.SalesSubtotal ,
        Orders.OrderHeaderFact.TaxableAmount ,
        Orders.OrderHeaderFact.TaxExemptAmount ,
        Orders.OrderHeaderFact.TaxExemptAmountCalculated ,
        Orders.OrderHeaderFact.TaxExemptAmountOverridden ,
        Orders.OrderHeaderFact.TaxExempt ,
        Orders.OrderHeaderFact.TaxIDNumber ,
        Orders.OrderHeaderFact.CountySalesTax ,
        Orders.OrderHeaderFact.CountySalesTaxRate ,
        Orders.OrderHeaderFact.StateSalesTax ,
        Orders.OrderHeaderFact.StateSalesTaxRate ,
        Orders.OrderHeaderFact.TaxTotal ,
        Orders.OrderHeaderFact.DiscountAmount ,
        Orders.OrderHeaderFact.DiscountPercent ,
        Orders.OrderHeaderFact.ShippingCharge ,
        Orders.OrderHeaderFact.InterestAmount ,
        Orders.OrderHeaderFact.SalesTotal ,
        Orders.OrderHeaderFact.TotalPayments ,
        Orders.OrderHeaderFact.BalanceOutstanding ,
        Orders.OrderHeaderFact.WriteoffAmount ,
        Orders.OrderHeaderFact.ShippingAddress ,
        Orders.OrderNotesDim.OrderNotesName AS OrderNotes ,
        Orders.InstallNotesDim.InstallNotesName AS InstallNotes ,
        Orders.OrderHeaderFact.ItemsDiscountTotal ,
        Orders.OrderHeaderFact.DiscountTotal ,
        Orders.OrderHeaderFact.DispositionOnCompletionID ,
        Orders.OrderHeaderFact.CustomerName ,
        --Contact.CompanyNameDim.CompanyNameName 
        Orders.OrderHeaderFact.CustomerName AS AccountName ,
        Orders.OrderHeaderFact.ShippingTaxable ,
        Orders.OrderHeaderFact.RoyaltyRate ,
        Orders.OrderHeaderFact.JobBox ,
        Orders.OrderHeaderFact.ProofDate ,
        Orders.OrderHeaderFact.LineItemsOverriden ,
        Orders.OrderHeaderFact.OrderOriginID ,
        Orders.OriginTypeDim.MarketingCategory ,
        Orders.OriginTypeDim.MarketingType
    FROM
        Orders.OrderHeaderFact  WITH ( NOLOCK )
        LEFT JOIN Orders.DescriptionDim  WITH ( NOLOCK ) ON Orders.OrderHeaderFact.DescriptionKey = Orders.DescriptionDim.DescriptionKey
        LEFT JOIN Contact.CustomerFact  WITH ( NOLOCK ) ON Orders.OrderHeaderFact.CustomerKey = Contact.CustomerFact.CustomerKey
        LEFT JOIN Contact.EmployeeFact  WITH ( NOLOCK )  ON Orders.OrderHeaderFact.SalePersonKey = Contact.EmployeeFact.EmployeeKey
        LEFT JOIN Orders.OrderNotesDim  WITH ( NOLOCK )  ON Orders.OrderHeaderFact.OrderNotesKey = Orders.OrderNotesDim.OrderNotesKey
        LEFT JOIN Orders.InstallNotesDim  WITH ( NOLOCK )  ON Orders.OrderHeaderFact.InstallNotesKey = Orders.InstallNotesDim.InstallNotesKey
        LEFT JOIN Orders.OriginLink   WITH ( NOLOCK ) ON Orders.OrderHeaderFact.OrderOriginID = Orders.OriginLink.CustomerTypeID
                                       AND Orders.OrderHeaderFact.ZW_Franchise_ID = Orders.OriginLink.ZW_Franchise_ID
        LEFT JOIN Orders.OriginTypeDim   WITH ( NOLOCK ) ON Orders.OriginLink.OriginTypeKey = Orders.OriginTypeDim.OriginTypeKey
        --INNER JOIN Contact.CompanyNameDim ON Contact.CustomerFact.CompanyNameKey = Contact.CompanyNameDim.CompanyNameKey
        INNER JOIN Orders.StatusDim  WITH ( NOLOCK ) ON Orders.OrderHeaderFact.StatusKey = Orders.StatusDim.StatusKey
--WHERE Orders.OrderHeaderFact.OrderDate>DATEADD(MONTH,-6,GETDATE())
-- TAF Added Where Clause to speed query





GO
