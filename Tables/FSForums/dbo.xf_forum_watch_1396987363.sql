/****** Object:  Table [dbo].[xf_forum_watch_1396987363]    Script Date: 5/15/2018 12:00:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_forum_watch_1396987363](
	[user_id] [bigint] NOT NULL,
	[forum_id] [bigint] NOT NULL,
	[reply_subscribe] [tinyint] NOT NULL,
	[notification_method] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_forum_watch_1396987363_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[forum_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [forum_id_reply_subscribe]    Script Date: 5/15/2018 12:00:22 PM ******/
CREATE NONCLUSTERED INDEX [forum_id_reply_subscribe] ON [dbo].[xf_forum_watch_1396987363]
(
	[forum_id] ASC,
	[reply_subscribe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_forum_watch_1396987363] ADD  DEFAULT ((0)) FOR [reply_subscribe]
ALTER TABLE [dbo].[xf_forum_watch_1396987363] ADD  DEFAULT ((0)) FOR [notification_method]
GO
