/****** Object:  Table [dbo].[MSSCrawledProperties]    Script Date: 5/15/2018 12:09:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSCrawledProperties](
	[CrawledPropertyId] [int] IDENTITY(1,1) NOT NULL,
	[Propset] [uniqueidentifier] NOT NULL,
	[PropertyName] [nvarchar](440) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[PropertyNameIsEnum] [bit] NOT NULL,
	[IsMappedToContent] [bit] NOT NULL,
	[IsSampleCacheFull] [bit] NOT NULL,
	[IsTextChunkProp] [bit] NOT NULL,
	[IsValueChunkProp] [bit] NOT NULL,
	[VariantType] [int] NOT NULL,
	[URIHash]  AS (binary_checksum([URI])),
	[URI] [nvarchar](2048) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LastModified] [datetime] NULL,
 CONSTRAINT [PK_MSSCrawledProperties] PRIMARY KEY CLUSTERED 
(
	[Propset] ASC,
	[PropertyName] ASC,
	[VariantType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_MSSCrawledProperties_CID]    Script Date: 5/15/2018 12:09:07 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MSSCrawledProperties_CID] ON [dbo].[MSSCrawledProperties]
(
	[CrawledPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_MSSCrawledProperties_PropName]    Script Date: 5/15/2018 12:09:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSCrawledProperties_PropName] ON [dbo].[MSSCrawledProperties]
(
	[PropertyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[MSSCrawledProperties] ADD  DEFAULT ((0)) FOR [IsSampleCacheFull]
ALTER TABLE [dbo].[MSSCrawledProperties] ADD  DEFAULT ((0)) FOR [IsTextChunkProp]
ALTER TABLE [dbo].[MSSCrawledProperties] ADD  DEFAULT ((0)) FOR [IsValueChunkProp]
ALTER TABLE [dbo].[MSSCrawledProperties] ADD  DEFAULT ('2000-01-01 01:01:01.000') FOR [LastModified]
ALTER TABLE [dbo].[MSSCrawledProperties]  WITH CHECK ADD  CONSTRAINT [FK_MSSCrawledProperties_Propset] FOREIGN KEY([Propset])
REFERENCES [dbo].[MSSCrawledPropCategory] ([Propset])
ALTER TABLE [dbo].[MSSCrawledProperties] CHECK CONSTRAINT [FK_MSSCrawledProperties_Propset]
GO
