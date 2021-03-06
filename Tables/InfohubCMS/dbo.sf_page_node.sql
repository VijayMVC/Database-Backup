/****** Object:  Table [dbo].[sf_page_node]    Script Date: 5/15/2018 12:01:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_page_node](
	[url_name_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title_] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[show_in_navigation] [tinyint] NOT NULL,
	[root_id] [uniqueidentifier] NULL,
	[require_ssl] [tinyint] NOT NULL,
	[render_as_link] [tinyint] NOT NULL,
	[redirect_url_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[priority] [real] NOT NULL,
	[previous_parent_id] [uniqueidentifier] NULL,
	[parent_id] [uniqueidentifier] NULL,
	[content_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[ordinal] [real] NOT NULL,
	[open_new_window] [tinyint] NOT NULL,
	[node_type] [int] NOT NULL,
	[nme] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[module_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[loc_strtgy] [smallint] NOT NULL,
	[linked_node_provider] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[linked_node_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[is_deleted] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[inc_in_srch_idx] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[extension] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[enable_default_canonical_url] [tinyint] NULL,
	[description_] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[date_created] [datetime] NULL,
	[crawlable] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[approval_workflow_state_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[allow_parameters_validation] [tinyint] NOT NULL,
	[allow_multiple_urls] [tinyint] NOT NULL,
 CONSTRAINT [pk_sf_page_node] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_page_node_parent_id]    Script Date: 5/15/2018 12:01:54 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_page_node_parent_id] ON [dbo].[sf_page_node]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_pages_root_id]    Script Date: 5/15/2018 12:01:54 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pages_root_id] ON [dbo].[sf_page_node]
(
	[root_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
