/****** Object:  Table [dbo].[RecycleBin]    Script Date: 5/15/2018 12:05:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RecycleBin](
	[SiteId] [uniqueidentifier] NOT NULL,
	[WebId] [uniqueidentifier] NOT NULL,
	[BinId] [tinyint] NOT NULL,
	[DeleteUserId] [int] NOT NULL,
	[DeleteTransactionId] [varbinary](16) NOT NULL,
	[DeleteDate] [datetime] NOT NULL,
	[ItemType] [tinyint] NOT NULL,
	[ListId] [uniqueidentifier] NULL,
	[DocId] [uniqueidentifier] NULL,
	[DocVersionId] [int] NULL,
	[ListItemId] [int] NULL,
	[Title] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[DirName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[LeafName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[AuthorId] [int] NULL,
	[Size] [bigint] NOT NULL,
	[ListDirName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ScopeId] [uniqueidentifier] NULL,
	[ProgId] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [RecycleBin_PK]    Script Date: 5/15/2018 12:05:43 PM ******/
CREATE UNIQUE CLUSTERED INDEX [RecycleBin_PK] ON [dbo].[RecycleBin]
(
	[SiteId] ASC,
	[WebId] ASC,
	[BinId] ASC,
	[DeleteUserId] ASC,
	[DeleteTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [RecycleBin_ListTransactionId]    Script Date: 5/15/2018 12:05:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RecycleBin_ListTransactionId] ON [dbo].[RecycleBin]
(
	[ListId] ASC,
	[DeleteTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [RecycleBin_TransactionId]    Script Date: 5/15/2018 12:05:43 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RecycleBin_TransactionId] ON [dbo].[RecycleBin]
(
	[DeleteTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[RecycleBin] ADD  DEFAULT (NULL) FOR [ProgId]
GO
