/****** Object:  Table [dbo].[sf_forum_posts]    Script Date: 5/15/2018 12:01:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_forum_posts](
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thread_id] [uniqueidentifier] NOT NULL,
	[reply_to_post_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[is_published] [tinyint] NOT NULL,
	[is_marked_spam] [tinyint] NOT NULL,
	[is_featured] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_forum_posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [idx_sf_posts_last_modified]    Script Date: 5/15/2018 12:01:41 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_posts_last_modified] ON [dbo].[sf_forum_posts]
(
	[last_modified] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_thread_posts]    Script Date: 5/15/2018 12:01:41 PM ******/
CREATE NONCLUSTERED INDEX [idx_thread_posts] ON [dbo].[sf_forum_posts]
(
	[thread_id] ASC,
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
