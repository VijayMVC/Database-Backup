/****** Object:  Table [dbo].[sf_pg_tmplts_pblshd_trnsltions]    Script Date: 5/15/2018 12:01:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pg_tmplts_pblshd_trnsltions](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_pg_tmplts_pblsh_269E8002] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_pg_tmplts_pblshd_trnslt]    Script Date: 5/15/2018 12:01:58 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_tmplts_pblshd_trnslt] ON [dbo].[sf_pg_tmplts_pblshd_trnsltions]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_pg_tmplts_pblshd_trnsltions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_tmplts_pbls_88E7C526] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_templates] ([id])
ALTER TABLE [dbo].[sf_pg_tmplts_pblshd_trnsltions] CHECK CONSTRAINT [ref_sf_pg_tmplts_pbls_88E7C526]
GO
