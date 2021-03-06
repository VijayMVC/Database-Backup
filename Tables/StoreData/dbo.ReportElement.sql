/****** Object:  Table [dbo].[ReportElement]    Script Date: 5/15/2018 12:06:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ReportElement](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [smalldatetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ParentID] [int] NULL,
	[ParentStoreID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[ElementName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortIndex] [float] NULL,
	[LinkID] [int] NULL,
	[LinkStoreID] [int] NULL,
	[LinkClassTypeID] [int] NULL,
	[ItemPrefix] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IncomeID] [int] NULL,
	[IncomeStoreID] [int] NULL,
	[IncomeClassTypeID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[FamilyID] [int] NULL,
	[FamilyStoreID] [int] NULL,
	[FamilyClassTypeID] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [ReportElement_PK]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE CLUSTERED INDEX [ReportElement_PK] ON [dbo].[ReportElement]
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_ReportElement_SortIndex]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Index_ReportElement_SortIndex] ON [dbo].[ReportElement]
(
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_ReportElement_Parent]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_ReportElement_Parent] ON [dbo].[ReportElement]
(
	[ParentID] ASC,
	[ParentStoreID] ASC,
	[ParentClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
