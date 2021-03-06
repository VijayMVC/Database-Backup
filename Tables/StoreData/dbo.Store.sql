/****** Object:  Table [dbo].[Store]    Script Date: 5/15/2018 12:06:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Store](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[CompanyName] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StoreNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressID] [int] NULL,
	[EmailAddress] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TagLine] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoicePrefix] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxIdentifier] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultAreaCode] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultDueTime] [datetime] NULL,
	[DepositPercentage] [decimal](18, 0) NULL,
	[OrderMinimum] [decimal](18, 0) NULL,
	[PhoneNumberID] [int] NULL,
	[FaxNumberID] [int] NULL,
	[LogoID] [int] NULL,
	[ManagerID] [int] NULL,
	[ScreenTemplateID] [int] NULL,
	[WebInputTemplateID] [int] NULL,
	[InvoiceTemplateID] [int] NULL,
	[EstimateTemplateID] [int] NULL,
	[WorkOrderTemplateID] [int] NULL,
	[EmployeeWebOutputTemplateID] [int] NULL,
	[CustomerWebOutputTemplateID] [int] NULL,
	[DefaultTaxClassID] [int] NULL,
	[AutoDecLunch] [bit] NULL,
	[HoursBeforeLunch] [int] NULL,
	[LunchMinutes] [int] NULL,
	[MinClockInTime] [datetime] NULL,
	[MaxClockOutTime] [datetime] NULL,
	[DefaultpaymentTermID] [int] NULL,
	[MktgListCode1Name] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MktgListCode2Name] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoundingOption] [int] NULL,
	[RoundingDigits] [int] NULL,
	[RoyaltyFee1Name] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoyaltyFee1] [float] NULL,
	[RoyaltyFee2Name] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoyaltyFee2] [float] NULL,
	[DepositMinimum] [float] NULL,
	[WebAddress] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultCountryCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StarShipProductID] [int] NULL,
	[StarShipProductStoreID] [int] NULL,
	[StarShipProductClassTypeID] [int] NULL,
	[EquipmentCostMultiplier] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LaborCostMultiplier] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaterialCostMultiplier] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OutsourceCostMultiplier] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OtherCostMultiplier] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseTaxLookup] [bit] NULL,
	[InvoiceAsOrderNumber] [bit] NULL,
	[QPHomeListID] [int] NULL,
	[QPHomeListStoreID] [int] NULL,
	[QPTransListID] [int] NULL,
	[QPTransListStoreID] [int] NULL,
	[QPServiceListID] [int] NULL,
	[QPServiceListStoreID] [int] NULL,
	[FreightCostMultiplier] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParamToVarList] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddressID] [int] NULL,
	[ShippingAddressID] [int] NULL,
	[BankName] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankCode] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankAccountNumber] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ChamberCommerceNumber] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PickUpAddressLinkID] [int] NULL,
	[FinanceChargeAccountID] [int] NULL,
	[FinanceChargeAccountClassTypeID] [int] NULL,
	[TipsRevenueAccountID] [int] NULL,
	[TipsRevenueAccountClassTypeID] [int] NULL,
	[WriteOffAccountID] [int] NULL,
	[WriteOffAccountClassTypeID] [int] NULL,
	[TipsPayOffAccountID] [int] NULL,
	[TipsPayOffAccountClassTypeID] [int] NULL,
	[PickUpAddressID] [int] NULL,
	[DefaultAPsPaymentTermID] [int] NULL,
	[BillDiscountAccountID] [int] NULL,
	[BillDiscountAccountClassTypeID] [int] NULL,
	[AppVersion] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [Store_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_Store_AddressID]    Script Date: 5/15/2018 12:06:58 PM ******/
CREATE NONCLUSTERED INDEX [Index_Store_AddressID] ON [dbo].[Store]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Store_ManagerID]    Script Date: 5/15/2018 12:06:58 PM ******/
CREATE NONCLUSTERED INDEX [Index_Store_ManagerID] ON [dbo].[Store]
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Store_PhoneNumberID]    Script Date: 5/15/2018 12:06:58 PM ******/
CREATE NONCLUSTERED INDEX [Index_Store_PhoneNumberID] ON [dbo].[Store]
(
	[PhoneNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Store_ScreenTemplateID]    Script Date: 5/15/2018 12:06:58 PM ******/
CREATE NONCLUSTERED INDEX [Index_Store_ScreenTemplateID] ON [dbo].[Store]
(
	[ScreenTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
