/****** Object:  Table [dbo].[sf_news_items_sf_permissions]    Script Date: 5/15/2018 12:01:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_news_items_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_nws_tms_sf_prms_96463089] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_nws_tms_sf_prmssions_id]    Script Date: 5/15/2018 12:01:51 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_nws_tms_sf_prmssions_id] ON [dbo].[sf_news_items_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_news_items_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_sf_prm_30F6C541] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
ALTER TABLE [dbo].[sf_news_items_sf_permissions] CHECK CONSTRAINT [ref_sf_nws_tms_sf_prm_30F6C541]
ALTER TABLE [dbo].[sf_news_items_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_sf_prm_37B82403] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
ALTER TABLE [dbo].[sf_news_items_sf_permissions] CHECK CONSTRAINT [ref_sf_nws_tms_sf_prm_37B82403]
GO
