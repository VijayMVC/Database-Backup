/****** Object:  Table [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns]    Script Date: 5/15/2018 12:01:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_mb_dnc_cnt_prvd_0B25FC74] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_mb_dnc_cnt_prvdr_sf_prm]    Script Date: 5/15/2018 12:01:45 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mb_dnc_cnt_prvdr_sf_prm] ON [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dnc_cnt_prv_2D552106] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
ALTER TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns] CHECK CONSTRAINT [ref_sf_mb_dnc_cnt_prv_2D552106]
ALTER TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dnc_cnt_prv_D7D592EA] FOREIGN KEY([id])
REFERENCES [dbo].[sf_mb_dnc_cnt_provider] ([id])
ALTER TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns] CHECK CONSTRAINT [ref_sf_mb_dnc_cnt_prv_D7D592EA]
GO
