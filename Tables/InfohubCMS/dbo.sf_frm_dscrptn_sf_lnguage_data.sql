/****** Object:  Table [dbo].[sf_frm_dscrptn_sf_lnguage_data]    Script Date: 5/15/2018 12:01:41 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_frm_dscrptn_sf__C7B8CF01] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_frm_dscrptn_sf_lngg_dt_]    Script Date: 5/15/2018 12:01:41 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_dscrptn_sf_lngg_dt_] ON [dbo].[sf_frm_dscrptn_sf_lnguage_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_929C00E9] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_929C00E9]
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_A3601094] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_A3601094]
GO
