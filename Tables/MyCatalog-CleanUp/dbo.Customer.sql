/****** Object:  Table [dbo].[Customer]    Script Date: 5/15/2018 12:03:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGuid] [uniqueidentifier] NOT NULL,
	[StoreId] [int] NOT NULL,
	[Username] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Password] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PasswordFormatId] [int] NOT NULL,
	[PasswordSalt] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AdminComment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LanguageId] [int] NULL,
	[CurrencyId] [int] NULL,
	[TaxDisplayTypeId] [int] NOT NULL,
	[IsTaxExempt] [bit] NOT NULL,
	[VatNumber] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VatNumberStatusId] [int] NOT NULL,
	[SelectedPaymentMethodSystemName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CheckoutAttributes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DiscountCouponCode] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GiftCardCouponCodes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseRewardPointsDuringCheckout] [bit] NOT NULL,
	[TimeZoneId] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AffiliateId] [int] NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[IsSystemAccount] [bit] NOT NULL,
	[SystemName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastIpAddress] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[LastLoginDateUtc] [datetime] NULL,
	[LastActivityDateUtc] [datetime] NOT NULL,
	[BillingAddress_Id] [int] NULL,
	[ShippingAddress_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [idx_Customer_StoreId_Deleted_CreatedOnUtc_includes]    Script Date: 5/15/2018 12:03:42 PM ******/
CREATE NONCLUSTERED INDEX [idx_Customer_StoreId_Deleted_CreatedOnUtc_includes] ON [dbo].[Customer]
(
	[StoreId] ASC,
	[Deleted] ASC,
	[CreatedOnUtc] ASC
)
INCLUDE ( 	[Id]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_Customer_CustomerGuid]    Script Date: 5/15/2018 12:03:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Customer_CustomerGuid] ON [dbo].[Customer]
(
	[CustomerGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_Customer_Email]    Script Date: 5/15/2018 12:03:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Customer_Email] ON [dbo].[Customer]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_Customer_Username]    Script Date: 5/15/2018 12:03:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Customer_Username] ON [dbo].[Customer]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [Affiliate_AffiliatedCustomers] FOREIGN KEY([AffiliateId])
REFERENCES [dbo].[Affiliate] ([Id])
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [Affiliate_AffiliatedCustomers]
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [Customer_BillingAddress] FOREIGN KEY([BillingAddress_Id])
REFERENCES [dbo].[Address] ([Id])
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [Customer_BillingAddress]
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [Customer_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [Customer_Currency]
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [Customer_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [Customer_Language]
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [Customer_ShippingAddress] FOREIGN KEY([ShippingAddress_Id])
REFERENCES [dbo].[Address] ([Id])
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [Customer_ShippingAddress]
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [Customer_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([Id])
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [Customer_Store]
GO
