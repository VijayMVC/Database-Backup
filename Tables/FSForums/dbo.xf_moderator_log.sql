/****** Object:  Table [dbo].[xf_moderator_log]    Script Date: 5/15/2018 12:00:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_moderator_log](
	[moderator_log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[log_date] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[content_type] [varbinary](25) NOT NULL,
	[content_id] [bigint] NOT NULL,
	[content_user_id] [bigint] NOT NULL,
	[content_username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[content_title] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[content_url] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[discussion_content_type] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[discussion_content_id] [bigint] NOT NULL,
	[action] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[action_params] [varbinary](max) NOT NULL,
	[ip_address] [varbinary](16) NOT NULL,
 CONSTRAINT [PK_xf_moderator_log_moderator_log_id] PRIMARY KEY CLUSTERED 
(
	[moderator_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [content_type_id]    Script Date: 5/15/2018 12:00:26 PM ******/
CREATE NONCLUSTERED INDEX [content_type_id] ON [dbo].[xf_moderator_log]
(
	[content_type] ASC,
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [discussion_content_type_id]    Script Date: 5/15/2018 12:00:26 PM ******/
CREATE NONCLUSTERED INDEX [discussion_content_type_id] ON [dbo].[xf_moderator_log]
(
	[discussion_content_type] ASC,
	[discussion_content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [log_date]    Script Date: 5/15/2018 12:00:26 PM ******/
CREATE NONCLUSTERED INDEX [log_date] ON [dbo].[xf_moderator_log]
(
	[log_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [user_id_log_date]    Script Date: 5/15/2018 12:00:26 PM ******/
CREATE NONCLUSTERED INDEX [user_id_log_date] ON [dbo].[xf_moderator_log]
(
	[user_id] ASC,
	[log_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_moderator_log] ADD  DEFAULT (0x) FOR [ip_address]
GO
