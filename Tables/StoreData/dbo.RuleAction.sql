/****** Object:  Table [dbo].[RuleAction]    Script Date: 5/15/2018 12:06:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RuleAction](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ActionName] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AllowUserToCancel] [bit] NULL,
	[ChildItemID] [int] NULL,
	[ChildItemStoreID] [int] NULL,
	[ChildItemClassTypeID] [int] NULL,
	[ClearUserField] [bit] NULL,
	[GroupAction] [bit] NULL,
	[MessageText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentID] [int] NULL,
	[ParentStoreID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[SetOnlyIfBlank] [bit] NULL,
	[SaveRecord] [bit] NULL,
	[SortIndex] [float] NULL,
	[UserFieldDataType] [int] NULL,
	[UserFieldName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserFieldValue] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Category] [int] NULL,
	[UserFieldSetValue] [bit] NULL,
	[TextAppendOptions] [int] NULL,
	[UseCurrentDate] [bit] NULL,
	[FixedDaysOffset] [int] NULL,
	[UseCurrentTime] [bit] NULL,
	[FixedTime] [float] NULL,
	[ExecuteAsGroup] [bit] NULL,
	[Preview] [bit] NULL,
	[ContactReplacementType] [int] NULL,
	[EmployeeReplacementType] [int] NULL,
	[ReplaceCustomer] [bit] NULL,
	[ReplaceTransaction] [bit] NULL,
	[TransactionType] [int] NULL,
	[DelActivityOnStatusChange] [bit] NULL,
	[DateOffsetType] [int] NULL,
	[DateType] [int] NULL,
	[ReplaceContract] [bit] NULL,
	[ServiceContractID] [int] NULL,
	[OffsetBeforeDate] [bit] NULL,
	[ReplaceStatusID] [int] NULL,
	[ReplaceDispositionID] [int] NULL,
	[ReplaceDisposition] [bit] NULL,
	[StationID] [int] NULL,
	[StationClassTypeID] [int] NULL,
	[ReplaceStation] [bit] NULL,
	[StageID] [int] NULL,
	[StageClassTypeID] [int] NULL,
 CONSTRAINT [RuleAction_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_RuleAction_ChildItemID]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Index_RuleAction_ChildItemID] ON [dbo].[RuleAction]
(
	[ChildItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_RuleAction_ParentID]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Index_RuleAction_ParentID] ON [dbo].[RuleAction]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_RuleAction_StageID]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Index_RuleAction_StageID] ON [dbo].[RuleAction]
(
	[StageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_RuleAction_StationID]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Index_RuleAction_StationID] ON [dbo].[RuleAction]
(
	[StationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Indexes_RuleAction]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_RuleAction] ON [dbo].[RuleAction]
(
	[ActionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
