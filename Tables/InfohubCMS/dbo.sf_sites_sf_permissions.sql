/****** Object:  Table [dbo].[sf_sites_sf_permissions]    Script Date: 5/15/2018 12:02:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_sites_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_sites_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_stes_sf_permissions_id2]    Script Date: 5/15/2018 12:02:03 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_stes_sf_permissions_id2] ON [dbo].[sf_sites_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_sites_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_sf_prmssns_2BA50E5F] FOREIGN KEY([id])
REFERENCES [dbo].[sf_sites] ([id])
ALTER TABLE [dbo].[sf_sites_sf_permissions] CHECK CONSTRAINT [ref_sf_sts_sf_prmssns_2BA50E5F]
ALTER TABLE [dbo].[sf_sites_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_sf_prmssns_591B75AD] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
ALTER TABLE [dbo].[sf_sites_sf_permissions] CHECK CONSTRAINT [ref_sf_sts_sf_prmssns_591B75AD]
GO
