/****** Object:  Table [dbo].[Order]    Script Date: 5/15/2018 12:03:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[OrderGuid] [uniqueidentifier] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[ShippingStatusId] [int] NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
	[PaymentMethodSystemName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerCurrencyCode] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CurrencyRate] [decimal](18, 4) NOT NULL,
	[CustomerTaxDisplayTypeId] [int] NOT NULL,
	[VatNumber] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderSubtotalInclTax] [decimal](18, 4) NOT NULL,
	[OrderSubtotalExclTax] [decimal](18, 4) NOT NULL,
	[OrderSubTotalDiscountInclTax] [decimal](18, 4) NOT NULL,
	[OrderSubTotalDiscountExclTax] [decimal](18, 4) NOT NULL,
	[OrderShippingInclTax] [decimal](18, 4) NOT NULL,
	[OrderShippingExclTax] [decimal](18, 4) NOT NULL,
	[PaymentMethodAdditionalFeeInclTax] [decimal](18, 4) NOT NULL,
	[PaymentMethodAdditionalFeeExclTax] [decimal](18, 4) NOT NULL,
	[TaxRates] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderTax] [decimal](18, 4) NOT NULL,
	[OrderDiscount] [decimal](18, 4) NOT NULL,
	[OrderTotal] [decimal](18, 4) NOT NULL,
	[RefundedAmount] [decimal](18, 4) NOT NULL,
	[CheckoutAttributeDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CheckoutAttributesXml] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerLanguageId] [int] NOT NULL,
	[AffiliateId] [int] NULL,
	[CustomerIp] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AllowStoringCreditCardNumber] [bit] NOT NULL,
	[CardType] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CardName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CardNumber] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaskedCreditCardNumber] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CardCvv2] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CardExpirationMonth] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CardExpirationYear] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuthorizationTransactionId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuthorizationTransactionCode] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuthorizationTransactionResult] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CaptureTransactionId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CaptureTransactionResult] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubscriptionTransactionId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PurchaseOrderNumber] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaidDateUtc] [datetime] NULL,
	[ShippingMethod] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShippingRateComputationMethodSystemName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShippedDateUtc] [datetime] NULL,
	[DeliveryDateUtc] [datetime] NULL,
	[OrderWeight] [decimal](18, 4) NOT NULL,
	[TrackingNumber] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[BillingAddressId] [int] NOT NULL,
	[ShippingAddressId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [_dta_index_Order_50_1397580017__K2_K53_K1_K7_5_6_24_54]    Script Date: 5/15/2018 12:03:28 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Order_50_1397580017__K2_K53_K1_K7_5_6_24_54] ON [dbo].[Order]
(
	[StoreId] ASC,
	[Deleted] ASC,
	[Id] ASC,
	[PaymentStatusId] ASC
)
INCLUDE ( 	[OrderStatusId],
	[ShippingStatusId],
	[OrderTotal],
	[CreatedOnUtc]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IDX_NCI_CoverAdress20140326-093113]    Script Date: 5/15/2018 12:03:28 PM ******/
CREATE NONCLUSTERED INDEX [IDX_NCI_CoverAdress20140326-093113] ON [dbo].[Order]
(
	[BillingAddressId] ASC,
	[ShippingAddressId] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IDX_NCI_CoverShippindAddID_ID-20140326-094652]    Script Date: 5/15/2018 12:03:28 PM ******/
CREATE NONCLUSTERED INDEX [IDX_NCI_CoverShippindAddID_ID-20140326-094652] ON [dbo].[Order]
(
	[ShippingAddressId] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_Order_StoreId_OrderStatusId_Deleted_CreatedOnUtc_includes]    Script Date: 5/15/2018 12:03:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_Order_StoreId_OrderStatusId_Deleted_CreatedOnUtc_includes] ON [dbo].[Order]
(
	[StoreId] ASC,
	[OrderStatusId] ASC,
	[Deleted] ASC,
	[CreatedOnUtc] ASC
)
INCLUDE ( 	[OrderTotal]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_Order_CustomerId]    Script Date: 5/15/2018 12:03:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_CustomerId] ON [dbo].[Order]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Affiliate_AffiliatedOrders] FOREIGN KEY([AffiliateId])
REFERENCES [dbo].[Affiliate] ([Id])
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Affiliate_AffiliatedOrders]
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_BillingAddress] FOREIGN KEY([BillingAddressId])
REFERENCES [dbo].[Address] ([Id])
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_BillingAddress]
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_Customer]
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_ShippingAddress] FOREIGN KEY([ShippingAddressId])
REFERENCES [dbo].[Address] ([Id])
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_ShippingAddress]
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [Order_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([Id])
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [Order_Store]
GO
