/****** Object:  Table [dbo].[sf_vnts_published_translations]    Script Date: 5/15/2018 12:02:09 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_vnts_published_translations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_vnts_pblshd_trn_4EB48CFB] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_vnts_pblshd_trnsltns_vl]    Script Date: 5/15/2018 12:02:09 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_vnts_pblshd_trnsltns_vl] ON [dbo].[sf_vnts_published_translations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_vnts_published_translations]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_pblshd_tr_6DA2DE64] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_events] ([content_id])
ALTER TABLE [dbo].[sf_vnts_published_translations] CHECK CONSTRAINT [ref_sf_vnts_pblshd_tr_6DA2DE64]
GO
