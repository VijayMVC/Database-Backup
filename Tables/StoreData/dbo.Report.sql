/****** Object:  Table [dbo].[Report]    Script Date: 5/15/2018 12:06:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Report](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [smalldatetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ReportName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentID] [int] NULL,
	[ParentStoreID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[TemplateID] [int] NULL,
	[TemplateStoreID] [int] NULL,
	[TemplateClassTypeID] [int] NULL,
	[ShowOnMenu] [bit] NULL,
	[CriteriaOptions] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OutputDeviceOptions] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortingOptions] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortIndex] [float] NULL,
	[OtherOptions] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortCut] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Report_PK]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE CLUSTERED INDEX [Report_PK] ON [dbo].[Report]
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Report_SortIndex]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Index_Report_SortIndex] ON [dbo].[Report]
(
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_Report_Parent]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_Report_Parent] ON [dbo].[Report]
(
	[ParentID] ASC,
	[ParentStoreID] ASC,
	[ParentClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_Report_Template]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_Report_Template] ON [dbo].[Report]
(
	[TemplateID] ASC,
	[TemplateStoreID] ASC,
	[TemplateClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
