/****** Object:  Table [dbo].[products_recipes]    Script Date: 5/15/2018 12:04:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[products_recipes](
	[product_recipe_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[product_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[device_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[substrate_material_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[media_material_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ink_foil_material_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[passes] [tinyint] NOT NULL,
	[recipe_order] [int] NOT NULL,
	[active_flag] [smallint] NULL,
 CONSTRAINT [PK_products_recipes_product_recipe_id] PRIMARY KEY CLUSTERED 
(
	[product_recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [device_id]    Script Date: 5/15/2018 12:04:26 PM ******/
CREATE NONCLUSTERED INDEX [device_id] ON [dbo].[products_recipes]
(
	[device_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [product_id]    Script Date: 5/15/2018 12:04:26 PM ******/
CREATE NONCLUSTERED INDEX [product_id] ON [dbo].[products_recipes]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[products_recipes] ADD  DEFAULT ((1)) FOR [passes]
ALTER TABLE [dbo].[products_recipes] ADD  DEFAULT ((0)) FOR [recipe_order]
ALTER TABLE [dbo].[products_recipes] ADD  DEFAULT (NULL) FOR [active_flag]
GO
