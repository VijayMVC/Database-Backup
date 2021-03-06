/****** Object:  Table [dbo].[sf_forums]    Script Date: 5/15/2018 12:01:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_forums](
	[url_name_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[threads_count] [int] NOT NULL,
	[subscr_lst_id] [uniqueidentifier] NULL,
	[posts_count] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[ordinal] [real] NOT NULL,
	[last_thread_id] [uniqueidentifier] NULL,
	[last_post_user_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_post_user_id] [uniqueidentifier] NULL,
	[last_post_id] [uniqueidentifier] NULL,
	[last_post_date] [datetime] NULL,
	[last_modified] [datetime] NOT NULL,
	[item_default_url_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_locked] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[include_in_sitemap] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[icon_id] [uniqueidentifier] NULL,
	[group_id] [uniqueidentifier] NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[defaultPageId] [uniqueidentifier] NULL,
	[date_created] [datetime] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[attachmentsRequiredRole] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[allowed_attachment_extensions] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[allowAttachments] [tinyint] NOT NULL,
 CONSTRAINT [pk_sf_forums] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_forums_group_id]    Script Date: 5/15/2018 12:01:41 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_forums_group_id] ON [dbo].[sf_forums]
(
	[app_name] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
