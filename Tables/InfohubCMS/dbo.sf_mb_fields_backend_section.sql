/****** Object:  Table [dbo].[sf_mb_fields_backend_section]    Script Date: 5/15/2018 12:01:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_mb_fields_backend_section](
	[title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_type_id] [uniqueidentifier] NULL,
	[ordinal] [int] NOT NULL,
	[nme] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NOT NULL,
	[is_expanded_by_default] [tinyint] NOT NULL,
	[is_expandable] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[expand_text] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_flds_bcknd_s_B04B67A6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
