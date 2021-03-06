/****** Object:  Table [dbo].[dm_products_fsproduct_xr]    Script Date: 5/15/2018 12:04:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[dm_products_fsproduct_xr](
	[products_fsproduct_xr_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[product_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[fs_product_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[create_dt] [datetime2](0) NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [fs_product_id]    Script Date: 5/15/2018 12:04:03 PM ******/
CREATE NONCLUSTERED INDEX [fs_product_id] ON [dbo].[dm_products_fsproduct_xr]
(
	[fs_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [product_id]    Script Date: 5/15/2018 12:04:03 PM ******/
CREATE NONCLUSTERED INDEX [product_id] ON [dbo].[dm_products_fsproduct_xr]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [products_fsproduct_xr_id]    Script Date: 5/15/2018 12:04:03 PM ******/
CREATE NONCLUSTERED INDEX [products_fsproduct_xr_id] ON [dbo].[dm_products_fsproduct_xr]
(
	[products_fsproduct_xr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[dm_products_fsproduct_xr] ADD  DEFAULT (NULL) FOR [products_fsproduct_xr_id]
ALTER TABLE [dbo].[dm_products_fsproduct_xr] ADD  DEFAULT (NULL) FOR [create_dt]
GO
