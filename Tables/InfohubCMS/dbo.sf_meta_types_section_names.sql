/****** Object:  Table [dbo].[sf_meta_types_section_names]    Script Date: 5/15/2018 12:01:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_meta_types_section_names](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_meta_types_section_names] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [idx_sf_mt_typs_scton_names_val]    Script Date: 5/15/2018 12:01:50 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mt_typs_scton_names_val] ON [dbo].[sf_meta_types_section_names]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[sf_meta_types_section_names]  WITH CHECK ADD  CONSTRAINT [ref_sf_mt_typs_sctn_n_67C53CAD] FOREIGN KEY([id])
REFERENCES [dbo].[sf_meta_types] ([id])
ALTER TABLE [dbo].[sf_meta_types_section_names] CHECK CONSTRAINT [ref_sf_mt_typs_sctn_n_67C53CAD]
GO
