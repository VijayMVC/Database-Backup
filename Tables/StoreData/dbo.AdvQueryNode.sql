/****** Object:  Table [dbo].[AdvQueryNode]    Script Date: 5/15/2018 12:06:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AdvQueryNode](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[NodeText] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[ImageIndex] [int] NULL,
	[SortIndex] [int] NULL,
	[NodeTableType] [int] NULL,
	[NodeTableName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefinitionDisplayString] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstanceDisplayString] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Operator] [int] NULL,
	[FieldName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldAggrFunc] [int] NULL,
	[FieldAliasName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldSelectionIndex] [int] NULL,
	[FieldOrderByIndex] [int] NULL,
	[Value1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Value2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseRelativeDate] [bit] NULL,
	[InputOption] [int] NULL,
	[BuilderOptions] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SpawnIntoParentCategory] [bit] NULL,
	[QueryFieldNameForDisplay] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QueryFieldNameForValue1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QueryFieldNameForValue2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VirtualQueryName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CriteriaType] [int] NULL,
	[CriteriaImageIndex] [int] NULL,
	[GroupID] [int] NULL,
	[ValueFormat] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldFormat] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

/****** Object:  Index [AdvQueryNode_PK]    Script Date: 5/15/2018 12:06:41 PM ******/
CREATE UNIQUE CLUSTERED INDEX [AdvQueryNode_PK] ON [dbo].[AdvQueryNode]
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
