/****** Object:  Table [dbo].[ChunkData]    Script Date: 5/15/2018 12:05:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ChunkData](
	[ChunkID] [uniqueidentifier] NOT NULL,
	[SnapshotDataID] [uniqueidentifier] NOT NULL,
	[ChunkFlags] [tinyint] NULL,
	[ChunkName] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ChunkType] [int] NULL,
	[Version] [smallint] NULL,
	[MimeType] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Content] [image] NULL,
 CONSTRAINT [PK_ChunkData] PRIMARY KEY NONCLUSTERED 
(
	[ChunkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_ChunkData]    Script Date: 5/15/2018 12:05:05 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_ChunkData] ON [dbo].[ChunkData]
(
	[SnapshotDataID] ASC,
	[ChunkType] ASC,
	[ChunkName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
