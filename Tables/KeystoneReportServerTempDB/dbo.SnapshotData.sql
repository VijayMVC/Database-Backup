/****** Object:  Table [dbo].[SnapshotData]    Script Date: 5/15/2018 12:02:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SnapshotData](
	[SnapshotDataID] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ParamsHash] [int] NULL,
	[QueryParams] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EffectiveParams] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Description] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DependsOnUser] [bit] NULL,
	[PermanentRefcount] [int] NOT NULL,
	[TransientRefcount] [int] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[PageCount] [int] NULL,
	[HasDocMap] [bit] NULL,
	[Machine] [nvarchar](512) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[PaginationMode] [smallint] NULL,
	[ProcessingFlags] [int] NULL,
	[IsCached] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_SnapshotData]    Script Date: 5/15/2018 12:02:26 PM ******/
CREATE CLUSTERED INDEX [IX_SnapshotData] ON [dbo].[SnapshotData]
(
	[SnapshotDataID] ASC,
	[ParamsHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IS_SnapshotExpiration]    Script Date: 5/15/2018 12:02:26 PM ******/
CREATE NONCLUSTERED INDEX [IS_SnapshotExpiration] ON [dbo].[SnapshotData]
(
	[PermanentRefcount] ASC,
	[ExpirationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_SnapshotCleaning]    Script Date: 5/15/2018 12:02:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_SnapshotCleaning] ON [dbo].[SnapshotData]
(
	[PermanentRefcount] ASC,
	[TransientRefcount] ASC
)
INCLUDE ( 	[Machine]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[SnapshotData] ADD  DEFAULT ((0)) FOR [IsCached]
GO
