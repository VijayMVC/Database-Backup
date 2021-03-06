/****** Object:  Table [dbo].[xf_bb_code_media_site]    Script Date: 5/15/2018 12:00:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_bb_code_media_site](
	[media_site_id] [varbinary](25) NOT NULL,
	[site_title] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[site_url] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[match_urls] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[match_is_regex] [tinyint] NOT NULL,
	[match_callback_class] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[match_callback_method] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[embed_html] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[embed_html_callback_class] [nvarchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[embed_html_callback_method] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[supported] [tinyint] NOT NULL,
	[addon_id] [varbinary](25) NOT NULL,
 CONSTRAINT [PK_xf_bb_code_media_site_media_site_id] PRIMARY KEY CLUSTERED 
(
	[media_site_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[xf_bb_code_media_site] ADD  DEFAULT (N'') FOR [site_url]
ALTER TABLE [dbo].[xf_bb_code_media_site] ADD  DEFAULT ((0)) FOR [match_is_regex]
ALTER TABLE [dbo].[xf_bb_code_media_site] ADD  DEFAULT (N'') FOR [match_callback_class]
ALTER TABLE [dbo].[xf_bb_code_media_site] ADD  DEFAULT (N'') FOR [match_callback_method]
ALTER TABLE [dbo].[xf_bb_code_media_site] ADD  DEFAULT (N'') FOR [embed_html_callback_class]
ALTER TABLE [dbo].[xf_bb_code_media_site] ADD  DEFAULT (N'') FOR [embed_html_callback_method]
ALTER TABLE [dbo].[xf_bb_code_media_site] ADD  DEFAULT ((1)) FOR [supported]
ALTER TABLE [dbo].[xf_bb_code_media_site] ADD  DEFAULT (0x) FOR [addon_id]
GO
