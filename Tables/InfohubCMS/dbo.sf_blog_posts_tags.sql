/****** Object:  Table [dbo].[sf_blog_posts_tags]    Script Date: 5/15/2018 12:01:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_blog_posts_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_blog_posts_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_blog_posts_tags_val]    Script Date: 5/15/2018 12:01:24 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blog_posts_tags_val] ON [dbo].[sf_blog_posts_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_blog_posts_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_tgs_s_8440CA61] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blog_posts] ([content_id])
ALTER TABLE [dbo].[sf_blog_posts_tags] CHECK CONSTRAINT [ref_sf_blg_psts_tgs_s_8440CA61]
GO
