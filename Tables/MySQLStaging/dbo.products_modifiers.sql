/****** Object:  Table [dbo].[products_modifiers]    Script Date: 5/15/2018 12:04:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[products_modifiers](
	[product_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modifier_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modifier_quantity] [int] NOT NULL,
	[modifier_on] [smallint] NOT NULL,
	[ecommercable] [smallint] NULL,
	[modifier_order] [int] NOT NULL,
	[products_modifiers_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_products_modifiers_products_modifiers_id] PRIMARY KEY CLUSTERED 
(
	[products_modifiers_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [modifier_id]    Script Date: 5/15/2018 12:04:25 PM ******/
CREATE NONCLUSTERED INDEX [modifier_id] ON [dbo].[products_modifiers]
(
	[modifier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [modifier_order]    Script Date: 5/15/2018 12:04:25 PM ******/
CREATE NONCLUSTERED INDEX [modifier_order] ON [dbo].[products_modifiers]
(
	[modifier_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [product_id]    Script Date: 5/15/2018 12:04:25 PM ******/
CREATE NONCLUSTERED INDEX [product_id] ON [dbo].[products_modifiers]
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[products_modifiers] ADD  DEFAULT ((1)) FOR [modifier_quantity]
ALTER TABLE [dbo].[products_modifiers] ADD  DEFAULT ((0)) FOR [modifier_on]
ALTER TABLE [dbo].[products_modifiers] ADD  DEFAULT ((0)) FOR [ecommercable]
ALTER TABLE [dbo].[products_modifiers] ADD  DEFAULT ((0)) FOR [modifier_order]
ALTER TABLE [dbo].[products_modifiers] ADD  DEFAULT (N'') FOR [products_modifiers_id]
GO
