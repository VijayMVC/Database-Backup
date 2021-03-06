/****** Object:  Table [dbo].[ExecutionCache]    Script Date: 5/15/2018 12:02:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ExecutionCache](
	[ExecutionCacheID] [uniqueidentifier] NOT NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[ExpirationFlags] [int] NOT NULL,
	[AbsoluteExpiration] [datetime] NULL,
	[RelativeExpiration] [int] NULL,
	[SnapshotDataID] [uniqueidentifier] NOT NULL,
	[LastUsedTime] [datetime] NOT NULL,
	[ParamsHash] [int] NOT NULL,
 CONSTRAINT [PK_ExecutionCache] PRIMARY KEY NONCLUSTERED 
(
	[ExecutionCacheID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_ExecutionCache]    Script Date: 5/15/2018 12:02:25 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_ExecutionCache] ON [dbo].[ExecutionCache]
(
	[AbsoluteExpiration] DESC,
	[ReportID] ASC,
	[SnapshotDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_CacheLookup]    Script Date: 5/15/2018 12:02:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_CacheLookup] ON [dbo].[ExecutionCache]
(
	[ReportID] ASC,
	[ParamsHash] ASC,
	[AbsoluteExpiration] DESC
)
INCLUDE ( 	[SnapshotDataID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_SnapshotDataID]    Script Date: 5/15/2018 12:02:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_SnapshotDataID] ON [dbo].[ExecutionCache]
(
	[SnapshotDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[ExecutionCache] ADD  DEFAULT (getdate()) FOR [LastUsedTime]
ALTER TABLE [dbo].[ExecutionCache] ADD  DEFAULT ((0)) FOR [ParamsHash]
GO
