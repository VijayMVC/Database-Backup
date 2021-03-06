/****** Object:  Table [dbo].[MSSAnchorText]    Script Date: 5/15/2018 12:05:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSAnchorText](
	[SourceDocID] [int] NULL,
	[TargetDocID] [int] NULL,
	[LinkHashNew]  AS (binary_checksum([Link])),
	[LinkHash] [int] NULL,
	[Link] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LCID] [int] NULL,
	[LinkId] [int] IDENTITY(1,1) NOT NULL,
	[AnchorTextHash]  AS (binary_checksum([AnchorText])),
	[AnchorText] [nvarchar](1024) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[MarkDirty] [tinyint] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_AnchorTextFrom]    Script Date: 5/15/2018 12:05:23 PM ******/
CREATE CLUSTERED INDEX [IX_AnchorTextFrom] ON [dbo].[MSSAnchorText]
(
	[SourceDocID] ASC,
	[LinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_AnchorText_EnumOrder]    Script Date: 5/15/2018 12:05:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnchorText_EnumOrder] ON [dbo].[MSSAnchorText]
(
	[TargetDocID] ASC,
	[LinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_Link]    Script Date: 5/15/2018 12:05:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Link] ON [dbo].[MSSAnchorText]
(
	[LinkHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[MSSAnchorText] ADD  CONSTRAINT [DF_AnchorText_MarkDirty]  DEFAULT ((0)) FOR [MarkDirty]
GO
