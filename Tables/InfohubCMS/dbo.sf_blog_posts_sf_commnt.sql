/****** Object:  Table [dbo].[sf_blog_posts_sf_commnt]    Script Date: 5/15/2018 12:01:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_blog_posts_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_blog_posts_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_blg_psts_sf_cmmnt_cntnt]    Script Date: 5/15/2018 12:01:23 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blg_psts_sf_cmmnt_cntnt] ON [dbo].[sf_blog_posts_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_blog_posts_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_sf_cm_BE833FC3] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
ALTER TABLE [dbo].[sf_blog_posts_sf_commnt] CHECK CONSTRAINT [ref_sf_blg_psts_sf_cm_BE833FC3]
ALTER TABLE [dbo].[sf_blog_posts_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_sf_cm_EBEDB972] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blog_posts] ([content_id])
ALTER TABLE [dbo].[sf_blog_posts_sf_commnt] CHECK CONSTRAINT [ref_sf_blg_psts_sf_cm_EBEDB972]
GO
