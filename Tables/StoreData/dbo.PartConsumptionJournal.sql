/****** Object:  Table [dbo].[PartConsumptionJournal]    Script Date: 5/15/2018 12:06:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PartConsumptionJournal](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[EmployeeID] [int] NULL,
	[PartConsumptionActivityType] [int] NULL,
	[PartConsumptionActivityText] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[TotalTime] [datetime] NULL,
	[ScheduledDateTime] [datetime] NULL,
	[CompletedByID] [int] NULL,
	[CompletedDateTime] [datetime] NULL,
	[IsSummary] [bit] NULL,
	[IsDetail] [bit] NULL,
	[SummaryID] [int] NULL,
	[SummaryClassTypeID] [int] NULL,
	[SummaryAmount] [decimal](18, 4) NULL,
	[DetailAmount] [decimal](18, 4) NULL,
	[StartGLGroupID] [int] NULL,
	[EndGLGroupID] [int] NULL,
	[AccountID] [int] NULL,
	[AccountClassTypeID] [int] NULL,
	[ContactID] [int] NULL,
	[ContactClassTypeID] [int] NULL,
	[TransactionID] [int] NULL,
	[TransactionClassTypeID] [int] NULL,
	[IsVoided] [bit] NULL,
	[VoidedDateTime] [datetime] NULL,
	[VoidedEntryID] [int] NULL,
	[VoidedEntryClassTypeID] [int] NULL,
	[VoidedReason] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[QueryStartDateTime] [datetime] NULL,
	[QueryEndDateTime] [datetime] NULL,
	[ReminderDateTime] [datetime] NULL,
	[ReminderPrompt] [bit] NULL,
 CONSTRAINT [PartConsumptionJournal_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_PartConsumptionJournal_AccountID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartConsumptionJournal_AccountID] ON [dbo].[PartConsumptionJournal]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartConsumptionJournal_ContactID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartConsumptionJournal_ContactID] ON [dbo].[PartConsumptionJournal]
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartConsumptionJournal_EndDateTime]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartConsumptionJournal_EndDateTime] ON [dbo].[PartConsumptionJournal]
(
	[EndDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartConsumptionJournal_EndGLGroupID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartConsumptionJournal_EndGLGroupID] ON [dbo].[PartConsumptionJournal]
(
	[EndGLGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartConsumptionJournal_StartDateTime]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartConsumptionJournal_StartDateTime] ON [dbo].[PartConsumptionJournal]
(
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartConsumptionJournal_StartGLGroupID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartConsumptionJournal_StartGLGroupID] ON [dbo].[PartConsumptionJournal]
(
	[StartGLGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartConsumptionJournal_SummaryID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartConsumptionJournal_SummaryID] ON [dbo].[PartConsumptionJournal]
(
	[SummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartConsumptionJournal_TransactionID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartConsumptionJournal_TransactionID] ON [dbo].[PartConsumptionJournal]
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_PartConsumptionJournal]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_PartConsumptionJournal] ON [dbo].[PartConsumptionJournal]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
