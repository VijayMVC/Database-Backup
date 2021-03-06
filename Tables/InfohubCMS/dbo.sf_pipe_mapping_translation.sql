/****** Object:  Table [dbo].[sf_pipe_mapping_translation]    Script Date: 5/15/2018 12:01:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pipe_mapping_translation](
	[translator_settings] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[translator_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified] [datetime] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_pipe_mapping_translation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
