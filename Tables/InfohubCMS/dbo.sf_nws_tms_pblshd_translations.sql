/****** Object:  Table [dbo].[sf_nws_tms_pblshd_translations]    Script Date: 5/15/2018 12:01:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_nws_tms_pblshd_translations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_nws_tms_pblshd__4B060187] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_nws_tms_pblshd_trnsltns]    Script Date: 5/15/2018 12:01:53 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_nws_tms_pblshd_trnsltns] ON [dbo].[sf_nws_tms_pblshd_translations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_nws_tms_pblshd_translations]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_pblshd_D2645765] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
ALTER TABLE [dbo].[sf_nws_tms_pblshd_translations] CHECK CONSTRAINT [ref_sf_nws_tms_pblshd_D2645765]
GO
