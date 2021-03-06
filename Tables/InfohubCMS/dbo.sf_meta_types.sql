/****** Object:  Table [dbo].[sf_meta_types]    Script Date: 5/15/2018 12:01:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_meta_types](
	[database_inheritance] [int] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[name_space] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[class_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[section_captions_resource_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_dynamic] [tinyint] NOT NULL,
	[is_deleted] [tinyint] NOT NULL,
	[parent_type_id] [uniqueidentifier] NULL,
	[base_class_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[assembly_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[module_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[origin] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_meta_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_meta_types]    Script Date: 5/15/2018 12:01:49 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_meta_types] ON [dbo].[sf_meta_types]
(
	[app_name] ASC,
	[class_name] ASC,
	[name_space] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
