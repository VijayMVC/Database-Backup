/****** Object:  Table [dbo].[WebPartLists]    Script Date: 5/15/2018 12:06:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[WebPartLists](
	[tp_SiteId] [uniqueidentifier] NOT NULL,
	[tp_ListId] [uniqueidentifier] NOT NULL,
	[tp_WebId] [uniqueidentifier] NOT NULL,
	[tp_PageUrlID] [uniqueidentifier] NOT NULL,
	[tp_WebPartID] [uniqueidentifier] NOT NULL,
	[tp_UserID] [int] NULL,
	[tp_Level] [tinyint] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [WebPartLists_PageUrlID]    Script Date: 5/15/2018 12:06:03 PM ******/
CREATE CLUSTERED INDEX [WebPartLists_PageUrlID] ON [dbo].[WebPartLists]
(
	[tp_SiteId] ASC,
	[tp_PageUrlID] ASC,
	[tp_Level] ASC,
	[tp_UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [WebPartLists_ListId]    Script Date: 5/15/2018 12:06:03 PM ******/
CREATE NONCLUSTERED INDEX [WebPartLists_ListId] ON [dbo].[WebPartLists]
(
	[tp_ListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[WebPartLists] ADD  DEFAULT ((1)) FOR [tp_Level]
GO
