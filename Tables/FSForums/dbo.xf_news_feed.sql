/****** Object:  Table [dbo].[xf_news_feed]    Script Date: 5/15/2018 12:00:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_news_feed](
	[news_feed_id] [bigint] IDENTITY(26222,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[content_type] [varbinary](25) NOT NULL,
	[content_id] [bigint] NOT NULL,
	[action] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[event_date] [bigint] NOT NULL,
	[extra_data] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_xf_news_feed_news_feed_id] PRIMARY KEY CLUSTERED 
(
	[news_feed_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [contentType_contentId]    Script Date: 5/15/2018 12:00:26 PM ******/
CREATE NONCLUSTERED INDEX [contentType_contentId] ON [dbo].[xf_news_feed]
(
	[content_type] ASC,
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [event_date]    Script Date: 5/15/2018 12:00:26 PM ******/
CREATE NONCLUSTERED INDEX [event_date] ON [dbo].[xf_news_feed]
(
	[event_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [userId_eventDate]    Script Date: 5/15/2018 12:00:26 PM ******/
CREATE NONCLUSTERED INDEX [userId_eventDate] ON [dbo].[xf_news_feed]
(
	[user_id] ASC,
	[event_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_news_feed] ADD  DEFAULT (N'') FOR [username]
GO
