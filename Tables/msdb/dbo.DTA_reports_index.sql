/****** Object:  Table [dbo].[DTA_reports_index]    Script Date: 5/15/2018 12:02:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[DTA_reports_index](
	[IndexID] [int] IDENTITY(1,1) NOT NULL,
	[TableID] [int] NOT NULL,
	[IndexName] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsClustered] [bit] NOT NULL,
	[IsUnique] [bit] NOT NULL,
	[IsHeap] [bit] NOT NULL,
	[IsExisting] [bit] NOT NULL,
	[IsFiltered] [bit] NOT NULL,
	[Storage] [float] NOT NULL,
	[NumRows] [bigint] NOT NULL,
	[IsRecommended] [bit] NOT NULL,
	[RecommendedStorage] [float] NOT NULL,
	[PartitionSchemeID] [int] NULL,
	[SessionUniquefier] [int] NULL,
	[FilterDefinition] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IndexID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [DTA_reports_indexindex]    Script Date: 5/15/2018 12:02:55 PM ******/
CREATE NONCLUSTERED INDEX [DTA_reports_indexindex] ON [dbo].[DTA_reports_index]
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
/****** Object:  Index [DTA_reports_indexindex2]    Script Date: 5/15/2018 12:02:55 PM ******/
CREATE NONCLUSTERED INDEX [DTA_reports_indexindex2] ON [dbo].[DTA_reports_index]
(
	[PartitionSchemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
ALTER TABLE [dbo].[DTA_reports_index] ADD  DEFAULT ((0)) FOR [IsClustered]
ALTER TABLE [dbo].[DTA_reports_index] ADD  DEFAULT ((0)) FOR [IsUnique]
ALTER TABLE [dbo].[DTA_reports_index] ADD  DEFAULT ((1)) FOR [IsHeap]
ALTER TABLE [dbo].[DTA_reports_index] ADD  DEFAULT ((1)) FOR [IsExisting]
ALTER TABLE [dbo].[DTA_reports_index] ADD  DEFAULT ((0)) FOR [IsFiltered]
ALTER TABLE [dbo].[DTA_reports_index] ADD  DEFAULT ((0)) FOR [IsRecommended]
ALTER TABLE [dbo].[DTA_reports_index]  WITH NOCHECK ADD FOREIGN KEY([TableID])
REFERENCES [dbo].[DTA_reports_table] ([TableID])
ON DELETE CASCADE
GO
