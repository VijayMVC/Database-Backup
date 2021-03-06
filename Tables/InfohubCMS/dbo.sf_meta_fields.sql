/****** Object:  Table [dbo].[sf_meta_fields]    Script Date: 5/15/2018 12:01:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_meta_fields](
	[ui_hint] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[storage_type] [int] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[field_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title_] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description_] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[clr_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[db_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[db_sql_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[db_length] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[column_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[db_scale] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_fetch_group] [tinyint] NOT NULL,
	[linked_content_provider] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[two_way_content_link] [tinyint] NOT NULL,
	[taxonomy_provider] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[taxonomy_id] [uniqueidentifier] NULL,
	[is_single_taxon] [tinyint] NOT NULL,
	[validation] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_internal] [tinyint] NOT NULL,
	[default_value_expression] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_value] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[display_format] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hidden] [tinyint] NOT NULL,
	[sitefinity_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[required] [tinyint] NOT NULL,
	[section_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[position_in_section] [int] NOT NULL,
	[min_value] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[max_value] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[max_length] [int] NOT NULL,
	[regular_expression] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_dynamic] [tinyint] NOT NULL,
	[is_deleted] [tinyint] NOT NULL,
	[choice_field_definition] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[allow_multiple_relations] [tinyint] NOT NULL,
	[is_protected_relation] [tinyint] NOT NULL,
	[origin] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[type_id] [uniqueidentifier] NULL,
	[id2] [uniqueidentifier] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_meta_fields] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [idx_sf_meta_fields_type_id]    Script Date: 5/15/2018 12:01:49 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_meta_fields_type_id] ON [dbo].[sf_meta_fields]
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_metafields]    Script Date: 5/15/2018 12:01:49 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_metafields] ON [dbo].[sf_meta_fields]
(
	[app_name] ASC,
	[field_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
