/****** Object:  Table [dbo].[RuleMacro]    Script Date: 5/15/2018 11:58:55 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RuleMacro](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[CategoryType] [int] NULL,
	[AutoTriggerType] [int] NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FilterCondition] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FilterConditionType] [int] NULL,
	[FilterType] [int] NULL,
	[OwnsQuery] [bit] NULL,
	[QueryID] [int] NULL,
	[ParentID] [int] NULL,
	[ParentStoreID] [int] NULL,
	[QueryStoreID] [int] NULL,
	[QueryClassTypeID] [int] NULL,
	[ProceedCondition] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProceedConditionType] [int] NULL,
	[ProceedType] [int] NULL,
	[RuleDataSource] [int] NULL,
	[RuleName] [nvarchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecurityRightID] [int] NULL,
	[RuleExecuteType] [int] NULL,
	[SQLQuery] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IndirectTriggerType] [int] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_RuleMacro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
