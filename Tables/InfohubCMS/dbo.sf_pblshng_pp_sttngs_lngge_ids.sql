/****** Object:  Table [dbo].[sf_pblshng_pp_sttngs_lngge_ids]    Script Date: 5/15/2018 12:01:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pblshng_pp_sttngs_lngge_ids](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_pblshng_pp_sttn_C9421CF4] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_pblshng_pp_sttngs_lngg_]    Script Date: 5/15/2018 12:01:56 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_pp_sttngs_lngg_] ON [dbo].[sf_pblshng_pp_sttngs_lngge_ids]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_lngge_ids]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_pp_stt_E0AFBD06] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_pipe_settings] ([id])
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_lngge_ids] CHECK CONSTRAINT [ref_sf_pblshng_pp_stt_E0AFBD06]
GO
