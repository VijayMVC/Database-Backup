/****** Object:  Table [dbo].[AdvQuery]    Script Date: 5/15/2018 12:06:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AdvQuery](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[QueryName] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QueryType] [int] NULL,
	[OwnedQuery] [bit] NULL,
	[ParentID] [int] NULL,
	[ParentStoreID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShowRange] [int] NULL,
	[ShowRangeCount] [int] NULL,
	[TableNodeID] [int] NULL,
	[QuerySortFields] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QueryXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedByID] [int] NULL,
	[IsPrivate] [bit] NULL,
	[LastModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [AdvQuery_PK]    Script Date: 5/15/2018 12:06:41 PM ******/
CREATE UNIQUE CLUSTERED INDEX [AdvQuery_PK] ON [dbo].[AdvQuery]
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
