/****** Object:  Table [dbo].[TransHeader]    Script Date: 5/15/2018 12:07:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TransHeader](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[TransactionType] [int] NULL,
	[EstimateNumber] [int] NULL,
	[OrderNumber] [int] NULL,
	[OrderTemplateNumber] [int] NULL,
	[Version] [int] NULL,
	[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountID] [int] NULL,
	[AccountStoreID] [int] NULL,
	[ContactID] [int] NULL,
	[SalesPerson1ID] [int] NULL,
	[SalesPerson2ID] [int] NULL,
	[SalesPerson3ID] [int] NULL,
	[OrderNotes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PONumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductionNotes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingLevel] [float] NULL,
	[PricingLevelOverridden] [bit] NULL,
	[DiscountLevel] [float] NULL,
	[DiscountLevelOverridden] [bit] NULL,
	[EstimateCreatedDate] [datetime] NULL,
	[OrderCreatedDate] [datetime] NULL,
	[BuiltDate] [datetime] NULL,
	[SaleDate] [datetime] NULL,
	[ClosedDate] [datetime] NULL,
	[VoidedDate] [datetime] NULL,
	[ConvertedDate] [datetime] NULL,
	[RejectedDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ProofDate] [datetime] NULL,
	[LastFinanceChargeDate] [datetime] NULL,
	[DispositionID] [int] NULL,
	[SalesDispositionID] [int] NULL,
	[EnteredByID] [int] NULL,
	[HTMLShortFormat] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTMLLongFormat] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BasePrice] [decimal](18, 4) NULL,
	[DiscountPrice] [decimal](18, 4) NULL,
	[ModifierPrice] [decimal](18, 4) NULL,
	[RawSubTotalPrice] [decimal](18, 4) NULL,
	[RoundingPrice] [decimal](18, 4) NULL,
	[SubTotalPrice] [decimal](18, 4) NULL,
	[TaxesPrice] [decimal](18, 4) NULL,
	[TotalPrice] [decimal](18, 4) NULL,
	[SonsBasePrice] [decimal](18, 4) NULL,
	[SonsDiscountPrice] [decimal](18, 4) NULL,
	[SonsModifierPrice] [decimal](18, 4) NULL,
	[SonsRawSubTotalPrice] [decimal](18, 4) NULL,
	[SonsRoundingPrice] [decimal](18, 4) NULL,
	[SonsSubTotalPrice] [decimal](18, 4) NULL,
	[SonsTaxesPrice] [decimal](18, 4) NULL,
	[SonsTotalPrice] [decimal](18, 4) NULL,
	[FinanceChargeAmount] [decimal](18, 4) NULL,
	[BalanceDue] [decimal](18, 4) NULL,
	[PaymentTotal] [decimal](18, 4) NULL,
	[WriteOffAmount] [decimal](18, 4) NULL,
	[StatusID] [int] NULL,
	[StatusText] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxClassID] [int] NULL,
	[TaxClassOverridden] [bit] NULL,
	[InvoiceAddressID] [int] NULL,
	[InvoiceAddressOverridden] [bit] NULL,
	[InvoiceContactID] [int] NULL,
	[ShippingAddressID] [int] NULL,
	[ShippingAddressOverridden] [bit] NULL,
	[ShippingContactID] [int] NULL,
	[InvoiceAddressLinkID] [int] NULL,
	[ShippingAddressLinkID] [int] NULL,
	[EstimateGreeting] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EstimateGreetingTemplate] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsTaxExempt] [bit] NULL,
	[TaxNumber] [nchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderOriginID] [int] NULL,
	[OrderOriginName] [nchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ManuallyReOpened] [bit] NULL,
	[CreditMemoAmount] [float] NULL,
	[CreditMemoOrderID] [int] NULL,
	[NextRefNumber] [int] NULL,
	[PricingLevelID] [int] NULL,
	[PromotionID] [int] NULL,
	[UseTaxLookup] [bit] NULL,
	[TaxItems] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceNumber] [int] NULL,
	[ServiceTicketNumber] [int] NULL,
	[DivisionID] [int] NULL,
	[DivisionIDOverridden] [bit] NULL,
	[OrderNotesTemplate] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductionNotesTemplate] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFirmDueDate] [bit] NULL,
	[ShippingCompanyID] [int] NULL,
	[ShippingCompanyOV] [bit] NULL,
	[ShippingContactOV] [bit] NULL,
	[InvoiceCompanyID] [int] NULL,
	[InvoiceCompanyOV] [bit] NULL,
	[InvoiceContactOV] [bit] NULL,
	[UseProgressBilling] [bit] NULL,
	[PercentComplete] [float] NULL,
	[RecurrenceType] [int] NULL,
	[RecurrenceEndDate] [datetime] NULL,
	[LastRecurrence] [datetime] NULL,
	[ScheduledPaymentPlanID] [int] NULL,
	[ScheduledPaymentDate] [datetime] NULL,
	[ScheduledPayments] [int] NULL,
	[ScheduledPaymentIntervals] [int] NULL,
	[UsePaymentPlan] [bit] NULL,
	[DroppedDate] [datetime] NULL,
	[PurchaseOrderNumber] [int] NULL,
	[POPaymentTermsID] [int] NULL,
	[POShippingMethodID] [int] NULL,
	[RequestedDate] [datetime] NULL,
	[ApprovedDate] [datetime] NULL,
	[OrderedDate] [datetime] NULL,
	[ReceivedDate] [datetime] NULL,
	[RequestedByID] [int] NULL,
	[ApprovedByID] [int] NULL,
	[OrderedByID] [int] NULL,
	[ReceivedByID] [int] NULL,
	[ShipFromAddressLinkID] [int] NULL,
	[ShipFromAddressID] [int] NULL,
	[ShipFromID] [int] NULL,
	[IsValidTax] [bit] NULL,
	[TipsAmount] [float] NULL,
	[TipsPaidOut] [float] NULL,
	[BillNumber] [int] NULL,
	[ReceivingDocNumber] [int] NULL,
	[BillDate] [datetime] NULL,
	[ShipFromClassTypeID] [int] NULL,
	[ShipFromAddressOverridden] [bit] NULL,
	[ExpectedPayID] [int] NULL,
	[ExpectedPayClassTypeID] [int] NULL,
	[StationID] [int] NULL,
	[StationClassTypeID] [int] NULL,
	[SalesStationID] [int] NULL,
	[SalesStationClassTypeID] [int] NULL,
	[DefaultOrderID] [int] NULL,
	[DefaultOrderClassTypeID] [int] NULL,
	[DefaultOrderItemID] [int] NULL,
	[DefaultOrderItemClassTypeID] [int] NULL,
	[TaxablePrice] [float] NULL,
	[SonsTaxablePrice] [float] NULL,
	[StationActivityID] [int] NULL,
	[StationActivityClassTypeID] [int] NULL,
	[PayrollID] [int] NULL,
	[PayrollClassTypeID] [int] NULL,
	[EarlyPaymentDiscountOVAmount] [float] NULL,
	[IsEarlyPaymentDiscountOV] [bit] NULL,
	[RecurrenceStartDate] [datetime] NULL,
	[IsReturnDocument] [bit] NULL,
	[WarehouseID] [int] NULL,
	[WarehouseIDOV] [bit] NULL,
	[FinanceChargeTaxXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsPricingLocked] [bit] NULL,
	[ShipFromPhoneNumberID] [int] NULL,
	[ShipFromEmailAddress] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseShippingAccountInfo] [bit] NULL,
	[ShippingAccountNumber] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShippingCarrierID] [int] NULL,
	[ShippingCarrierClassTypeID] [int] NULL,
	[ShippingAccountPostalCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShipmentType] [int] NULL,
	[ShipmentTypeText] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsShippingLocked] [bit] NULL,
	[ShipFromCustomerID] [int] NULL,
	[ShipFromCustomerClassTypeID] [int] NULL,
	[ShipFromDivisionID] [int] NULL,
	[ShipFromDivisionClassTypeID] [int] NULL,
	[OverriddenUserFields] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [TransHeader_PK]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE UNIQUE CLUSTERED INDEX [TransHeader_PK] ON [dbo].[TransHeader]
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_InvoiceCompanyIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_InvoiceCompanyIndex] ON [dbo].[TransHeader]
(
	[InvoiceCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Index_TransHeader_PONumber]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_PONumber] ON [dbo].[TransHeader]
(
	[PONumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_SalesStationClassTypeID]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_SalesStationClassTypeID] ON [dbo].[TransHeader]
(
	[SalesStationClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_SalesStationID]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_SalesStationID] ON [dbo].[TransHeader]
(
	[SalesStationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_ShipFromAddressIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_ShipFromAddressIndex] ON [dbo].[TransHeader]
(
	[ShipFromAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_ShipFromAddressLinkIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_ShipFromAddressLinkIndex] ON [dbo].[TransHeader]
(
	[ShipFromAddressLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_ShipFromIDIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_ShipFromIDIndex] ON [dbo].[TransHeader]
(
	[ShipFromID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_ShippingCompanyIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_ShippingCompanyIndex] ON [dbo].[TransHeader]
(
	[ShippingCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_siTransHeader_ServiceTicketNum]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_siTransHeader_ServiceTicketNum] ON [dbo].[TransHeader]
(
	[ServiceTicketNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_StationClassTypeID]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_StationClassTypeID] ON [dbo].[TransHeader]
(
	[StationClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_TransHeader_StationID]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [Index_TransHeader_StationID] ON [dbo].[TransHeader]
(
	[StationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransDetailClosedDateIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransDetailClosedDateIndex] ON [dbo].[TransHeader]
(
	[ClosedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderAccountIDIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderAccountIDIndex] ON [dbo].[TransHeader]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderBuiltDateIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderBuiltDateIndex] ON [dbo].[TransHeader]
(
	[BuiltDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderContactID]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderContactID] ON [dbo].[TransHeader]
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderConvertedDateIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderConvertedDateIndex] ON [dbo].[TransHeader]
(
	[ConvertedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderDispositionIDIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderDispositionIDIndex] ON [dbo].[TransHeader]
(
	[DispositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderEstimateCreatedDateIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderEstimateCreatedDateIndex] ON [dbo].[TransHeader]
(
	[EstimateCreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderEstimateNumberIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderEstimateNumberIndex] ON [dbo].[TransHeader]
(
	[EstimateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderOrderCreatedDateIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderOrderCreatedDateIndex] ON [dbo].[TransHeader]
(
	[OrderCreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderOrderNumberIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderOrderNumberIndex] ON [dbo].[TransHeader]
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderRejectedDateIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderRejectedDateIndex] ON [dbo].[TransHeader]
(
	[RejectedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderSaleDateIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderSaleDateIndex] ON [dbo].[TransHeader]
(
	[SaleDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderSalesPerson1IDIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderSalesPerson1IDIndex] ON [dbo].[TransHeader]
(
	[SalesPerson1ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderStatusIDIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderStatusIDIndex] ON [dbo].[TransHeader]
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderTransactionTypeIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderTransactionTypeIndex] ON [dbo].[TransHeader]
(
	[TransactionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransHeaderVoidedDateIndex]    Script Date: 5/15/2018 12:07:00 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderVoidedDateIndex] ON [dbo].[TransHeader]
(
	[VoidedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
