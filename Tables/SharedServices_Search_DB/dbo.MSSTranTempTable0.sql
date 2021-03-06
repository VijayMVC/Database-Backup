/****** Object:  Table [dbo].[MSSTranTempTable0]    Script Date: 5/15/2018 12:05:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSTranTempTable0](
	[CrawlID] [int] NOT NULL,
	[SourceDocID] [int] NOT NULL,
	[DocID] [int] NOT NULL,
	[StartAddressID] [int] NOT NULL,
	[ContentSourceID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[AccessURL] [nvarchar](1500) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[AccessHash] [int] NOT NULL,
	[CompactURL] [nvarchar](40) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[CompactHash] [int] NULL,
	[ParentCompactURL] [nvarchar](40) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ParentCompactHash] [int] NULL,
	[DisplayURL] [nvarchar](1500) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[DisplayHash] [int] NOT NULL,
	[Host] [nvarchar](300) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[hrResult] [int] NOT NULL,
	[AnchorText] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[FirstLink] [int] NOT NULL,
	[TransactionType] [int] NOT NULL,
	[Scope] [int] NOT NULL,
	[ItemType] [int] NOT NULL,
	[TransactionFlags] [int] NOT NULL,
	[HostDepth] [int] NOT NULL,
	[EnumerationDepth] [int] NOT NULL,
	[UseChangeLog] [int] NOT NULL,
	[IndexType] [int] NOT NULL,
	[ChangeLogBatchID] [int] NOT NULL,
	[FolderHighPriority] [int] NOT NULL,
	[ItemHighPriority] [int] NOT NULL,
	[SeqID] [bigint] NOT NULL,
	[LCID] [int] NOT NULL,
	[EndPathFlag] [int] NOT NULL,
	[PropMD5] [int] NOT NULL,
	[LastModifiedTime] [bigint] NOT NULL,
	[ProtocolSwitch] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSTranTempTable0_AccessHash]    Script Date: 5/15/2018 12:05:29 PM ******/
CREATE CLUSTERED INDEX [IX_MSSTranTempTable0_AccessHash] ON [dbo].[MSSTranTempTable0]
(
	[AccessHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSTranTempTable0_CrawlID]    Script Date: 5/15/2018 12:05:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSTranTempTable0_CrawlID] ON [dbo].[MSSTranTempTable0]
(
	[CrawlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSTranTempTable0_ItemType]    Script Date: 5/15/2018 12:05:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSTranTempTable0_ItemType] ON [dbo].[MSSTranTempTable0]
(
	[ItemType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSTranTempTable0_SourceDocID]    Script Date: 5/15/2018 12:05:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSTranTempTable0_SourceDocID] ON [dbo].[MSSTranTempTable0]
(
	[SourceDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSTranTempTable0] ADD  CONSTRAINT [DF_MSSTranTempTable0_FolderHighPriority]  DEFAULT ((0)) FOR [FolderHighPriority]
ALTER TABLE [dbo].[MSSTranTempTable0] ADD  CONSTRAINT [DF_MSSTranTempTable0_ItemHighPriority]  DEFAULT ((0)) FOR [ItemHighPriority]
ALTER TABLE [dbo].[MSSTranTempTable0] ADD  CONSTRAINT [DF_MSSTranTempTableMain0_EndPathFlag]  DEFAULT ((0)) FOR [EndPathFlag]
GO
