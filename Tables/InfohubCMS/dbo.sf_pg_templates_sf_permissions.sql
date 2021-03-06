/****** Object:  Table [dbo].[sf_pg_templates_sf_permissions]    Script Date: 5/15/2018 12:01:58 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_pg_templates_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_pg_tmplts_sf_pr_82317AA0] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_pg_tmplts_sf_prmssns_d2]    Script Date: 5/15/2018 12:01:58 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_tmplts_sf_prmssns_d2] ON [dbo].[sf_pg_templates_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_pg_templates_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_tmplts_sf_p_1B1C7023] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_templates] ([id])
ALTER TABLE [dbo].[sf_pg_templates_sf_permissions] CHECK CONSTRAINT [ref_sf_pg_tmplts_sf_p_1B1C7023]
ALTER TABLE [dbo].[sf_pg_templates_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_tmplts_sf_p_95566D85] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
ALTER TABLE [dbo].[sf_pg_templates_sf_permissions] CHECK CONSTRAINT [ref_sf_pg_tmplts_sf_p_95566D85]
GO
