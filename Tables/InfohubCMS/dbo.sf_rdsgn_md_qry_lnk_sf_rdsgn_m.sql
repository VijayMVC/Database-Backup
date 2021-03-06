/****** Object:  Table [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m]    Script Date: 5/15/2018 12:02:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_rdsgn_md_qry_ln_BE77E2B3] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_rdsgn_md_qry_lnk_sf_rds]    Script Date: 5/15/2018 12:02:01 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_rdsgn_md_qry_lnk_sf_rds] ON [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m]  WITH CHECK ADD  CONSTRAINT [ref_sf_rdsgn_md_qry_l_B376AFEF] FOREIGN KEY([id])
REFERENCES [dbo].[sf_rdsgn_media_query_link] ([id])
ALTER TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m] CHECK CONSTRAINT [ref_sf_rdsgn_md_qry_l_B376AFEF]
ALTER TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m]  WITH CHECK ADD  CONSTRAINT [ref_sf_rdsgn_md_qry_l_E287174C] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_rdsgn_media_query] ([id])
ALTER TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m] CHECK CONSTRAINT [ref_sf_rdsgn_md_qry_l_E287174C]
GO
