/****** Object:  Table [dbo].[sf_page_node_sf_permissions]    Script Date: 5/15/2018 12:01:54 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_page_node_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_page_node_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_pg_nd_sf_prmissions_id2]    Script Date: 5/15/2018 12:01:54 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_nd_sf_prmissions_id2] ON [dbo].[sf_page_node_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_page_node_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_nd_sf_prmss_8E9F3040] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
ALTER TABLE [dbo].[sf_page_node_sf_permissions] CHECK CONSTRAINT [ref_sf_pg_nd_sf_prmss_8E9F3040]
ALTER TABLE [dbo].[sf_page_node_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_nd_sf_prmss_9F0409E8] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_node] ([id])
ALTER TABLE [dbo].[sf_page_node_sf_permissions] CHECK CONSTRAINT [ref_sf_pg_nd_sf_prmss_9F0409E8]
GO
