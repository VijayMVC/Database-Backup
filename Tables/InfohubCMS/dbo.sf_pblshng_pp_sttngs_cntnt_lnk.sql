/****** Object:  Table [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk]    Script Date: 5/15/2018 12:01:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_pblshng_pp_sttn_D50A08BB] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_pblshng_pp_sttngs_cntnt]    Script Date: 5/15/2018 12:01:56 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_pp_sttngs_cntnt] ON [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_pp_stt_A5119550] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_pipe_settings] ([id])
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk] CHECK CONSTRAINT [ref_sf_pblshng_pp_stt_A5119550]
GO
