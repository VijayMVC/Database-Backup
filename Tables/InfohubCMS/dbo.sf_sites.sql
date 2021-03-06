/****** Object:  Table [dbo].[sf_sites]    Script Date: 5/15/2018 12:02:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_sites](
	[staging_url] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[site_map_root_node_id] [uniqueidentifier] NULL,
	[site_configuration_mode] [int] NOT NULL,
	[requires_ssl] [bit] NOT NULL,
	[redirectIfOffline] [bit] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[offlineSiteMessage] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[offlinePageToRedirect] [uniqueidentifier] NULL,
	[nme] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[live_url] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_offline] [bit] NOT NULL,
	[isLocatedInMainMenu] [bit] NOT NULL,
	[is_default] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[home_page_id] [uniqueidentifier] NULL,
	[front_end_login_page_url] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[front_end_login_page_id] [uniqueidentifier] NULL,
	[default_culture_key] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_sites] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_site_live_url]    Script Date: 5/15/2018 12:02:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_site_live_url] ON [dbo].[sf_sites]
(
	[live_url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_site_name]    Script Date: 5/15/2018 12:02:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_site_name] ON [dbo].[sf_sites]
(
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
