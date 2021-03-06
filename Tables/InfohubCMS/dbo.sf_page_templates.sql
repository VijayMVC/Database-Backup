/****** Object:  Table [dbo].[sf_page_templates]    Script Date: 5/15/2018 12:01:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_page_templates](
	[theme] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[view_state_encryption] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[validate_request] [tinyint] NOT NULL,
	[ui_culture] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[smart_navigation] [tinyint] NOT NULL,
	[sliding_expiration] [tinyint] NOT NULL,
	[show_in_navigation] [tinyint] NOT NULL,
	[response_encoding] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[require_ssl] [tinyint] NOT NULL,
	[personalization_segment_id] [uniqueidentifier] NULL,
	[personalization_master_id] [uniqueidentifier] NULL,
	[prent_template_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[ordinal] [smallint] NOT NULL,
	[nme] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[master_page] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[maintain_scroll] [tinyint] NOT NULL,
	[locked_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[last_control_id] [int] NOT NULL,
	[keywords_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ky] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_personalized] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[include_script_manger] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[framework] [int] NULL,
	[error_page] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[enable_view_state_mac] [tinyint] NOT NULL,
	[enable_view_state] [tinyint] NOT NULL,
	[enable_theming] [tinyint] NOT NULL,
	[enable_session_state] [tinyint] NOT NULL,
	[enable_event_validation] [tinyint] NOT NULL,
	[description_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[culture] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[category] [uniqueidentifier] NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[cache_output] [tinyint] NOT NULL,
	[cache_duration] [int] NOT NULL,
	[buffer_output] [tinyint] NOT NULL,
	[app_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_page_templates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_pg_tmplts_prnt_tmplt_id]    Script Date: 5/15/2018 12:01:55 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_tmplts_prnt_tmplt_id] ON [dbo].[sf_page_templates]
(
	[prent_template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
