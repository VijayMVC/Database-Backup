/****** Object:  Table [dbo].[sf_mta_types_sf_meta_attribute]    Script Date: 5/15/2018 12:01:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_mta_types_sf_meta_attribute](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_mt_typs_sf_mt_t_14A837FE] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_mt_typs_sf_mt_ttrbt_id2]    Script Date: 5/15/2018 12:01:50 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mt_typs_sf_mt_ttrbt_id2] ON [dbo].[sf_mta_types_sf_meta_attribute]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_mta_types_sf_meta_attribute]  WITH CHECK ADD  CONSTRAINT [ref_sf_mt_typs_sf_mt__6697360C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_meta_types] ([id])
ALTER TABLE [dbo].[sf_mta_types_sf_meta_attribute] CHECK CONSTRAINT [ref_sf_mt_typs_sf_mt__6697360C]
ALTER TABLE [dbo].[sf_mta_types_sf_meta_attribute]  WITH CHECK ADD  CONSTRAINT [ref_sf_mt_typs_sf_mt__D9A516DC] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_meta_attribute] ([id])
ALTER TABLE [dbo].[sf_mta_types_sf_meta_attribute] CHECK CONSTRAINT [ref_sf_mt_typs_sf_mt__D9A516DC]
GO
