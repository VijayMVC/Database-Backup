/****** Object:  Table [dbo].[xf_user]    Script Date: 5/15/2018 12:00:38 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_user](
	[user_id] [bigint] IDENTITY(1448,1) NOT NULL,
	[username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[email] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[gender] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[custom_title] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[language_id] [bigint] NOT NULL,
	[style_id] [bigint] NOT NULL,
	[timezone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[visible] [tinyint] NOT NULL,
	[user_group_id] [bigint] NOT NULL,
	[secondary_group_ids] [varbinary](255) NOT NULL,
	[display_style_group_id] [bigint] NOT NULL,
	[permission_combination_id] [bigint] NOT NULL,
	[message_count] [bigint] NOT NULL,
	[conversations_unread] [int] NOT NULL,
	[register_date] [bigint] NOT NULL,
	[last_activity] [bigint] NOT NULL,
	[trophy_points] [bigint] NOT NULL,
	[alerts_unread] [int] NOT NULL,
	[avatar_date] [bigint] NOT NULL,
	[avatar_width] [int] NOT NULL,
	[avatar_height] [int] NOT NULL,
	[gravatar] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[user_state] [nvarchar](18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[is_moderator] [tinyint] NOT NULL,
	[is_admin] [tinyint] NOT NULL,
	[is_banned] [tinyint] NOT NULL,
	[like_count] [bigint] NOT NULL,
	[warning_points] [bigint] NOT NULL,
	[xf_bdmedal_awarded_cached] [varbinary](max) NULL,
	[is_staff] [tinyint] NOT NULL,
 CONSTRAINT [PK_xf_user_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [xf_user$username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [email]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [email] ON [dbo].[xf_user]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [last_activity]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [last_activity] ON [dbo].[xf_user]
(
	[last_activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [like_count]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [like_count] ON [dbo].[xf_user]
(
	[like_count] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [message_count]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [message_count] ON [dbo].[xf_user]
(
	[message_count] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [register_date]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [register_date] ON [dbo].[xf_user]
(
	[register_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [staff_username]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [staff_username] ON [dbo].[xf_user]
(
	[is_staff] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [trophy_points]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [trophy_points] ON [dbo].[xf_user]
(
	[trophy_points] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [user_state]    Script Date: 5/15/2018 12:00:38 PM ******/
CREATE NONCLUSTERED INDEX [user_state] ON [dbo].[xf_user]
(
	[user_state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT (N'') FOR [gender]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT (N'') FOR [custom_title]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((1)) FOR [visible]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [display_style_group_id]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [message_count]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [conversations_unread]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [register_date]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [last_activity]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [trophy_points]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [alerts_unread]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [avatar_date]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [avatar_width]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [avatar_height]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT (N'') FOR [gravatar]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT (N'valid') FOR [user_state]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [is_moderator]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [is_admin]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [is_banned]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [like_count]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [warning_points]
ALTER TABLE [dbo].[xf_user] ADD  DEFAULT ((0)) FOR [is_staff]
GO
