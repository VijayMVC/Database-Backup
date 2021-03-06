/****** Object:  Table [dbo].[modifier_pricing]    Script Date: 5/15/2018 12:04:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[modifier_pricing](
	[modifier_pricing_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[modifier_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[one_time_charge] [decimal](10, 2) NULL,
	[per_piece] [decimal](10, 2) NULL,
	[per_modifier] [decimal](10, 2) NULL,
	[per_modifier_per_piece] [decimal](10, 2) NULL,
	[double_cost] [decimal](10, 2) NULL,
	[percent_of_base] [decimal](5, 2) NULL,
	[charge_per_unit_of_area] [decimal](10, 2) NULL,
	[charge_per_unit_of_length] [decimal](10, 2) NULL,
	[charge_per_unit_of_perimeter] [decimal](10, 2) NULL,
	[unit_id] [int] NOT NULL,
 CONSTRAINT [PK_modifier_pricing_modifier_pricing_id] PRIMARY KEY CLUSTERED 
(
	[modifier_pricing_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [modifier_id]    Script Date: 5/15/2018 12:04:19 PM ******/
CREATE NONCLUSTERED INDEX [modifier_id] ON [dbo].[modifier_pricing]
(
	[modifier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (N'') FOR [modifier_id]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [one_time_charge]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [per_piece]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [per_modifier]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [per_modifier_per_piece]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [double_cost]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [percent_of_base]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [charge_per_unit_of_area]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [charge_per_unit_of_length]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT (NULL) FOR [charge_per_unit_of_perimeter]
ALTER TABLE [dbo].[modifier_pricing] ADD  DEFAULT ((1)) FOR [unit_id]
GO
