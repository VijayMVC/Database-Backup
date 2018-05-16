/****** Object:  Table [dbo].[sf_c_prdct_ttrbt_vl_pblshd_trn]    Script Date: 5/15/2018 12:01:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_c_prdct_ttrbt_vl_pblshd_trn](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_c_prdct_ttrbt_v_527C7199] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_c_prdct_ttrbt_vl_pblshd]    Script Date: 5/15/2018 12:01:25 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_c_prdct_ttrbt_vl_pblshd] ON [dbo].[sf_c_prdct_ttrbt_vl_pblshd_trn]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_c_prdct_ttrbt_vl_pblshd_trn]  WITH CHECK ADD  CONSTRAINT [ref_sf_c_prdct_ttrbt__0271292D] FOREIGN KEY([id])
REFERENCES [dbo].[sf_ec_product_attribute_value] ([id])
ALTER TABLE [dbo].[sf_c_prdct_ttrbt_vl_pblshd_trn] CHECK CONSTRAINT [ref_sf_c_prdct_ttrbt__0271292D]
GO
