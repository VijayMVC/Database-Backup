/****** Object:  Table [dbo].[sf_forum_groups]    Script Date: 5/15/2018 12:01:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_forum_groups](
	[url_name_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ordinal] [real] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[item_default_url_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_locked] [tinyint] NOT NULL,
	[is_default] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_forum_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_forum_groups]    Script Date: 5/15/2018 12:01:40 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_forum_groups] ON [dbo].[sf_forum_groups]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
