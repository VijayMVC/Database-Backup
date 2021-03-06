/****** Object:  Table [dbo].[ContentTypeUsage]    Script Date: 5/15/2018 12:05:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ContentTypeUsage](
	[SiteId] [uniqueidentifier] NOT NULL,
	[ContentTypeId] [dbo].[tContentTypeId] NOT NULL,
	[WebId] [uniqueidentifier] NULL,
	[ListId] [uniqueidentifier] NULL,
	[IsFieldId] [bit] NULL,
	[Class] [bit] NOT NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [pk_ContentTypeUsage]    Script Date: 5/15/2018 12:05:34 PM ******/
CREATE CLUSTERED INDEX [pk_ContentTypeUsage] ON [dbo].[ContentTypeUsage]
(
	[SiteId] ASC,
	[Class] ASC,
	[ContentTypeId] ASC,
	[WebId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_ListOnContentTypeUsage]    Script Date: 5/15/2018 12:05:34 PM ******/
CREATE NONCLUSTERED INDEX [idx_ListOnContentTypeUsage] ON [dbo].[ContentTypeUsage]
(
	[SiteId] ASC,
	[Class] ASC,
	[WebId] ASC,
	[ListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[ContentTypeUsage] ADD  DEFAULT ((0)) FOR [IsFieldId]
ALTER TABLE [dbo].[ContentTypeUsage] ADD  DEFAULT ((1)) FOR [Class]
GO
