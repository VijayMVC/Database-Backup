/****** Object:  Table [dbo].[sf_facet_facets]    Script Date: 5/15/2018 12:01:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_facet_facets](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_facet_facets] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_facet_facets_id2]    Script Date: 5/15/2018 12:01:39 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_facet_facets_id2] ON [dbo].[sf_facet_facets]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_facet_facets]  WITH CHECK ADD  CONSTRAINT [ref_sf_facet_facets_sf_taxa] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxa] ([id])
ALTER TABLE [dbo].[sf_facet_facets] CHECK CONSTRAINT [ref_sf_facet_facets_sf_taxa]
ALTER TABLE [dbo].[sf_facet_facets]  WITH CHECK ADD  CONSTRAINT [ref_sf_fct_fcts_sf_tx_A3F38EB4] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_taxonomies] ([id])
ALTER TABLE [dbo].[sf_facet_facets] CHECK CONSTRAINT [ref_sf_fct_fcts_sf_tx_A3F38EB4]
GO
