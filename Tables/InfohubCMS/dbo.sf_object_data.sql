/****** Object:  Table [dbo].[sf_object_data]    Script Date: 5/15/2018 12:01:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_object_data](
	[vrsn] [int] NOT NULL,
	[strategy] [smallint] NOT NULL,
	[parent_prop_id] [uniqueidentifier] NULL,
	[object_type] [varchar](510) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[is_backend_object] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[dictionary_key] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[collection_index] [int] NOT NULL,
	[app_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[sibling_id] [uniqueidentifier] NULL,
	[shred] [tinyint] NULL,
	[place_holder] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[personalization_segment_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_control_id] [uniqueidentifier] NULL,
	[is_personalized] [tinyint] NULL,
	[is_overrided_control] [tinyint] NULL,
	[is_layout_control] [tinyint] NULL,
	[is_data_source] [tinyint] NULL,
	[inherits_permissions] [tinyint] NULL,
	[editable] [tinyint] NULL,
	[description_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id2] [uniqueidentifier] NULL,
	[culture] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[caption_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[can_inherit_permissions] [tinyint] NULL,
	[base_control_id] [uniqueidentifier] NULL,
	[allow_security] [tinyint] NULL,
	[personalization_master_id] [uniqueidentifier] NULL,
	[page_id] [uniqueidentifier] NULL,
	[enable_override_for_control] [tinyint] NULL,
	[enable_override_for_control2] [tinyint] NULL,
	[published] [tinyint] NULL,
	[content_id] [uniqueidentifier] NULL,
	[published2] [tinyint] NULL,
	[id3] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_object_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Collections]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [Collections] ON [dbo].[sf_object_data]
(
	[collection_index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_bjct_dta_parent_prop_id]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_bjct_dta_parent_prop_id] ON [dbo].[sf_object_data]
(
	[parent_prop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_bjct_dta_sibling_id]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_bjct_dta_sibling_id] ON [dbo].[sf_object_data]
(
	[sibling_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_object_data_content_id]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_object_data_content_id] ON [dbo].[sf_object_data]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_object_data_id3]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_object_data_id3] ON [dbo].[sf_object_data]
(
	[id3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_object_data_page_id]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_object_data_page_id] ON [dbo].[sf_object_data]
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_od_pers_master_id]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_od_pers_master_id] ON [dbo].[sf_object_data]
(
	[personalization_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
