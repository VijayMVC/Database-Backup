/****** Object:  Table [dbo].[sf_md_cntnt_pblshd_trnslations]    Script Date: 5/15/2018 12:01:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_md_cntnt_pblshd_trnslations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_md_cntnt_pblshd_A71A6401] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_md_cntnt_pblshd_trnsltn]    Script Date: 5/15/2018 12:01:46 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_cntnt_pblshd_trnsltn] ON [dbo].[sf_md_cntnt_pblshd_trnslations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_md_cntnt_pblshd_trnslations]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_pblsh_5088F2F2] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
ALTER TABLE [dbo].[sf_md_cntnt_pblshd_trnslations] CHECK CONSTRAINT [ref_sf_md_cntnt_pblsh_5088F2F2]
GO
