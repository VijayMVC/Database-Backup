/****** Object:  Table [dbo].[sf_ec_prdct_software]    Script Date: 5/15/2018 12:01:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_ec_prdct_software](
	[id] [uniqueidentifier] NOT NULL,
	[release] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[platform] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_ec_prdct_software] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sf_ec_prdct_software]  WITH CHECK ADD  CONSTRAINT [ref_sf_c_prdct_sftwr__02DBF4EF] FOREIGN KEY([id])
REFERENCES [dbo].[sf_ec_product] ([id])
ON DELETE CASCADE
ALTER TABLE [dbo].[sf_ec_prdct_software] CHECK CONSTRAINT [ref_sf_c_prdct_sftwr__02DBF4EF]
GO
