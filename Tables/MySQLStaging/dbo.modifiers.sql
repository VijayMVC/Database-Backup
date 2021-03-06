/****** Object:  Table [dbo].[modifiers]    Script Date: 5/15/2018 12:04:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[modifiers](
	[modifier_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active] [smallint] NOT NULL,
	[calculation_type] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modifier_special_type] [nvarchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price_type_id] [int] NOT NULL,
	[overall_minimum] [decimal](8, 2) NULL,
	[per_piece_minimum] [decimal](8, 2) NULL,
	[per_modifier_minimum] [decimal](8, 2) NULL,
	[double_minimum] [smallint] NOT NULL,
	[quantity_based] [smallint] NOT NULL,
	[image_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[last_modified_on] [datetime] NOT NULL,
	[corporate_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[tax_code_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_modifiers_modifier_id] PRIMARY KEY CLUSTERED 
(
	[modifier_id] ASC,
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [corporate_id]    Script Date: 5/15/2018 12:04:20 PM ******/
CREATE NONCLUSTERED INDEX [corporate_id] ON [dbo].[modifiers]
(
	[corporate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [image_id]    Script Date: 5/15/2018 12:04:20 PM ******/
CREATE NONCLUSTERED INDEX [image_id] ON [dbo].[modifiers]
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [tax_code_id]    Script Date: 5/15/2018 12:04:20 PM ******/
CREATE NONCLUSTERED INDEX [tax_code_id] ON [dbo].[modifiers]
(
	[tax_code_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT ((1)) FOR [active]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (N'adds') FOR [calculation_type]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (NULL) FOR [modifier_special_type]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (NULL) FOR [overall_minimum]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (NULL) FOR [per_piece_minimum]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (NULL) FOR [per_modifier_minimum]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT ((0)) FOR [double_minimum]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT ((0)) FOR [quantity_based]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (NULL) FOR [image_id]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (getdate()) FOR [last_modified_on]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (NULL) FOR [corporate_id]
ALTER TABLE [dbo].[modifiers] ADD  DEFAULT (N'1') FOR [tax_code_id]
GO
