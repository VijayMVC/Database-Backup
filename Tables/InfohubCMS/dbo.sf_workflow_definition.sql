/****** Object:  Table [dbo].[sf_workflow_definition]    Script Date: 5/15/2018 12:02:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_workflow_definition](
	[workflow_type] [int] NOT NULL,
	[title_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[snd_scnd_lvl_mail_notification] [tinyint] NOT NULL,
	[snd_frst_lvl_mail_notification] [tinyint] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[is_active] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[custom_xamlx_url] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[culture_scope] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[allw_pblshers_to_skip_workflow] [tinyint] NOT NULL,
	[allw_dmnstrtrs_t_skip_workflow] [tinyint] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_workflow_definition] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
