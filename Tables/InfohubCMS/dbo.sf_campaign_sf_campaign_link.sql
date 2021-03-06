/****** Object:  Table [dbo].[sf_campaign_sf_campaign_link]    Script Date: 5/15/2018 12:01:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_campaign_sf_campaign_link](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_cmpgn_sf_cmpgn__345E94F9] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_cmpgn_sf_cmpgn_link_id2]    Script Date: 5/15/2018 12:01:25 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cmpgn_sf_cmpgn_link_id2] ON [dbo].[sf_campaign_sf_campaign_link]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_campaign_sf_campaign_link]  WITH CHECK ADD  CONSTRAINT [ref_sf_cmpgn_sf_cmpgn_3D3571B2] FOREIGN KEY([id])
REFERENCES [dbo].[sf_campaign] ([id])
ALTER TABLE [dbo].[sf_campaign_sf_campaign_link] CHECK CONSTRAINT [ref_sf_cmpgn_sf_cmpgn_3D3571B2]
ALTER TABLE [dbo].[sf_campaign_sf_campaign_link]  WITH CHECK ADD  CONSTRAINT [ref_sf_cmpgn_sf_cmpgn_9A451AA2] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_campaign_link] ([id])
ALTER TABLE [dbo].[sf_campaign_sf_campaign_link] CHECK CONSTRAINT [ref_sf_cmpgn_sf_cmpgn_9A451AA2]
GO
