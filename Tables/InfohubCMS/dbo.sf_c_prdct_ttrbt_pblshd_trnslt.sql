/****** Object:  Table [dbo].[sf_c_prdct_ttrbt_pblshd_trnslt]    Script Date: 5/15/2018 12:01:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_c_prdct_ttrbt_pblshd_trnslt](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_c_prdct_ttrbt_p_F08EC6A1] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_c_prdct_ttrbt_pblshd_tr]    Script Date: 5/15/2018 12:01:24 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_c_prdct_ttrbt_pblshd_tr] ON [dbo].[sf_c_prdct_ttrbt_pblshd_trnslt]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_c_prdct_ttrbt_pblshd_trnslt]  WITH CHECK ADD  CONSTRAINT [ref_sf_c_prdct_ttrbt__16242477] FOREIGN KEY([id])
REFERENCES [dbo].[sf_ec_product_attribute] ([id])
ALTER TABLE [dbo].[sf_c_prdct_ttrbt_pblshd_trnslt] CHECK CONSTRAINT [ref_sf_c_prdct_ttrbt__16242477]
GO
