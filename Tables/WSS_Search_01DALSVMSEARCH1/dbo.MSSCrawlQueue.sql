/****** Object:  Table [dbo].[MSSCrawlQueue]    Script Date: 5/15/2018 12:09:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSCrawlQueue](
	[SeqID] [bigint] IDENTITY(1,1) NOT NULL,
	[CrawlID] [int] NOT NULL,
	[StartAddressID] [int] NOT NULL,
	[DocID] [int] NOT NULL,
	[TransactionType] [int] NOT NULL,
	[Scope] [int] NOT NULL,
	[TransactionFlags] [int] NOT NULL,
	[HostDepth] [int] NOT NULL,
	[EnumerationDepth] [int] NOT NULL,
	[SourceDocID] [int] NOT NULL,
	[ChangeLogBatchID] [int] NOT NULL,
	[BatchID] [bigint] NOT NULL,
	[ItemType] [int] NOT NULL,
	[FolderHighPriority] [int] NOT NULL,
	[ItemHighPriority] [int] NOT NULL,
	[Priority] [int] NULL,
	[ContentSourceID] [int] NULL,
	[ProjectID] [int] NULL,
	[DeleteReason] [int] NULL,
	[ErrorID] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSCrawlQueue_Cluster]    Script Date: 5/15/2018 12:09:08 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_MSSCrawlQueue_Cluster] ON [dbo].[MSSCrawlQueue]
(
	[CrawlID] ASC,
	[FolderHighPriority] ASC,
	[ItemHighPriority] ASC,
	[SeqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlQueue]    Script Date: 5/15/2018 12:09:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MSSCrawlQueue] ON [dbo].[MSSCrawlQueue]
(
	[CrawlID] ASC,
	[DocID] ASC,
	[TransactionType] ASC,
	[Scope] ASC,
	[TransactionFlags] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlQueue_CrawlBatch]    Script Date: 5/15/2018 12:09:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlQueue_CrawlBatch] ON [dbo].[MSSCrawlQueue]
(
	[CrawlID] ASC,
	[BatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlQueue_DocID]    Script Date: 5/15/2018 12:09:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlQueue_DocID] ON [dbo].[MSSCrawlQueue]
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlQueue_SeqID]    Script Date: 5/15/2018 12:09:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MSSCrawlQueue_SeqID] ON [dbo].[MSSCrawlQueue]
(
	[SeqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSCrawlQueue] ADD  CONSTRAINT [DF_MSSCrawlQueue_TransactionType]  DEFAULT ((1)) FOR [TransactionType]
ALTER TABLE [dbo].[MSSCrawlQueue] ADD  CONSTRAINT [DF_MSSCrawlQueue_SourceDocID]  DEFAULT ((0)) FOR [SourceDocID]
ALTER TABLE [dbo].[MSSCrawlQueue] ADD  CONSTRAINT [DF_MSSCrawlQueue_ChangeLogBatchID]  DEFAULT ((0)) FOR [ChangeLogBatchID]
ALTER TABLE [dbo].[MSSCrawlQueue] ADD  CONSTRAINT [DF_MSSCrawlQueue_AcquiredID]  DEFAULT ((0)) FOR [BatchID]
ALTER TABLE [dbo].[MSSCrawlQueue] ADD  CONSTRAINT [DF_MSSCrawlQueue_FolderHighPriority]  DEFAULT ((0)) FOR [FolderHighPriority]
ALTER TABLE [dbo].[MSSCrawlQueue] ADD  CONSTRAINT [DF_MSSCrawlQueue_ItemHighPriority]  DEFAULT ((0)) FOR [ItemHighPriority]
GO
