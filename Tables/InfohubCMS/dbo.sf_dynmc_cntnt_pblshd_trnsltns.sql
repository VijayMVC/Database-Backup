/****** Object:  Table [dbo].[sf_dynmc_cntnt_pblshd_trnsltns]    Script Date: 5/15/2018 12:01:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_dynmc_cntnt_pblshd_trnsltns](
	[base_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_dynmc_cntnt_pbl_23872A5A] PRIMARY KEY CLUSTERED 
(
	[base_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_dynmc_cntnt_pblshd_trns]    Script Date: 5/15/2018 12:01:30 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dynmc_cntnt_pblshd_trns] ON [dbo].[sf_dynmc_cntnt_pblshd_trnsltns]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_dynmc_cntnt_pblshd_trnsltns]  WITH CHECK ADD  CONSTRAINT [ref_sf_dynmc_cntnt_pb_494E9A61] FOREIGN KEY([base_id])
REFERENCES [dbo].[sf_dynamic_content] ([base_id])
ALTER TABLE [dbo].[sf_dynmc_cntnt_pblshd_trnsltns] CHECK CONSTRAINT [ref_sf_dynmc_cntnt_pb_494E9A61]
GO
