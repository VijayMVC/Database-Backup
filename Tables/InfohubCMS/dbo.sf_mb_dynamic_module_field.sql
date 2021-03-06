/****** Object:  Table [dbo].[sf_mb_dynamic_module_field]    Script Date: 5/15/2018 12:01:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_mb_dynamic_module_field](
	[widget_type_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[video_max_size] [int] NOT NULL,
	[video_extensions] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[type_u_i_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[special_type] [int] NOT NULL,
	[show_in_grid] [tinyint] NOT NULL,
	[related_data_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[related_data_provider] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[regular_expression] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_type_id] [uniqueidentifier] NULL,
	[parent_section_id] [uniqueidentifier] NULL,
	[origin] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ordinal] [int] NOT NULL,
	[number_unit] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nme] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[module_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[min_number_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[min_length] [int] NOT NULL,
	[media_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[max_number_range] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[max_length] [int] NOT NULL,
	[length_validation_message] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NOT NULL,
	[is_transient] [tinyint] NOT NULL,
	[is_rquired_to_select_ddl_value] [tinyint] NOT NULL,
	[is_required_to_select_checkbox] [tinyint] NOT NULL,
	[is_required] [tinyint] NOT NULL,
	[is_localizable] [tinyint] NOT NULL,
	[is_hidden_field] [tinyint] NOT NULL,
	[instructional_text] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[instructional_choice] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[include_in_indexes] [tinyint] NOT NULL,
	[image_max_size] [int] NOT NULL,
	[image_extensions] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NOT NULL,
	[grid_column_ordinal] [int] NOT NULL,
	[frontend_widget_type_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[frontend_widget_label] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[file_max_size] [int] NOT NULL,
	[file_extensions] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[field_type] [int] NOT NULL,
	[field_namespace] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[disable_link_parser] [tinyint] NOT NULL,
	[default_value] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[decimal_places_count] [int] NOT NULL,
	[ddl_choice_default_value_index] [int] NOT NULL,
	[d_b_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[d_b_length] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[column_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[classification_id] [uniqueidentifier] NULL,
	[choices] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choice_render_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[checked_by_default] [tinyint] NOT NULL,
	[can_select_multiple_items] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[cn_crate_items_while_selecting] [tinyint] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[allow_nulls] [tinyint] NOT NULL,
	[allow_multiple_videos] [tinyint] NOT NULL,
	[allow_multiple_images] [tinyint] NOT NULL,
	[allow_multiple_files] [tinyint] NOT NULL,
	[allow_image_library] [tinyint] NOT NULL,
	[address_field_mode] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_dynamic_module_field] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
