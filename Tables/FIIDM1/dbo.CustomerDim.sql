/****** Object:  Table [dbo].[CustomerDim]    Script Date: 5/15/2018 11:59:50 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CustomerDim](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName]  AS ([CompanyName]),
	[IsRowCurrent] [bit] NULL,
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
	[CountryCode] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CountryName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL,
	[FirstOrderDate] [datetime] NULL,
	[LastOrderDate] [datetime] NULL,
	[LastPickedUpDate] [datetime] NULL,
	[LastEstimateDate] [datetime] NULL,
	[LastStatementDate] [datetime] NULL,
	[ActiveCustomer] [bit] NULL,
	[LastContactDate] [datetime] NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[IndustryKey] [int] NULL,
	[IndustryName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IndustryDetail]  AS (case when [IndustryName] like 'UNKNOWN%' then [T_IndustryType] else [IndustryName] end),
	[Industry_Similarity] [real] NULL,
	[Industry_Confidence] [real] NULL,
	[OriginKey] [int] NULL,
	[OriginName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Origin_Similarity] [real] NULL,
	[Origin_Confidence] [real] NULL,
	[MarketingFlag6] [smalldatetime] NULL,
	[MarketingFlag7] [smalldatetime] NULL,
	[MarketingFlag8] [smalldatetime] NULL,
	[MarketingFlag9] [smalldatetime] NULL,
	[MarketingFlag10] [smalldatetime] NULL,
	[MarketingFlag11] [smalldatetime] NULL,
	[MarketingFlag12] [smalldatetime] NULL,
	[MarketingFlag13] [smalldatetime] NULL,
	[MarketingFlag14] [smalldatetime] NULL,
	[MarketingFlag15] [smalldatetime] NULL,
	[MarketingFlag16] [smalldatetime] NULL,
	[MarketingFlag17] [smalldatetime] NULL,
	[MarketingFlag18] [smalldatetime] NULL,
	[MarketingFlag19] [smalldatetime] NULL,
	[MarketingFlag20] [smalldatetime] NULL,
	[MarketingFlag21] [smalldatetime] NULL,
	[MarketingFlag22] [smalldatetime] NULL,
	[MarketingFlag23] [smalldatetime] NULL,
	[MarketingFlag24] [smalldatetime] NULL,
	[MarketingFlag25] [smalldatetime] NULL,
	[T_WebNumber] [smallint] NULL,
	[T_CustomerID] [int] NULL,
	[T_StoreID] [int] NULL,
	[T_CustomerTypeID] [int] NULL,
	[T_CustomerType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T_CustomerTypeRaw] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T_PreliminaryOrigin] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T_IndustryTypeID] [int] NULL,
	[T_IndustryType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T_IndustryTypeRaw] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T_PreliminaryIndustry] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T_ZW_Franchise_ID] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T_Country] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipCode]  AS (left([ZIP],(5))),
 CONSTRAINT [PK_CustomerDim] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_CustomerDim_CustomerLookup]    Script Date: 5/15/2018 11:59:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerDim_CustomerLookup] ON [dbo].[CustomerDim]
(
	[T_WebNumber] ASC,
	[T_CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[CustomerDim] ADD  CONSTRAINT [DF_CustomerDim_IsRowCurrent]  DEFAULT ((1)) FOR [IsRowCurrent]
GO
