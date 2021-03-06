/****** Object:  Table [dbo].[MSSCrawlURL]    Script Date: 5/15/2018 12:05:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSCrawlURL](
	[DocID] [int] NOT NULL,
	[StartAddressID] [int] NOT NULL,
	[ContentSourceID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[CrawlID] [int] NOT NULL,
	[CommitCrawlID] [int] NOT NULL,
	[AccessURL] [nvarchar](1500) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[AccessHash] [int] NOT NULL,
	[CompactURL] [nvarchar](40) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[CompactHash] [int] NULL,
	[DisplayURL] [nvarchar](1500) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[DisplayHash] [int] NOT NULL,
	[TransactionFlags] [int] NOT NULL,
	[HostDepth] [int] NOT NULL,
	[EnumerationDepth] [int] NOT NULL,
	[ParentDocID] [int] NOT NULL,
	[UseChangeLog] [int] NOT NULL,
	[ChangeLogCookie] [nvarchar](200) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[IndexType] [int] NOT NULL,
	[MD5] [int] NOT NULL,
	[PropMD5] [int] NOT NULL,
	[Retry] [int] NOT NULL,
	[LastModifiedTime] [bigint] NOT NULL,
	[FolderDelCount] [int] NOT NULL,
	[LCID] [int] NOT NULL,
	[ParentUpdateCrawlID] [int] NOT NULL,
	[DeletePending] [int] NOT NULL,
	[EndPathFlag] [int] NOT NULL,
	[HostID] [int] NOT NULL,
	[ErrorID] [int] NOT NULL,
	[ErrorLevel] [int] NOT NULL,
	[LastTouchStart] [datetime] NULL,
	[LastTouchEnd] [datetime] NULL,
	[ErrorCount] [int] NOT NULL,
	[ErrorDesc] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DocPropsMD5] [bigint] NOT NULL,
	[CrawlScope] [int] NOT NULL,
	[FolderHighPriority] [int] NOT NULL,
	[ItemHighPriority] [int] NOT NULL,
	[SecurityUpdateErrorID] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSCrawlURL_DocID]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_MSSCrawlURL_DocID] ON [dbo].[MSSCrawlURL]
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlURL_CompactHash]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlURL_CompactHash] ON [dbo].[MSSCrawlURL]
(
	[CompactHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlURL_ContentSourceID]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlURL_ContentSourceID] ON [dbo].[MSSCrawlURL]
(
	[ContentSourceID] ASC,
	[LastTouchStart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlURL_ErrorId]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlURL_ErrorId] ON [dbo].[MSSCrawlURL]
(
	[ErrorLevel] ASC,
	[ErrorID] ASC,
	[ProjectID] ASC,
	[CommitCrawlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlURL_HostID]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlURL_HostID] ON [dbo].[MSSCrawlURL]
(
	[HostID] ASC,
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlURL_ParentDocID]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlURL_ParentDocID] ON [dbo].[MSSCrawlURL]
(
	[ParentDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlURL_StartAddressID]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlURL_StartAddressID] ON [dbo].[MSSCrawlURL]
(
	[StartAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSCrawlURL_Time]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawlURL_Time] ON [dbo].[MSSCrawlURL]
(
	[LastTouchStart] ASC,
	[HostID] ASC,
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSURLHistory_AccessHash]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSURLHistory_AccessHash] ON [dbo].[MSSCrawlURL]
(
	[AccessHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_MSSURLHistory_DisplayHash]    Script Date: 5/15/2018 12:05:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSURLHistory_DisplayHash] ON [dbo].[MSSCrawlURL]
(
	[DisplayHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_CrawlID]  DEFAULT ((0)) FOR [CrawlID]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_CommitCrawlID]  DEFAULT ((0)) FOR [CommitCrawlID]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_CompactHash]  DEFAULT ((0)) FOR [CompactHash]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_TransactionFlags]  DEFAULT ((0)) FOR [TransactionFlags]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_HostDepth]  DEFAULT ((0)) FOR [HostDepth]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_EnumerationDepth]  DEFAULT ((0)) FOR [EnumerationDepth]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_ParentDocID]  DEFAULT ((0)) FOR [ParentDocID]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_UseChangeLog]  DEFAULT ((0)) FOR [UseChangeLog]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_IndexType]  DEFAULT ((0)) FOR [IndexType]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_MD5]  DEFAULT ((0)) FOR [MD5]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_PropMD5]  DEFAULT ((0)) FOR [PropMD5]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_Retry]  DEFAULT ((0)) FOR [Retry]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_LastModifiedTime]  DEFAULT ((0)) FOR [LastModifiedTime]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_FolderDelCount]  DEFAULT ((0)) FOR [FolderDelCount]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_LCID]  DEFAULT ((0)) FOR [LCID]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_ParentUpdateCrawlID]  DEFAULT ((0)) FOR [ParentUpdateCrawlID]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_DeletePending]  DEFAULT ((0)) FOR [DeletePending]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_EndPathID]  DEFAULT ((0)) FOR [EndPathFlag]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_ErrorID]  DEFAULT ((0)) FOR [ErrorID]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_ErrorCount]  DEFAULT ((0)) FOR [ErrorCount]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_DocPropsMD5]  DEFAULT ((0)) FOR [DocPropsMD5]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_CrawlScope]  DEFAULT ((0)) FOR [CrawlScope]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_FolderHighPriority]  DEFAULT ((0)) FOR [FolderHighPriority]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_ItemHighPriority]  DEFAULT ((0)) FOR [ItemHighPriority]
ALTER TABLE [dbo].[MSSCrawlURL] ADD  CONSTRAINT [DF_MSSCrawlURL_SecurityUpdateErrorID]  DEFAULT ((0)) FOR [SecurityUpdateErrorID]
GO
