/****** Object:  Table [dbo].[AddressLink]    Script Date: 5/15/2018 12:06:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AddressLink](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[IsMaster] [bit] NULL,
	[ParentID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[AddressTypeID] [int] NULL,
	[AddressID] [int] NULL,
	[AddressName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsOneTimeCompany] [bit] NULL,
	[CompanyName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContactName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [AddressLink_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_AddressLink_AddressID]    Script Date: 5/15/2018 12:06:41 PM ******/
CREATE NONCLUSTERED INDEX [Index_AddressLink_AddressID] ON [dbo].[AddressLink]
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_AddressLink_AddressTypeID]    Script Date: 5/15/2018 12:06:41 PM ******/
CREATE NONCLUSTERED INDEX [Index_AddressLink_AddressTypeID] ON [dbo].[AddressLink]
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_AddressLink_ParentClassTypeID]    Script Date: 5/15/2018 12:06:41 PM ******/
CREATE NONCLUSTERED INDEX [Index_AddressLink_ParentClassTypeID] ON [dbo].[AddressLink]
(
	[ParentClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_AddressLink]    Script Date: 5/15/2018 12:06:41 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_AddressLink] ON [dbo].[AddressLink]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
