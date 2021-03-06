/****** Object:  Table [dbo].[sf_mb_dynamic_module_type]    Script Date: 5/15/2018 12:01:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_mb_dynamic_module_type](
	[type_namespace] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[type_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parentTypeId] [uniqueidentifier] NULL,
	[parent_module_id] [uniqueidentifier] NULL,
	[pageId] [uniqueidentifier] NULL,
	[origin] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[module_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[main_short_text_field_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NOT NULL,
	[is_slf_referencing] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[display_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[check_field_permissions] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_dynamic_module_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
