/****** Object:  Table [dbo].[sf_control_properties]    Script Date: 5/15/2018 12:01:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_control_properties](
	[val] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[validation] [nvarchar](510) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[prnt_prop_id] [uniqueidentifier] NULL,
	[ordinal] [real] NOT NULL,
	[nme] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[language] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NOT NULL,
	[flags] [int] NOT NULL,
	[description_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[control_id] [uniqueidentifier] NULL,
	[caption_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[app_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_control_properties] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [idx_sf_cntrl_prprts_control_id]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntrl_prprts_control_id] ON [dbo].[sf_control_properties]
(
	[control_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [idx_sf_cntrl_prprts_prnt_prp_d]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntrl_prprts_prnt_prp_d] ON [dbo].[sf_control_properties]
(
	[prnt_prop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_ctrl_props]    Script Date: 5/15/2018 12:01:28 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ctrl_props] ON [dbo].[sf_control_properties]
(
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
