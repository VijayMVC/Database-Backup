/****** Object:  Table [dbo].[Account]    Script Date: 5/15/2018 12:06:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Account](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountNumber] [int] NULL,
	[ParentID] [int] NULL,
	[Department] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCreated] [datetime] NULL,
	[DateImported] [datetime] NULL,
	[ImportBatch] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountingContactID] [int] NULL,
	[PrimaryContactID] [int] NULL,
	[BillingAddressID] [int] NULL,
	[ShippingAddressID] [int] NULL,
	[MainPhoneNumberID] [int] NULL,
	[MainFaxNumberID] [int] NULL,
	[Flags] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Keywords] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxNumberExpDate] [datetime] NULL,
	[TaxClassID] [int] NULL,
	[WebAddress] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsProspect] [bit] NULL,
	[TaxExempt] [bit] NULL,
	[HasCreditAccount] [bit] NULL,
	[CreditApprovalDate] [datetime] NULL,
	[CreditLimit] [decimal](18, 4) NULL,
	[CreditBalance] [decimal](18, 4) NULL,
	[DefaultPaymentExpDate] [datetime] NULL,
	[DefaultPaymentTrackingNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentNameOnCard] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPaymentTypeID] [int] NULL,
	[PricingPlanTypeID] [int] NULL,
	[PaymentTermsID] [int] NULL,
	[DiscountLevel] [float] NULL,
	[PricingLevel] [float] NULL,
	[PONumberRequired] [bit] NULL,
	[IndustryID] [int] NULL,
	[OriginID] [int] NULL,
	[Marketing3ID] [int] NULL,
	[SalesPersonID1] [int] NULL,
	[SalesPersonID2] [int] NULL,
	[SalesPersonID3] [int] NULL,
	[TaxExemptExpDate] [datetime] NULL,
	[CreditNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingLevelID] [int] NULL,
	[PromotionID] [int] NULL,
	[UseTaxLookup] [bit] NULL,
	[HasServiceContract] [bit] NULL,
	[ServiceContractStartDate] [datetime] NULL,
	[ServiceContractExpDate] [datetime] NULL,
	[ServiceContractTypeID] [int] NULL,
	[ServiceContractNotes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionID] [int] NULL,
	[RegionID] [int] NULL,
	[PONumber] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrimaryNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PriNumberTypeID] [int] NULL,
	[PriNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecondaryNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecNumberTypeID] [int] NULL,
	[SecNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsClient] [bit] NULL,
	[IsVendor] [bit] NULL,
	[IsPersonal] [bit] NULL,
	[Is1099Vendor] [bit] NULL,
	[VendorPaymentTermsID] [int] NULL,
	[MyAccountNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultShipMethodID] [int] NULL,
	[ThirdNumber] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ThirdNumberTypeID] [int] NULL,
	[ThirdNumberTypeText] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFullyTaxExempt] [bit] NULL,
	[VendorCreditBalance] [float] NULL,
	[StageID] [int] NULL,
	[StageClassTypeID] [int] NULL,
	[StageActivityID] [int] NULL,
	[StageActivityClassTypeID] [int] NULL,
 CONSTRAINT [Account_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [AccountCompanyNameIndex]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [AccountCompanyNameIndex] ON [dbo].[Account]
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [AccountIndustryIDIndex]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [AccountIndustryIDIndex] ON [dbo].[Account]
(
	[IndustryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [AccountOriginIDIndex]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [AccountOriginIDIndex] ON [dbo].[Account]
(
	[OriginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [AccountParentIDIndex]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [AccountParentIDIndex] ON [dbo].[Account]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [AccountSalesPerson1Index]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [AccountSalesPerson1Index] ON [dbo].[Account]
(
	[SalesPersonID1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Account_AccountNumber]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [Index_Account_AccountNumber] ON [dbo].[Account]
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
