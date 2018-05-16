/****** Object:  Table [dbo].[Customer Database]    Script Date: 5/15/2018 12:00:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Customer Database](
	[CustomerID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[CompanyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Department] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryContactID] [int] NULL,
	[APContactID] [int] NULL,
	[APSameAsPrimary] [bit] NULL,
	[SalesPersonID] [int] NULL,
	[PricingRatio] [float] NULL,
	[BillingAddress1] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddress2] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Zip] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[County] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerTypeID] [int] NULL,
	[IndustryTypeID] [int] NULL,
	[OutstandingBalance] [money] NULL,
	[ChargeAccount] [bit] NULL,
	[CreditLimit] [money] NULL,
	[CreditLimitUsed] [money] NULL,
	[CreditBalance] [money] NULL,
	[TaxExempt] [bit] NULL,
	[TaxExemptNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AlternateStateTax] [float] NULL,
	[AlternateCountyTax] [float] NULL,
	[CreditCardNumber] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreditCardType] [int] NULL,
	[CreditCardExp] [datetime] NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Prospect] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[ImportBatch] [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstOrderDate] [datetime] NULL,
	[LastOrderDate] [datetime] NULL,
	[LastPickedUpDate] [datetime] NULL,
	[LastEstimateDate] [datetime] NULL,
	[LastStatementDate] [datetime] NULL,
	[LastContact1] [datetime] NULL,
	[LastContact2] [datetime] NULL,
	[LastContact3] [datetime] NULL,
	[LastContact4] [datetime] NULL,
	[LastContact5] [datetime] NULL,
	[TaxRegion] [int] NULL,
	[ImportDate] [datetime] NULL,
	[Flags] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActiveCustomer] [bit] NULL,
	[PaymentTerms] [int] NULL,
	[UserField1] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserField2] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastContactDate] [datetime] NULL,
	[MarketingFlag6] [datetime] NULL,
	[MarketingFlag7] [datetime] NULL,
	[MarketingFlag8] [datetime] NULL,
	[MarketingFlag9] [datetime] NULL,
	[MarketingFlag10] [datetime] NULL,
	[MarketingFlag11] [datetime] NULL,
	[MarketingFlag12] [datetime] NULL,
	[MarketingFlag13] [datetime] NULL,
	[MarketingFlag14] [datetime] NULL,
	[MarketingFlag15] [datetime] NULL,
	[MktgList1] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgList2] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChargeStatusDate] [datetime] NULL,
	[PORequired] [bit] NULL,
	[MarketingFlag16] [datetime] NULL,
	[MarketingFlag17] [datetime] NULL,
	[MarketingFlag18] [datetime] NULL,
	[MarketingFlag19] [datetime] NULL,
	[MarketingFlag20] [datetime] NULL,
	[MarketingFlag21] [datetime] NULL,
	[MarketingFlag22] [datetime] NULL,
	[MarketingFlag23] [datetime] NULL,
	[MarketingFlag24] [datetime] NULL,
	[MarketingFlag25] [datetime] NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxIDExpDate] [datetime] NULL,
	[IsCCEncrypted] [bit] NULL,
	[CCNumber] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCNameOnCard] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SendBillingAddress] [bit] NULL,
	[SendCompanyAddress] [bit] NULL,
	[AltBillingAddress1] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AltBillingAddress2] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AltBillingCity] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AltBillingState] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AltBillingZip] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AltBillingCounty] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Customer Database] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[StoreID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IDX_CustomerDB_CustID]    Script Date: 5/15/2018 12:00:48 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CustomerDB_CustID] ON [dbo].[Customer Database]
(
	[zw_franchise_id] ASC,
	[CustomerID] ASC
)
INCLUDE ( 	[Prospect],
	[ActiveCustomer]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_FranchiseID]    Script Date: 5/15/2018 12:00:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_FranchiseID] ON [dbo].[Customer Database]
(
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Customer Database] ADD  CONSTRAINT [DF_Customer Database_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
