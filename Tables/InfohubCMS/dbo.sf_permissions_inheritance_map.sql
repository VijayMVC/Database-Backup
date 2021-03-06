/****** Object:  Table [dbo].[sf_permissions_inheritance_map]    Script Date: 5/15/2018 12:01:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_permissions_inheritance_map](
	[sf_prmssons_inheritance_map_id] [int] NOT NULL,
	[object_id] [uniqueidentifier] NULL,
	[child_object_id] [uniqueidentifier] NULL,
	[child_object_type_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_prmssns_nhrtnc__5FB021A6] PRIMARY KEY CLUSTERED 
(
	[sf_prmssons_inheritance_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_pinhmap_object_id]    Script Date: 5/15/2018 12:01:57 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pinhmap_object_id] ON [dbo].[sf_permissions_inheritance_map]
(
	[object_id] ASC,
	[child_object_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
