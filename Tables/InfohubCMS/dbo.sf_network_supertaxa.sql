/****** Object:  Table [dbo].[sf_network_supertaxa]    Script Date: 5/15/2018 12:01:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_network_supertaxa](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_network_supertaxa] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_network_supertaxa_id2]    Script Date: 5/15/2018 12:01:50 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_network_supertaxa_id2] ON [dbo].[sf_network_supertaxa]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_network_supertaxa]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntwrk_sprtx_sf_E526EF42] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_taxa] ([id])
ALTER TABLE [dbo].[sf_network_supertaxa] CHECK CONSTRAINT [ref_sf_ntwrk_sprtx_sf_E526EF42]
ALTER TABLE [dbo].[sf_network_supertaxa]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntwrk_sprtx_sf_E526EF4F] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxa] ([id])
ALTER TABLE [dbo].[sf_network_supertaxa] CHECK CONSTRAINT [ref_sf_ntwrk_sprtx_sf_E526EF4F]
GO
