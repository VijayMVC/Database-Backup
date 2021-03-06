/****** Object:  Table [dbo].[sf_content_link]    Script Date: 5/15/2018 12:01:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_content_link](
	[parent_item_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_item_provider_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_item_id] [uniqueidentifier] NULL,
	[parent_item_additional_info] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ordinal] [real] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[is_parent_deleted] [tinyint] NOT NULL,
	[is_child_deleted] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[component_property_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[child_item_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[child_item_provider_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[child_item_id] [uniqueidentifier] NULL,
	[child_item_additional_info] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[available_for_temp] [tinyint] NOT NULL,
	[available_for_master] [tinyint] NOT NULL,
	[available_for_live] [tinyint] NOT NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_content_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_cnt_lnk_chld_itm_id]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cnt_lnk_chld_itm_id] ON [dbo].[sf_content_link]
(
	[child_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_cnt_lnk_chld_type_id]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cnt_lnk_chld_type_id] ON [dbo].[sf_content_link]
(
	[child_item_type] ASC,
	[child_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_cnt_lnk_prnt_itm_id]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cnt_lnk_prnt_itm_id] ON [dbo].[sf_content_link]
(
	[parent_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
