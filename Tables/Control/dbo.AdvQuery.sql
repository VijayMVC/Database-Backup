/****** Object:  Table [dbo].[AdvQuery]    Script Date: 5/15/2018 11:58:48 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AdvQuery](
	[ID] [int] NULL,
	[StoreID] [int] NULL,
	[ClassTypeID] [int] NULL,
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
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShowRange] [int] NULL,
	[ShowRangeCount] [int] NULL,
	[TableNodeID] [int] NULL,
	[QuerySortFields] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AdvQuery] PRIMARY KEY CLUSTERED 
(
	[zw_pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
