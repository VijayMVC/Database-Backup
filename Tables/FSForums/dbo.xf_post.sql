/****** Object:  Table [dbo].[xf_post]    Script Date: 5/15/2018 12:00:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_post](
	[post_id] [bigint] IDENTITY(24559,1) NOT NULL,
	[thread_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[post_date] [bigint] NOT NULL,
	[message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ip_id] [bigint] NOT NULL,
	[message_state] [nvarchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[attach_count] [int] NOT NULL,
	[position] [bigint] NOT NULL,
	[likes] [bigint] NOT NULL,
	[like_users] [varbinary](max) NOT NULL,
	[warning_id] [bigint] NOT NULL,
	[warning_message] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_edit_date] [bigint] NOT NULL,
	[last_edit_user_id] [bigint] NOT NULL,
	[edit_count] [bigint] NOT NULL,
 CONSTRAINT [PK_xf_post_post_id] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [post_date]    Script Date: 5/15/2018 12:00:30 PM ******/
CREATE NONCLUSTERED INDEX [post_date] ON [dbo].[xf_post]
(
	[post_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [thread_id_position]    Script Date: 5/15/2018 12:00:30 PM ******/
CREATE NONCLUSTERED INDEX [thread_id_position] ON [dbo].[xf_post]
(
	[thread_id] ASC,
	[position] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [thread_id_post_date]    Script Date: 5/15/2018 12:00:30 PM ******/
CREATE NONCLUSTERED INDEX [thread_id_post_date] ON [dbo].[xf_post]
(
	[thread_id] ASC,
	[post_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [user_id]    Script Date: 5/15/2018 12:00:30 PM ******/
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[xf_post]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT ((0)) FOR [ip_id]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT (N'visible') FOR [message_state]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT ((0)) FOR [attach_count]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT ((0)) FOR [likes]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT ((0)) FOR [warning_id]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT (N'') FOR [warning_message]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT ((0)) FOR [last_edit_date]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT ((0)) FOR [last_edit_user_id]
ALTER TABLE [dbo].[xf_post] ADD  DEFAULT ((0)) FOR [edit_count]
GO
