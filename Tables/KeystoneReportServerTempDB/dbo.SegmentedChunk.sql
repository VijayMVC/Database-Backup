/****** Object:  Table [dbo].[SegmentedChunk]    Script Date: 5/15/2018 12:02:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SegmentedChunk](
	[ChunkId] [uniqueidentifier] NOT NULL,
	[SnapshotDataId] [uniqueidentifier] NOT NULL,
	[ChunkFlags] [tinyint] NOT NULL,
	[ChunkName] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ChunkType] [int] NOT NULL,
	[Version] [smallint] NOT NULL,
	[MimeType] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Machine] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[SegmentedChunkId] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SegmentedChunk] PRIMARY KEY CLUSTERED 
(
	[SegmentedChunkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_ChunkId_SnapshotDataId]    Script Date: 5/15/2018 12:02:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChunkId_SnapshotDataId] ON [dbo].[SegmentedChunk]
(
	[ChunkId] ASC,
	[SnapshotDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [UNIQ_SnapshotChunkMapping]    Script Date: 5/15/2018 12:02:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UNIQ_SnapshotChunkMapping] ON [dbo].[SegmentedChunk]
(
	[SnapshotDataId] ASC,
	[ChunkType] ASC,
	[ChunkName] ASC
)
INCLUDE ( 	[ChunkFlags],
	[ChunkId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[SegmentedChunk] ADD  CONSTRAINT [DF_SegmentedChunk_ChunkId]  DEFAULT (newsequentialid()) FOR [ChunkId]
GO
