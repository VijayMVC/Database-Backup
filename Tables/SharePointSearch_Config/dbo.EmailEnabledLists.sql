/****** Object:  Table [dbo].[EmailEnabledLists]    Script Date: 5/15/2018 12:06:06 PM ******/
SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EmailEnabledLists](
	[Alias] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[WebId] [uniqueidentifier] NOT NULL,
	[ListId] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_EmailEnabledLists] PRIMARY KEY CLUSTERED 
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_EmailEnabledLists_ListId]    Script Date: 5/15/2018 12:06:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmailEnabledLists_ListId] ON [dbo].[EmailEnabledLists]
(
	[SiteId] ASC,
	[WebId] ASC,
	[ListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[EmailEnabledLists] ADD  DEFAULT ((0)) FOR [Deleted]
GO
