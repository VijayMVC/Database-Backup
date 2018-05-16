/****** Object:  Table [Estimate].[EstimateHeaderFact]    Script Date: 5/15/2018 11:59:30 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Estimate].[EstimateHeaderFact](
	[EstimateHeaderKey] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingRatio] [float] NULL,
	[DescriptionKey] [int] NULL,
	[NumberItems] [int] NULL,
	[CustomerID] [int] NULL,
	[CustomerKey] [int] NULL,
	[ContactID] [int] NULL,
	[ContactKey] [int] NULL,
	[OrdererFirstNameKey] [int] NULL,
	[OrdererLastNameKey] [int] NULL,
	[OrdererTitleKey] [int] NULL,
	[OrdererPareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererPhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererPhoneExtention] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererFareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererFaxNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererEmailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalePersonID] [int] NULL,
	[SalePersonKey] [int] NULL,
	[EnteredByID] [int] NULL,
	[EnteredByKey] [int] NULL,
	[StatusKey] [int] NULL,
	[OnHold] [bit] NULL,
	[EstimateDate] [datetime] NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[BuiltDate] [datetime] NULL,
	[VoidDate] [datetime] NULL,
	[PickedUpDate] [datetime] NULL,
	[WriteoffDate] [datetime] NULL,
	[HoldDate] [datetime] NULL,
	[LastInterestDate] [datetime] NULL,
	[ClosedDate] [date] NULL,
	[SignSales] [money] NULL,
	[AVISales] [money] NULL,
	[InstallSales] [money] NULL,
	[ProductionCat1Sales] [money] NULL,
	[ProductionCat2Sales] [money] NULL,
	[ProductionCat3Sales] [money] NULL,
	[ItemsTotal] [money] NULL,
	[SalesSubtotal] [money] NULL,
	[TaxableAmount] [money] NULL,
	[TaxExemptAmount] [money] NULL,
	[TaxExemptAmountCalculated] [money] NULL,
	[TaxExemptAmountOverridden] [bit] NULL,
	[TaxExempt] [bit] NULL,
	[TaxIDNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxRegionID] [int] NULL,
	[CountySalesTax] [money] NULL,
	[CountySalesTaxRate] [float] NULL,
	[StateSalesTax] [money] NULL,
	[StateSalesTaxRate] [float] NULL,
	[TaxTotal] [money] NULL,
	[PromotionID] [int] NULL,
	[DiscountAmount] [money] NULL,
	[DiscountPercent] [float] NULL,
	[ShippingCharge] [money] NULL,
	[InterestAmount] [money] NULL,
	[SalesTotal] [money] NULL,
	[TotalPayments] [money] NULL,
	[BalanceOutstanding] [money] NULL,
	[WriteoffAmount] [money] NULL,
	[PurchaseOrderNumberKey] [int] NULL,
	[ShippingAddressKey] [int] NULL,
	[DispositionOnCompletionKey] [int] NULL,
	[OrderNotesKey] [int] NULL,
	[InstallNotesKey] [int] NULL,
	[EstimateNumber] [int] NULL,
	[ItemsDiscountTotal] [money] NULL,
	[DiscountTotal] [money] NULL,
	[DispositionOnCompletionID] [int] NULL,
	[CustomerNameKey] [int] NULL,
	[ShippingTaxable] [bit] NULL,
	[RoyaltyRate] [float] NULL,
	[JobBoxKey] [int] NULL,
	[ProofDate] [date] NULL,
	[LineItemsOverriden] [bit] NULL,
	[OrderOriginID] [int] NULL,
	[IsLocked] [bit] NULL,
	[LockedDate] [datetime] NULL,
	[LockedUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceID] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NULL,
 CONSTRAINT [PK_EstimateHeaderFact] PRIMARY KEY CLUSTERED 
(
	[EstimateHeaderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [EstimateHeaderFact_OrdererTitleKey]    Script Date: 5/15/2018 11:59:30 AM ******/
