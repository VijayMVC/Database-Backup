/****** Object:  Table [Orders].[OrderHeaderFact]    Script Date: 5/15/2018 11:59:36 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[OrderHeaderFact](
	[OrderHeaderKey] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingRatio] [float] NULL,
	[DescriptionKey] [int] NULL,
	[NumberItems] [int] NULL,
	[CustomerID] [int] NULL,
	[ContactID] [int] NULL,
	[OrdererFirstName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererLastName] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererTitle] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererPareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererPhoneNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererPhoneExtention] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererFareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererFaxNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererEmailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalePersonID] [int] NULL,
	[EnteredByID] [int] NULL,
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
	[ClosedDate] [datetime] NULL,
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
	[ShippingAddress] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DispositionOnCompletion] [varchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderNotesKey] [int] NULL,
	[InstallNotesKey] [int] NULL,
	[EstimateNumber] [int] NULL,
	[ItemsDiscountTotal] [money] NULL,
	[DiscountTotal] [money] NULL,
	[DispositionOnCompletionID] [int] NULL,
	[CustomerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShippingTaxable] [bit] NULL,
	[RoyaltyRate] [float] NULL,
	[JobBox] [varchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProofDate] [datetime] NULL,
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
	[CustomerKey] [int] NULL,
	[ContactKey] [int] NULL,
	[SalePersonKey] [int] NULL,
	[EnteredByKey] [int] NULL,
	[InvoiceKey] [int] NULL,
	[CenterKey] [int] NULL,
	[OriginKey] [int] NULL,
 CONSTRAINT [PK_OrderHeaderFact] PRIMARY KEY CLUSTERED 
(
	[OrderHeaderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [ePrintWerx_View_OrderHeaderFact]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [ePrintWerx_View_OrderHeaderFact] ON [Orders].[OrderHeaderFact]
(
	[OrderDate] ASC,
	[PickedUpDate] ASC,
	[CenterKey] ASC
)
INCLUDE ( 	[ZW_Franchise_ID],
	[CustomerKey],
	[OrderHeaderKey],
	[VoidDate],
	[SalesSubtotal],
	[SalePersonKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Hint_CustomerKey_PickedUpDate_INC_SalesSubtotal_CenterKey]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_CustomerKey_PickedUpDate_INC_SalesSubtotal_CenterKey] ON [Orders].[OrderHeaderFact]
(
	[CustomerKey] ASC,
	[PickedUpDate] ASC
)
INCLUDE ( 	[SalesSubtotal],
	[CenterKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Hint_FM_OrderHeaderFact_PickedUpDate]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_FM_OrderHeaderFact_PickedUpDate] ON [Orders].[OrderHeaderFact]
(
	[PickedUpDate] ASC
)
INCLUDE ( 	[OrderID],
	[ContactKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_KeystoneSystino]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_KeystoneSystino] ON [Orders].[OrderHeaderFact]
(
	[CenterKey] ASC,
	[OrdererEmailAddress] ASC,
	[PickedUpDate] ASC
)
INCLUDE ( 	[OrderID],
	[ZW_Franchise_ID],
	[PricingRatio],
	[DescriptionKey],
	[NumberItems],
	[CustomerID],
	[ContactID],
	[OrdererFirstName],
	[OrdererLastName],
	[OrdererTitle],
	[OrdererPareaCode],
	[OrdererPhoneNumber],
	[OrdererPhoneExtention],
	[OrdererFareaCode],
	[OrdererFaxNumber],
	[StatusKey],
	[InterestAmount],
	[SalesTotal],
	[CustomerName],
	[OrderOriginID],
	[CustomerKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_OrderHeaderFact_OrderID_ZW_Franchise_ID]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_OrderHeaderFact_OrderID_ZW_Franchise_ID] ON [Orders].[OrderHeaderFact]
(
	[OrderID] ASC,
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[OrderHeaderKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Hint_OrderHeaderFact_PickedUpDate]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_OrderHeaderFact_PickedUpDate] ON [Orders].[OrderHeaderFact]
(
	[PickedUpDate] ASC
)
INCLUDE ( 	[SalesSubtotal],
	[CustomerKey],
	[CenterKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_OrderHeaderFact_StatusKey_OrderDate]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [Hint_OrderHeaderFact_StatusKey_OrderDate] ON [Orders].[OrderHeaderFact]
(
	[StatusKey] ASC,
	[OrderDate] ASC
)
INCLUDE ( 	[OrderHeaderKey],
	[OrderID],
	[ZW_Franchise_ID],
	[PricingRatio],
	[DescriptionKey],
	[CustomerID],
	[ContactID],
	[OrdererFirstName],
	[OrdererLastName],
	[OrdererTitle],
	[OrdererPhoneNumber],
	[OrdererPhoneExtention],
	[OrdererFareaCode],
	[OrdererFaxNumber],
	[OrdererEmailAddress],
	[OnHold],
	[EstimateDate],
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
	[ShippingAddress],
	[OrderNotesKey],
	[InstallNotesKey],
	[ItemsDiscountTotal],
	[DiscountTotal],
	[DispositionOnCompletionID],
	[CustomerName],
	[ShippingTaxable],
	[RoyaltyRate],
	[JobBox],
	[ProofDate],
	[LineItemsOverriden],
	[OrderOriginID],
	[SalePersonKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_OrderHeaderFact_ZW_Franchise_ID_ContactID_PickedUpDate_includes]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [idx_OrderHeaderFact_ZW_Franchise_ID_ContactID_PickedUpDate_includes] ON [Orders].[OrderHeaderFact]
(
	[ZW_Franchise_ID] ASC,
	[ContactID] ASC,
	[PickedUpDate] ASC
)
INCLUDE ( 	[SalesTotal],
	[CenterKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 95) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [ZW_Franchise_ID_PickedUpDate_inc_SalesSubtotal_CustomerKey]    Script Date: 5/15/2018 11:59:36 AM ******/
