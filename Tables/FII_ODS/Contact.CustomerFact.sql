/****** Object:  Table [Contact].[CustomerFact]    Script Date: 5/15/2018 11:59:22 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Contact].[CustomerFact](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
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
	[CreateDate] [date] NULL,
	[ImportBatchKey] [int] NULL,
	[FirstOrderDate] [date] NULL,
	[LastOrderDate] [date] NULL,
	[LastPickedUpDate] [date] NULL,
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
	[LastSaleAmount] [money] NULL,
	[CorebridgeCustomerKey] [int] NULL,
	[System] [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_CustomerFact] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [CustomerFact_ZipKey]    Script Date: 5/15/2018 11:59:22 AM ******/
CREATE NONCLUSTERED INDEX [CustomerFact_ZipKey] ON [Contact].[CustomerFact]
(
	[ZipKey] ASC
)
INCLUDE ( 	[CustomerKey],
	[City],
	[State]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_CustFact_Keystone]    Script Date: 5/15/2018 11:59:22 AM ******/
CREATE NONCLUSTERED INDEX [Hint_CustFact_Keystone] ON [Contact].[CustomerFact]
(
	[CustomerID] ASC,
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[CustomerKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_CustomerFact_CompanyNameKey]    Script Date: 5/15/2018 11:59:22 AM ******/
CREATE NONCLUSTERED INDEX [Hint_CustomerFact_CompanyNameKey] ON [Contact].[CustomerFact]
(
	[CompanyNameKey] ASC
)
INCLUDE ( 	[CustomerKey],
	[ZW_Franchise_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_CustomerFact_ZW_Franchise_ID_CompanyNameKey]    Script Date: 5/15/2018 11:59:22 AM ******/
CREATE NONCLUSTERED INDEX [Hint_CustomerFact_ZW_Franchise_ID_CompanyNameKey] ON [Contact].[CustomerFact]
(
	[ZW_Franchise_ID] ASC,
	[CompanyNameKey] ASC
)
INCLUDE ( 	[CustomerKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_CustomerFact_ZW_Franchise_ID_IndustryTypeID]    Script Date: 5/15/2018 11:59:22 AM ******/
CREATE NONCLUSTERED INDEX [Hint_CustomerFact_ZW_Franchise_ID_IndustryTypeID] ON [Contact].[CustomerFact]
(
	[ZW_Franchise_ID] ASC,
	[IndustryTypeID] ASC
)
INCLUDE ( 	[CustomerKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_CustomerFactZW_Franchise_ID]    Script Date: 5/15/2018 11:59:22 AM ******/
CREATE NONCLUSTERED INDEX [Hint_CustomerFactZW_Franchise_ID] ON [Contact].[CustomerFact]
(
	[ZW_Franchise_ID] ASC
)
INCLUDE ( 	[CustomerKey],
	[CompanyNameKey]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Hint_Keystone]    Script Date: 5/15/2018 11:59:22 AM ******/
CREATE NONCLUSTERED INDEX [Hint_Keystone] ON [Contact].[CustomerFact]
(
	[KeystoneCustomerKey] ASC
)
INCLUDE ( 	[CustomerID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Contact].[CustomerFact] ADD  CONSTRAINT [DF_CustomerFact_CompanyNameKey]  DEFAULT ((-255)) FOR [CompanyNameKey]
ALTER TABLE [Contact].[CustomerFact] ADD  CONSTRAINT [DF_CustomerFact_APContactKey]  DEFAULT ((-255)) FOR [APContactKey]
ALTER TABLE [Contact].[CustomerFact] ADD  CONSTRAINT [DF_CustomerFact_SalesPersonKey]  DEFAULT ((-255)) FOR [SalesPersonKey]
ALTER TABLE [Contact].[CustomerFact] ADD  CONSTRAINT [DF_CustomerFact_CenterKey]  DEFAULT ((-255)) FOR [CenterKey]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_CompanyNameKey] FOREIGN KEY([CompanyNameKey])
REFERENCES [Contact].[CompanyNameDim] ([CompanyNameKey])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_CompanyNameKey]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_CountryKey] FOREIGN KEY([CountryKey])
REFERENCES [Contact].[CountryDim] ([CountryKey])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_CountryKey]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_CountyKey] FOREIGN KEY([CountyKey])
REFERENCES [Contact].[CountyDim] ([CountyKey])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_CountyKey]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_DepartmentKey] FOREIGN KEY([DepartmentKey])
REFERENCES [Contact].[DepartmentDim] ([DepartmentKey])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_DepartmentKey]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_FlagsKey] FOREIGN KEY([FlagsKey])
REFERENCES [Contact].[FlagsDim] ([FlagsKey])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_FlagsKey]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_ImportBatchKey] FOREIGN KEY([ImportBatchKey])
REFERENCES [Contact].[ImportBatchDim] ([ImportBatchKey])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_ImportBatchKey]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_MktgList1Key] FOREIGN KEY([MktgList1Key])
REFERENCES [Contact].[MktgList1Dim] ([MktgList1Key])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_MktgList1Key]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_MktgList2Key] FOREIGN KEY([MktgList2Key])
REFERENCES [Contact].[MktgList2Dim] ([MktgList2Key])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_MktgList2Key]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_NotesKey] FOREIGN KEY([NotesKey])
REFERENCES [Contact].[NotesDim] ([NotesKey])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_NotesKey]
ALTER TABLE [Contact].[CustomerFact]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomerFact_ZipKey] FOREIGN KEY([ZipKey])
REFERENCES [Contact].[ZipDim] ([ZipKey])
ALTER TABLE [Contact].[CustomerFact] CHECK CONSTRAINT [FK_CustomerFact_ZipKey]
GO
