/****** Object:  Table [dbo].[sf_news_items_tags]    Script Date: 5/15/2018 12:01:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_news_items_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_news_items_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_news_items_tags_val]    Script Date: 5/15/2018 12:01:51 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_news_items_tags_val] ON [dbo].[sf_news_items_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_news_items_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_tgs_sf_FF6C0D89] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
ALTER TABLE [dbo].[sf_news_items_tags] CHECK CONSTRAINT [ref_sf_nws_tms_tgs_sf_FF6C0D89]
GO
