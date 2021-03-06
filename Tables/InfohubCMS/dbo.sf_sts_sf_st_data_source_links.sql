/****** Object:  Table [dbo].[sf_sts_sf_st_data_source_links]    Script Date: 5/15/2018 12:02:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_sts_sf_st_data_source_links](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_sts_sf_st_dt_sr_50593D9B] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_sts_sf_st_dt_src_lnks_d]    Script Date: 5/15/2018 12:02:04 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_sts_sf_st_dt_src_lnks_d] ON [dbo].[sf_sts_sf_st_data_source_links]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_sts_sf_st_data_source_links]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_sf_st_dt_s_5186CA5E] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_site_data_source_links] ([id])
ALTER TABLE [dbo].[sf_sts_sf_st_data_source_links] CHECK CONSTRAINT [ref_sf_sts_sf_st_dt_s_5186CA5E]
ALTER TABLE [dbo].[sf_sts_sf_st_data_source_links]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_sf_st_dt_s_EA6AAC25] FOREIGN KEY([id])
REFERENCES [dbo].[sf_sites] ([id])
ALTER TABLE [dbo].[sf_sts_sf_st_data_source_links] CHECK CONSTRAINT [ref_sf_sts_sf_st_dt_s_EA6AAC25]
GO
