/****** Object:  Table [dbo].[xf_profile_post]    Script Date: 5/15/2018 12:00:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_profile_post](
	[profile_post_id] [bigint] IDENTITY(82,1) NOT NULL,
	[profile_user_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[post_date] [bigint] NOT NULL,
	[message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ip_id] [bigint] NOT NULL,
	[message_state] [nvarchar](9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[attach_count] [int] NOT NULL,
	[likes] [bigint] NOT NULL,
	[like_users] [varbinary](max) NOT NULL,
	[comment_count] [bigint] NOT NULL,
	[first_comment_date] [bigint] NOT NULL,
	[last_comment_date] [bigint] NOT NULL,
	[latest_comment_ids] [varbinary](100) NOT NULL,
	[warning_id] [bigint] NOT NULL,
	[warning_message] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_profile_post_profile_post_id] PRIMARY KEY CLUSTERED 
(
	[profile_post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [post_date]    Script Date: 5/15/2018 12:00:31 PM ******/
CREATE NONCLUSTERED INDEX [post_date] ON [dbo].[xf_profile_post]
(
	[post_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [profile_user_id_post_date]    Script Date: 5/15/2018 12:00:31 PM ******/
CREATE NONCLUSTERED INDEX [profile_user_id_post_date] ON [dbo].[xf_profile_post]
(
	[profile_user_id] ASC,
	[post_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [user_id]    Script Date: 5/15/2018 12:00:31 PM ******/
CREATE NONCLUSTERED INDEX [user_id] ON [dbo].[xf_profile_post]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT ((0)) FOR [ip_id]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT (N'visible') FOR [message_state]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT ((0)) FOR [attach_count]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT ((0)) FOR [likes]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT ((0)) FOR [comment_count]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT ((0)) FOR [first_comment_date]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT ((0)) FOR [last_comment_date]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT (0x) FOR [latest_comment_ids]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT ((0)) FOR [warning_id]
ALTER TABLE [dbo].[xf_profile_post] ADD  DEFAULT (N'') FOR [warning_message]
GO
