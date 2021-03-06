/****** Object:  Table [dbo].[sf_ec_product_sf_language_data]    Script Date: 5/15/2018 12:01:36 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_product_sf_language_data](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_c_prdct_sf_lngg_9CD5E120] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_c_prdct_sf_lngg_dta_id2]    Script Date: 5/15/2018 12:01:36 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_c_prdct_sf_lngg_dta_id2] ON [dbo].[sf_ec_product_sf_language_data]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_ec_product_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_c_prdct_sf_lng_B24AC17B] FOREIGN KEY([id])
REFERENCES [dbo].[sf_ec_product] ([id])
ALTER TABLE [dbo].[sf_ec_product_sf_language_data] CHECK CONSTRAINT [ref_sf_c_prdct_sf_lng_B24AC17B]
ALTER TABLE [dbo].[sf_ec_product_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_c_prdct_sf_lng_EBDBA364] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_language_data] ([id])
ALTER TABLE [dbo].[sf_ec_product_sf_language_data] CHECK CONSTRAINT [ref_sf_c_prdct_sf_lng_EBDBA364]
GO
