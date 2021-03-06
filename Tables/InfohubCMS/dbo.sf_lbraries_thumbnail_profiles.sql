/****** Object:  Table [dbo].[sf_lbraries_thumbnail_profiles]    Script Date: 5/15/2018 12:01:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_lbraries_thumbnail_profiles](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_lbrrs_thmbnl_pr_AB6293EA] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_lbrrs_thmbnl_prfles_val]    Script Date: 5/15/2018 12:01:42 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lbrrs_thmbnl_prfles_val] ON [dbo].[sf_lbraries_thumbnail_profiles]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_lbraries_thumbnail_profiles]  WITH CHECK ADD  CONSTRAINT [ref_sf_lbrrs_thmbnl_p_88772027] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_libraries] ([content_id])
ALTER TABLE [dbo].[sf_lbraries_thumbnail_profiles] CHECK CONSTRAINT [ref_sf_lbrrs_thmbnl_p_88772027]
GO
