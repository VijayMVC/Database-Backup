/****** Object:  Table [dbo].[sf_pblshng_mppng_sttngs_sf_pbl]    Script Date: 5/15/2018 12:01:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_pblshng_mppng_s_F2A620C4] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_pblshng_mppng_sttngs_sf]    Script Date: 5/15/2018 12:01:55 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_mppng_sttngs_sf] ON [dbo].[sf_pblshng_mppng_sttngs_sf_pbl]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_mppng__A0EF7CD1] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_mapping_settings] ([id])
ALTER TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl] CHECK CONSTRAINT [ref_sf_pblshng_mppng__A0EF7CD1]
ALTER TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_mppng__B02ED89D] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_publishing_mapping] ([id])
ALTER TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl] CHECK CONSTRAINT [ref_sf_pblshng_mppng__B02ED89D]
GO
