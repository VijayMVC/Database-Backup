/****** Object:  Table [dbo].[CustomerFactUpdate]    Script Date: 5/15/2018 12:06:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CustomerFactUpdate](
	[CustomerKey] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyNameKey] [int] NULL,
	[DepartmentKey] [int] NULL,
	[PrimaryContactID] [int] NULL,
	[PrimaryContactKey] [int] NULL,
	[APContactID] [int] NULL,
	[APContactKey] [int] NULL,
	[APSameAsPrimary] [bit] NULL,
	[SalesPersonID] [int] NULL,
	[SalesPersonKey] [int] NULL,
	[PricingRatio] [float] NULL,
	[BillingAddress1] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingAddress2] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[P2PhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipKey] [int] NULL,
	[CountyKey] [int] NULL,
	[CountryKey] [int] NULL,
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
	[NotesKey] [int] NULL,
	[Prospect] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[ImportBatchKey] [int] NULL,
	[FirstOrderDate] [datetime] NULL,
	[LastOrderDate] [datetime] NULL,
	[LastPickedUpDate] [datetime] NULL,
	[LastEstimateDate] [date] NULL,
	[LastStatementDate] [date] NULL,
	[LastContact1] [date] NULL,
	[LastContact2] [date] NULL,
	[LastContact3] [date] NULL,
	[LastContact4] [date] NULL,
	[LastContact5] [date] NULL,
	[TaxRegion] [int] NULL,
	[ImportDate] [date] NULL,
	[FlagsKey] [int] NULL,
	[ActiveCustomer] [bit] NULL,
	[PaymentTerms] [int] NULL,
	[LastContactDate] [date] NULL,
	[MarketingFlag6] [date] NULL,
	[MarketingFlag7] [date] NULL,
	[MarketingFlag8] [date] NULL,
	[MarketingFlag9] [date] NULL,
	[MarketingFlag10] [date] NULL,
	[MarketingFlag11] [date] NULL,
	[MarketingFlag12] [date] NULL,
	[MarketingFlag13] [date] NULL,
	[MarketingFlag14] [date] NULL,
	[MarketingFlag15] [date] NULL,
	[MarketingFlag16] [date] NULL,
	[MarketingFlag17] [date] NULL,
	[MarketingFlag18] [date] NULL,
	[MarketingFlag19] [date] NULL,
	[MarketingFlag20] [date] NULL,
	[MarketingFlag21] [date] NULL,
	[MarketingFlag22] [date] NULL,
	[MarketingFlag23] [date] NULL,
	[MarketingFlag24] [date] NULL,
	[MarketingFlag25] [date] NULL,
	[MktgList1Key] [int] NULL,
	[MktgList2Key] [int] NULL,
	[ChargeStatusDate] [date] NULL,
	[PORequired] [bit] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NULL,
	[URL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxIDExpDate] [datetime] NULL,
	[KeystoneCustomerKey] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CoreBridgeCustomerKey] [int] NULL,
	[LastSameAmount] [money] NULL,
	[System] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastSaleDate] [datetime] NULL
) ON [PRIMARY]

GO
