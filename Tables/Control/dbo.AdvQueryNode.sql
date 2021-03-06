/****** Object:  Table [dbo].[AdvQueryNode]    Script Date: 5/15/2018 11:58:48 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AdvQueryNode](
	[ID] [int] NULL,
	[StoreID] [int] NULL,
	[ClassTypeID] [int] NULL,
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
	[FieldFormat] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AdvQueryNode] PRIMARY KEY CLUSTERED 
(
	[zw_pk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
