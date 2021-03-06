/****** Object:  Table [dbo].[ScheduledPayment]    Script Date: 5/15/2018 12:06:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ScheduledPayment](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[TransactionID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[ScheduledDate] [datetime] NULL,
	[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Amount] [float] NULL,
	[Attempts] [int] NULL,
	[Results] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsComplete] [bit] NULL,
	[CompletedDate] [datetime] NULL,
	[CompletedPaymentID] [int] NULL,
 CONSTRAINT [ScheduledPayment_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_ScheduledPayment_siScheduledPayment_CompletedPaymentID]    Script Date: 5/15/2018 12:06:55 PM ******/
CREATE NONCLUSTERED INDEX [Index_ScheduledPayment_siScheduledPayment_CompletedPaymentID] ON [dbo].[ScheduledPayment]
(
	[CompletedPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_ScheduledPayment_siScheduledPayment_TransactionID]    Script Date: 5/15/2018 12:06:55 PM ******/
CREATE NONCLUSTERED INDEX [Index_ScheduledPayment_siScheduledPayment_TransactionID] ON [dbo].[ScheduledPayment]
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
