/****** Object:  Table [dbo].[sf_md_content_sf_language_data]    Script Date: 5/15/2018 12:01:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_md_content_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_md_cntnt_sf_lng_B0245982] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_md_cntnt_sf_lngg_dta_id]    Script Date: 5/15/2018 12:01:46 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_cntnt_sf_lngg_dta_id] ON [dbo].[sf_md_content_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_md_content_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_sf_ln_63674A2C] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
ALTER TABLE [dbo].[sf_md_content_sf_language_data] CHECK CONSTRAINT [ref_sf_md_cntnt_sf_ln_63674A2C]
ALTER TABLE [dbo].[sf_md_content_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_sf_ln_638FE5E3] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
ALTER TABLE [dbo].[sf_md_content_sf_language_data] CHECK CONSTRAINT [ref_sf_md_cntnt_sf_ln_638FE5E3]
GO
