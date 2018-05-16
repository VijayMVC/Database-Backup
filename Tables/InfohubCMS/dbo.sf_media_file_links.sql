/****** Object:  Table [dbo].[sf_media_file_links]    Script Date: 5/15/2018 12:01:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_media_file_links](
	[width] [int] NULL,
	[total_size] [bigint] NULL,
	[number_of_chunks] [int] NULL,
	[mime_type] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[content_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[height] [int] NULL,
	[file_path] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[file_id] [uniqueidentifier] NULL,
	[extension] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_url] [nvarchar](510) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[culture] [int] NOT NULL,
	[chunk_size] [int] NULL,
	[app_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_media_file_links] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_md_fle_links_content_id]    Script Date: 5/15/2018 12:01:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_fle_links_content_id] ON [dbo].[sf_media_file_links]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
