/****** Object:  Table [dbo].[sf_site_data_source_links]    Script Date: 5/15/2018 12:02:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_site_data_source_links](
	[site_id] [uniqueidentifier] NULL,
	[provider_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_default] [bit] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[dataSource_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_site_data_source_links] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
