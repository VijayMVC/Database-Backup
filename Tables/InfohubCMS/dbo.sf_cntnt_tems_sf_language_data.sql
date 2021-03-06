/****** Object:  Table [dbo].[sf_cntnt_tems_sf_language_data]    Script Date: 5/15/2018 12:01:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_cntnt_tems_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_cntnt_tms_sf_ln_1E6CD43A] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_cntnt_tms_sf_lngg_dt_id]    Script Date: 5/15/2018 12:01:26 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_tms_sf_lngg_dt_id] ON [dbo].[sf_cntnt_tems_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_cntnt_tems_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_sf_l_468FB44F] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_content_items] ([content_id])
ALTER TABLE [dbo].[sf_cntnt_tems_sf_language_data] CHECK CONSTRAINT [ref_sf_cntnt_tms_sf_l_468FB44F]
ALTER TABLE [dbo].[sf_cntnt_tems_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_sf_l_D3A810FF] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
ALTER TABLE [dbo].[sf_cntnt_tems_sf_language_data] CHECK CONSTRAINT [ref_sf_cntnt_tms_sf_l_D3A810FF]
GO
