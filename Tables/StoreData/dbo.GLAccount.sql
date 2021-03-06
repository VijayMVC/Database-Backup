/****** Object:  Table [dbo].[GLAccount]    Script Date: 5/15/2018 12:06:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GLAccount](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[AccountGroupID] [int] NULL,
	[AccountName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExportAccountName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExportAccountNumber] [int] NULL,
	[ExportGroupID] [int] NULL,
	[ConsolidateExport] [bit] NULL,
	[Depth] [int] NULL,
	[PathName1] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PathName2] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PathName3] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PathName4] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PathName5] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MasterGroup] [bit] NULL,
	[AllowSubGroups] [bit] NULL,
	[RequireOneMember] [bit] NULL,
	[MemberClassTypeID] [int] NULL,
	[ConsolidateSubAccounts] [bit] NULL,
	[SortIndex] [float] NULL,
	[ExportAccountDesc] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NoExportToExternal] [bit] NULL,
	[AccountType] [int] NULL,
	[LastCheckNumber] [int] NULL,
	[GLClassificationType] [int] NULL,
	[GLClassTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsRoyaltyExempt] [bit] NULL,
	[RoyaltyFee1] [float] NULL,
	[RoyaltyFee1OV] [bit] NULL,
	[RoyaltyFee2] [float] NULL,
	[RoyaltyFee2OV] [bit] NULL,
	[AddressID] [int] NULL,
	[AlwaysRoundUp] [bit] NULL,
	[CapAmount] [float] NULL,
	[ReferenceID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxRate] [float] NULL,
	[AssociatedGLAccountID] [int] NULL,
	[NonGLAccount] [bit] NULL,
	[AccountGroupClassTypeID] [int] NULL,
	[VendorID] [int] NULL,
	[VendorClassTypeID] [int] NULL,
 CONSTRAINT [GLAccount_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Index_GLAccount_AccountName]    Script Date: 5/15/2018 12:06:46 PM ******/
CREATE NONCLUSTERED INDEX [Index_GLAccount_AccountName] ON [dbo].[GLAccount]
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_GLAccount_ExportGroupID]    Script Date: 5/15/2018 12:06:46 PM ******/
CREATE NONCLUSTERED INDEX [Index_GLAccount_ExportGroupID] ON [dbo].[GLAccount]
(
	[ExportGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_GLAccount_sidVendorID]    Script Date: 5/15/2018 12:06:46 PM ******/
CREATE NONCLUSTERED INDEX [Index_GLAccount_sidVendorID] ON [dbo].[GLAccount]
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_GLAccount]    Script Date: 5/15/2018 12:06:46 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_GLAccount] ON [dbo].[GLAccount]
(
	[AccountGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