CREATE NONCLUSTERED INDEX [ZW_Franchise_ID_PickedUpDate_inc_SalesSubtotal_CustomerKey] ON [Orders].[OrderHeaderFact]
(
	[ZW_Franchise_ID] ASC,
	[PickedUpDate] ASC
)
INCLUDE ( 	[SalesSubtotal],
	[CustomerKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Orders].[OrderHeaderFact] ADD  CONSTRAINT [DF_OrderHeaderFact_CustomerKey]  DEFAULT ((-255)) FOR [CustomerKey]
ALTER TABLE [Orders].[OrderHeaderFact] ADD  CONSTRAINT [DF_OrderHeaderFact_ContactKey]  DEFAULT ((-255)) FOR [ContactKey]
ALTER TABLE [Orders].[OrderHeaderFact] ADD  CONSTRAINT [DF_OrderHeaderFact_SalePersonKey]  DEFAULT ((-255)) FOR [SalePersonKey]
ALTER TABLE [Orders].[OrderHeaderFact] ADD  CONSTRAINT [DF_OrderHeaderFact_EnteredByKey]  DEFAULT ((-255)) FOR [EnteredByKey]
ALTER TABLE [Orders].[OrderHeaderFact] ADD  CONSTRAINT [DF_OrderHeaderFact_InvoiceKey]  DEFAULT ((-255)) FOR [InvoiceKey]
ALTER TABLE [Orders].[OrderHeaderFact] ADD  CONSTRAINT [DF_OrderHeaderFact_CenterKey]  DEFAULT ((-255)) FOR [CenterKey]
ALTER TABLE [Orders].[OrderHeaderFact] ADD  CONSTRAINT [DF_OrderHeaderFact_OriginKey]  DEFAULT ((-255)) FOR [OriginKey]
ALTER TABLE [Orders].[OrderHeaderFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderHeaderFact_DescriptionKey] FOREIGN KEY([DescriptionKey])
REFERENCES [Orders].[DescriptionDim] ([DescriptionKey])
ALTER TABLE [Orders].[OrderHeaderFact] CHECK CONSTRAINT [FK_OrderHeaderFact_DescriptionKey]
ALTER TABLE [Orders].[OrderHeaderFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderHeaderFact_InstallNotesKey] FOREIGN KEY([InstallNotesKey])
REFERENCES [Orders].[InstallNotesDim] ([InstallNotesKey])
ALTER TABLE [Orders].[OrderHeaderFact] CHECK CONSTRAINT [FK_OrderHeaderFact_InstallNotesKey]
ALTER TABLE [Orders].[OrderHeaderFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderHeaderFact_OrderNotesKey] FOREIGN KEY([OrderNotesKey])
REFERENCES [Orders].[OrderNotesDim] ([OrderNotesKey])
ALTER TABLE [Orders].[OrderHeaderFact] CHECK CONSTRAINT [FK_OrderHeaderFact_OrderNotesKey]
ALTER TABLE [Orders].[OrderHeaderFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderHeaderFact_PurchaseOrderNumberKey] FOREIGN KEY([PurchaseOrderNumberKey])
REFERENCES [Orders].[PurchaseOrderNumberDim] ([PurchaseOrderNumberKey])
ALTER TABLE [Orders].[OrderHeaderFact] CHECK CONSTRAINT [FK_OrderHeaderFact_PurchaseOrderNumberKey]
ALTER TABLE [Orders].[OrderHeaderFact]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderHeaderFact_StatusKey] FOREIGN KEY([StatusKey])
REFERENCES [Orders].[StatusDim] ([StatusKey])
ALTER TABLE [Orders].[OrderHeaderFact] CHECK CONSTRAINT [FK_OrderHeaderFact_StatusKey]
GO
