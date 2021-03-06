/****** Object:  Table [dbo].[sf_commnt_parent_group_ids]    Script Date: 5/15/2018 12:01:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_commnt_parent_group_ids](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_commnt_parent_group_ids] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_cmmnt_prnt_grup_ids_val]    Script Date: 5/15/2018 12:01:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cmmnt_prnt_grup_ids_val] ON [dbo].[sf_commnt_parent_group_ids]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_commnt_parent_group_ids]  WITH CHECK ADD  CONSTRAINT [ref_sf_cmmnt_prnt_grp_4E481DC9] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_commnt] ([content_id])
ALTER TABLE [dbo].[sf_commnt_parent_group_ids] CHECK CONSTRAINT [ref_sf_cmmnt_prnt_grp_4E481DC9]
GO
