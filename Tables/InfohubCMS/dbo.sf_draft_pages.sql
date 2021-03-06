/****** Object:  Table [dbo].[sf_draft_pages]    Script Date: 5/15/2018 12:01:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_draft_pages](
	[vrsion] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[is_temp_draft] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[approval_workflow_state_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[theme] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_evaluation_mode] [int] NULL,
	[template_id] [uniqueidentifier] NULL,
	[personalization_segment_id] [uniqueidentifier] NULL,
	[personalization_master_id] [uniqueidentifier] NULL,
	[page_id] [uniqueidentifier] NULL,
	[master_page] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_control_id2] [int] NULL,
	[is_personalized] [tinyint] NULL,
	[include_script_manger] [tinyint] NULL,
	[flags] [int] NULL,
	[external_page] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[theme2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[personalization_segment_id2] [uniqueidentifier] NULL,
	[personalization_master_id2] [uniqueidentifier] NULL,
	[master_page2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_control_id] [int] NULL,
	[ky] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_personalized2] [tinyint] NULL,
	[include_script_manger2] [tinyint] NULL,
	[success_message_] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sccss_mssge_after_form_update_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[submit_restriction] [int] NULL,
	[submit_action_after_update] [int] NULL,
	[submit_action] [int] NULL,
	[redirect_page_url_after_update] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[redirect_page_url] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[content_id] [uniqueidentifier] NULL,
	[nme] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_control_id3] [int] NULL,
	[form_label_placement] [int] NULL,
	[css_class] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_temp_form] [tinyint] NULL,
 CONSTRAINT [pk_sf_draft_pages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [idx_sf_draft_pages_content_id]    Script Date: 5/15/2018 12:01:29 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_draft_pages_content_id] ON [dbo].[sf_draft_pages]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_draft_pages_page_id]    Script Date: 5/15/2018 12:01:29 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_draft_pages_page_id] ON [dbo].[sf_draft_pages]
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [sf_idx_FormName]    Script Date: 5/15/2018 12:01:29 PM ******/
CREATE NONCLUSTERED INDEX [sf_idx_FormName] ON [dbo].[sf_draft_pages]
(
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
