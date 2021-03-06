/****** Object:  Table [dbo].[Journal]    Script Date: 5/15/2018 12:06:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Journal](
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
	[JournalActivityType] [int] NULL,
	[JournalActivityText] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[PartID] [int] NULL,
	[ActivityType] [int] NULL,
	[ActivityTypeText] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsBillable] [bit] NULL,
	[BillableDateTime] [datetime] NULL,
	[UseActualTime] [bit] NULL,
	[BillingNotes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingType] [int] NULL,
	[TotalBilledTime] [float] NULL,
	[RecurringActivityID] [int] NULL,
	[LinkID] [int] NULL,
	[LinkStoreID] [int] NULL,
	[LinkClassTypeID] [int] NULL,
	[SpecialCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionID] [int] NULL,
	[HasCalendarLinks] [bit] NULL,
	[TipRecipientID] [int] NULL,
	[PartClassTypeID] [int] NULL,
	[RecurringClassTypeID] [int] NULL,
	[StationID] [int] NULL,
	[StationClassTypeID] [int] NULL,
	[CurrentState] [int] NULL,
	[StageID] [int] NULL,
	[StageClassTypeID] [int] NULL,
 CONSTRAINT [Journal_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_Journal_AccountID]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Index_Journal_AccountID] ON [dbo].[Journal]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Journal_CompletedByID]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Index_Journal_CompletedByID] ON [dbo].[Journal]
(
	[CompletedByID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Journal_ContactID]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Index_Journal_ContactID] ON [dbo].[Journal]
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Journal_EndDateTime]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Index_Journal_EndDateTime] ON [dbo].[Journal]
(
	[EndDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Journal_JournalActivityType]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Index_Journal_JournalActivityType] ON [dbo].[Journal]
(
	[JournalActivityType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Journal_StartDateTime]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Index_Journal_StartDateTime] ON [dbo].[Journal]
(
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Journal_SummaryID]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Index_Journal_SummaryID] ON [dbo].[Journal]
(
	[SummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Journal_TransactionID]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Index_Journal_TransactionID] ON [dbo].[Journal]
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_Journal]    Script Date: 5/15/2018 12:06:48 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_Journal] ON [dbo].[Journal]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
