/****** Object:  Table [dbo].[sf_mb_dnc_cnt_provider]    Script Date: 5/15/2018 12:01:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_mb_dnc_cnt_provider](
	[parent_secured_object_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_secured_object_title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_secured_object_id] [uniqueidentifier] NULL,
	[nme] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_dnc_cnt_provider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