CREATE NONCLUSTERED INDEX [EstimateHeaderFact_OrdererTitleKey] ON [Estimate].[EstimateHeaderFact]
(
	[OrdererTitleKey] ASC
)
INCLUDE ( 	[EstimateHeaderKey],
	[OrderID],
	[ZW_Franchise_ID],
	[PricingRatio],
	[DescriptionKey],
	[NumberItems],
	[CustomerID],
	[CustomerKey],
	[ContactID],
	[OrdererFirstNameKey],
	[OrdererLastNameKey],
	[OrdererPareaCode],
	[OrdererPhoneNumber],
	[OrdererPhoneExtention],
	[OrdererFareaCode],
	[OrdererFaxNumber],
	[OrdererEmailAddress],
	[SalePersonID],
	[SalePersonKey],
	[EnteredByID],
	[EnteredByKey],
	[StatusKey],
	[OnHold],
	[EstimateDate],
	[OrderDate],
	[DueDate],
	[BuiltDate],
	[VoidDate],
	[PickedUpDate],
	[WriteoffDate],
	[HoldDate],
	[LastInterestDate],
	[ClosedDate],
	[SignSales],
	[AVISales],
	[InstallSales],
	[ProductionCat1Sales],
	[ProductionCat2Sales],
	[ProductionCat3Sales],
	[ItemsTotal],
	[SalesSubtotal],
	[TaxableAmount],
	[TaxExemptAmount],
	[TaxExemptAmountCalculated],
	[TaxExemptAmountOverridden],
	[TaxExempt],
	[TaxIDNumber],
	[TaxRegionID],
	[CountySalesTax],
	[CountySalesTaxRate],
	[StateSalesTax],
	[StateSalesTaxRate],
	[TaxTotal],
	[DiscountAmount],
	[DiscountPercent],
	[ShippingCharge],
	[InterestAmount],
	[SalesTotal],
	[TotalPayments],
	[BalanceOutstanding],
	[WriteoffAmount],
	[PurchaseOrderNumberKey],
	[ShippingAddressKey],
	[DispositionOnCompletionKey],
	[EstimateNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_EstimateHeaderFact_CustomerNameKey]    Script Date: 5/15/2018 11:59:30 AM ******/
CREATE NONCLUSTERED INDEX [Hint_EstimateHeaderFact_CustomerNameKey] ON [Estimate].[EstimateHeaderFact]
(
	[CustomerNameKey] ASC
)
INCLUDE ( 	[EstimateHeaderKey],
	[OrderID],
	[ZW_Franchise_ID],
	[PricingRatio],
	[DescriptionKey],
	[NumberItems],
	[CustomerID],
	[CustomerKey],
	[ContactID],
	[OrdererFirstNameKey],
	[OrdererLastNameKey],
	[OrdererTitleKey],
	[OrdererPareaCode],
	[OrdererPhoneNumber],
	[OrdererPhoneExtention],
	[OrdererFareaCode],
	[OrdererFaxNumber],
	[OrdererEmailAddress],
	[SalePersonID],
	[SalePersonKey],
	[EnteredByID],
	[EnteredByKey],
	[StatusKey],
	[OnHold],
	[EstimateDate],
	[OrderDate],
	[DueDate],
	[BuiltDate],
	[VoidDate],
	[PickedUpDate],
	[WriteoffDate],
	[HoldDate],
	[LastInterestDate],
	[ClosedDate],
	[SignSales],
	[AVISales],
	[InstallSales],
	[ProductionCat1Sales],
	[ProductionCat2Sales],
	[ProductionCat3Sales],
	[ItemsTotal],
	[SalesSubtotal],
	[TaxableAmount],
	[TaxExemptAmount],
	[TaxExemptAmountCalculated],
	[TaxExemptAmountOverridden],
	[TaxExempt],
	[TaxIDNumber],
	[TaxRegionID],
	[CountySalesTax],
	[CountySalesTaxRate],
	[StateSalesTax],
	[StateSalesTaxRate],
	[TaxTotal],
	[DiscountAmount],
	[DiscountPercent],
	[ShippingCharge],
	[InterestAmount],
	[SalesTotal],
	[TotalPayments],
	[BalanceOutstanding],
	[WriteoffAmount],
	[PurchaseOrderNumberKey],
	[ShippingAddressKey],
	[DispositionOnCompletionKey],
	[EstimateNumber]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_EstimateHeaderFact_EstimateDate]    Script Date: 5/15/2018 11:59:30 AM ******/
CREATE NONCLUSTERED INDEX [Hint_EstimateHeaderFact_EstimateDate] ON [Estimate].[EstimateHeaderFact]
(
	[EstimateDate] ASC
)
INCLUDE ( 	[EstimateHeaderKey],
	[OrderID],
	[ZW_Franchise_ID],
	[PricingRatio],
	[DescriptionKey],
	[NumberItems],
	[CustomerID],
	[CustomerKey],
	[ContactID],
	[OrdererFirstNameKey],
	[OrdererLastNameKey],
	[OrdererTitleKey],
	[OrdererPareaCode],
	[OrdererPhoneNumber],
	[OrdererPhoneExtention],
	[OrdererFareaCode],
	[OrdererFaxNumber],
	[OrdererEmailAddress],
	[SalePersonID],
	[SalePersonKey],
	[EnteredByID],
	[EnteredByKey],
	[StatusKey],
	[OnHold],
	[OrderDate],
	[DueDate],
	[BuiltDate],
	[VoidDate],
	[PickedUpDate],
	[WriteoffDate],
	[HoldDate],
	[LastInterestDate],
	[ClosedDate],
	[SignSales],
	[AVISales],
	[InstallSales],
	[ProductionCat1Sales],
	[ProductionCat2Sales],
	[ProductionCat3Sales],
	[ItemsTotal],
	[SalesSubtotal],
	[TaxableAmount],
	[TaxExemptAmount],
	[TaxExemptAmountCalculated],
	[TaxExemptAmountOverridden],
	[TaxExempt],
	[TaxIDNumber],
	[TaxRegionID],
	[CountySalesTax],
	[CountySalesTaxRate],
	[StateSalesTax],
	[StateSalesTaxRate],
	[TaxTotal],
	[DiscountAmount],
	[DiscountPercent],
	[ShippingCharge],
	[InterestAmount],
	[SalesTotal],
	[TotalPayments],
	[BalanceOutstanding],
	[WriteoffAmount],
	[PurchaseOrderNumberKey],
	[ShippingAddressKey],
	[DispositionOnCompletionKey],
	[EstimateNumber],
	[CustomerNameKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_EstimateHeaderFact_ZW_Franchise_ID]    Script Date: 5/15/2018 11:59:30 AM ******/
CREATE NONCLUSTERED INDEX [Hint_EstimateHeaderFact_ZW_Franchise_ID] ON [Estimate].[EstimateHeaderFact]
(
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[EstimateHeaderKey],
	[OrderID],
	[PricingRatio],
	[DescriptionKey],
	[NumberItems],
	[CustomerID],
	[CustomerKey],
	[ContactID],
	[OrdererFirstNameKey],
	[OrdererLastNameKey],
	[OrdererTitleKey],
	[OrdererPareaCode],
	[OrdererPhoneNumber],
	[OrdererPhoneExtention],
	[OrdererFareaCode],
	[OrdererFaxNumber],
	[OrdererEmailAddress],
	[StatusKey],
	[EstimateDate],
	[OrderDate],
	[PickedUpDate],
	[EstimateNumber],
	[CustomerNameKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
