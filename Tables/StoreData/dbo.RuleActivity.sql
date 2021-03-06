/****** Object:  Table [dbo].[RuleActivity]    Script Date: 5/15/2018 12:06:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RuleActivity](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[AutoRollOver] [bit] NULL,
	[AutoRun] [bit] NULL,
	[Color] [int] NULL,
	[CreatedByID] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[ImageID] [int] NULL,
	[IsFromRecurring] [bit] NULL,
	[IsTimeless] [bit] NULL,
	[OriginalScheduledDateTime] [datetime] NULL,
	[Priority] [int] NULL,
	[PriorityText] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrivateEvent] [bit] NULL,
	[RecurringActivityID] [int] NULL,
	[RunWithoutPrompting] [bit] NULL,
	[ScheduledEndDateTime] [datetime] NULL,
	[ScheduledStartDateTime] [datetime] NULL,
	[RuleID] [int] NULL,
	[RuleStoreID] [int] NULL,
	[RuleClassTypeID] [int] NULL,
 CONSTRAINT [RuleActivity_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_RuleActivity_RuleID]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [Index_RuleActivity_RuleID] ON [dbo].[RuleActivity]
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [ndexes_RuleActivity]    Script Date: 5/15/2018 12:06:54 PM ******/
CREATE NONCLUSTERED INDEX [ndexes_RuleActivity] ON [dbo].[RuleActivity]
(
	[CreatedByID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
