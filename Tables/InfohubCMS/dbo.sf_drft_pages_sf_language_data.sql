/****** Object:  Table [dbo].[sf_drft_pages_sf_language_data]    Script Date: 5/15/2018 12:01:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_drft_pages_sf_language_data](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_drft_pgs_sf_lng_806EFED9] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_drft_pgs_sf_lngg_dt_id2]    Script Date: 5/15/2018 12:01:29 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_drft_pgs_sf_lngg_dt_id2] ON [dbo].[sf_drft_pages_sf_language_data]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_drft_pages_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_drft_pgs_sf_ln_2C0B2153] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_language_data] ([id])
ALTER TABLE [dbo].[sf_drft_pages_sf_language_data] CHECK CONSTRAINT [ref_sf_drft_pgs_sf_ln_2C0B2153]
ALTER TABLE [dbo].[sf_drft_pages_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_drft_pgs_sf_ln_B7881151] FOREIGN KEY([id])
REFERENCES [dbo].[sf_draft_pages] ([id])
ALTER TABLE [dbo].[sf_drft_pages_sf_language_data] CHECK CONSTRAINT [ref_sf_drft_pgs_sf_ln_B7881151]
GO
