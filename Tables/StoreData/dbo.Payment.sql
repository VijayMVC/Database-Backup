/****** Object:  Table [dbo].[Payment]    Script Date: 5/15/2018 12:06:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Payment](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[NameOnCard] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TrackingNumber] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PaymentAccountID] [int] NULL,
	[PaymentAccountClassTypeID] [int] NULL,
	[ExpirationDate] [datetime] NULL,
	[VCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsCCNumEncrypt] [bit] NULL,
	[DisplayNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsVCodeEncrypted] [bit] NULL,
	[Undeposited] [bit] NULL,
	[DepositGLGroupID] [int] NULL,
	[DepositJournalID] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[BankAccountID] [int] NULL,
	[BankAccountClasstypeID] [int] NULL,
	[TenderType] [int] NULL,
	[PayrollID] [int] NULL,
	[PayrollClassTypeID] [int] NULL,
	[PaycheckID] [int] NULL,
	[BankReference] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BankCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BranchCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CIN] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCAccount] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCCSTransactionGuid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CCCSCustomerGuid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActualCheck] [bit] NULL,
 CONSTRAINT [Payment_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_Payment_PaymentAccountID]    Script Date: 5/15/2018 12:06:50 PM ******/
CREATE NONCLUSTERED INDEX [Index_Payment_PaymentAccountID] ON [dbo].[Payment]
(
	[PaymentAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Payment_siPayment_BankAccountID]    Script Date: 5/15/2018 12:06:50 PM ******/
CREATE NONCLUSTERED INDEX [Index_Payment_siPayment_BankAccountID] ON [dbo].[Payment]
(
	[BankAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Indexes_Payment]    Script Date: 5/15/2018 12:06:50 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_Payment] ON [dbo].[Payment]
(
	[TrackingNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_Payment_ExpirationDate]    Script Date: 5/15/2018 12:06:50 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_Payment_ExpirationDate] ON [dbo].[Payment]
(
	[ExpirationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
