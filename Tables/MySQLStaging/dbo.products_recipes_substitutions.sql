/****** Object:  Table [dbo].[products_recipes_substitutions]    Script Date: 5/15/2018 12:04:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[products_recipes_substitutions](
	[product_recipe_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[material_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[substitution_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_products_recipes_substitutions_substitution_id] PRIMARY KEY CLUSTERED 
(
	[substitution_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [product_recipe_id]    Script Date: 5/15/2018 12:04:26 PM ******/
CREATE NONCLUSTERED INDEX [product_recipe_id] ON [dbo].[products_recipes_substitutions]
(
	[product_recipe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[products_recipes_substitutions] ADD  DEFAULT (N'') FOR [substitution_id]
GO
