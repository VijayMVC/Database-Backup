/****** Object:  Table [dbo].[materials]    Script Date: 5/15/2018 12:04:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[materials](
	[material_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[parent_material_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[entity_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[type_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[name] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[length] [decimal](12, 4) NOT NULL,
	[length_unit_id] [int] NULL,
	[width] [decimal](12, 4) NOT NULL,
	[width_unit_id] [int] NULL,
	[height] [decimal](12, 4) NOT NULL,
	[height_unit_id] [int] NULL,
	[weight] [decimal](12, 4) NOT NULL,
	[price] [decimal](8, 2) NOT NULL,
	[units] [smallint] NOT NULL,
	[unit_type_id] [smallint] NOT NULL,
	[unit_qty] [decimal](12, 6) NOT NULL,
	[unit_qty_unit_id] [int] NULL,
	[unit_price] [decimal](12, 6) NOT NULL,
	[unit_weight] [decimal](12, 6) NOT NULL,
	[waste_factor] [decimal](8, 4) NULL,
	[description] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active] [smallint] NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_modified_on] [datetime] NOT NULL,
	[corporate_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_materials_material_id] PRIMARY KEY CLUSTERED 
(
	[material_id] ASC,
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [category_id]    Script Date: 5/15/2018 12:04:18 PM ******/
CREATE NONCLUSTERED INDEX [category_id] ON [dbo].[materials]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [corporate_id]    Script Date: 5/15/2018 12:04:18 PM ******/
CREATE NONCLUSTERED INDEX [corporate_id] ON [dbo].[materials]
(
	[corporate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [entity_id]    Script Date: 5/15/2018 12:04:18 PM ******/
CREATE NONCLUSTERED INDEX [entity_id] ON [dbo].[materials]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [type_id]    Script Date: 5/15/2018 12:04:18 PM ******/
CREATE NONCLUSTERED INDEX [type_id] ON [dbo].[materials]
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [parent_material_id]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [entity_id]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((0.0000)) FOR [length]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [length_unit_id]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((0.0000)) FOR [width]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [width_unit_id]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((0.0000)) FOR [height]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [height_unit_id]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((0.0000)) FOR [weight]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((1)) FOR [units]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((1)) FOR [unit_type_id]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((1.000000)) FOR [unit_qty]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [unit_qty_unit_id]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((0.000000)) FOR [unit_price]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((0.000000)) FOR [unit_weight]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [waste_factor]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [description]
ALTER TABLE [dbo].[materials] ADD  DEFAULT ((1)) FOR [active]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (getdate()) FOR [last_modified_on]
ALTER TABLE [dbo].[materials] ADD  DEFAULT (NULL) FOR [corporate_id]
GO
