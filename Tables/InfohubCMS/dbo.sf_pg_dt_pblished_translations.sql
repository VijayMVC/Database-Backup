/****** Object:  Table [dbo].[sf_pg_dt_pblished_translations]    Script Date: 5/15/2018 12:01:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pg_dt_pblished_translations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_pg_dt_pblshd_tr_0AFD0240] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_pg_dt_pblshd_trnsltns_v]    Script Date: 5/15/2018 12:01:57 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_dt_pblshd_trnsltns_v] ON [dbo].[sf_pg_dt_pblished_translations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_pg_dt_pblished_translations]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_dt_pblshd_t_4AD938FD] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_page_data] ([content_id])
ALTER TABLE [dbo].[sf_pg_dt_pblished_translations] CHECK CONSTRAINT [ref_sf_pg_dt_pblshd_t_4AD938FD]
GO
