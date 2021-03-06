/****** Object:  Table [dbo].[sf_media_content_tags2]    Script Date: 5/15/2018 12:01:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_media_content_tags2](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_media_content_tags2] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_media_content_tags2_val]    Script Date: 5/15/2018 12:01:48 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_media_content_tags2_val] ON [dbo].[sf_media_content_tags2]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_media_content_tags2]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_tgs2__71AE7B0C] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
ALTER TABLE [dbo].[sf_media_content_tags2] CHECK CONSTRAINT [ref_sf_md_cntnt_tgs2__71AE7B0C]
GO
