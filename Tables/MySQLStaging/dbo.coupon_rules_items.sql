/****** Object:  Table [dbo].[coupon_rules_items]    Script Date: 5/15/2018 12:04:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[coupon_rules_items](
	[coupon_rules_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coupon_rule_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[table_type] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[table_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[value] [int] NULL,
	[type] [nvarchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[has_substitutes] [smallint] NOT NULL,
	[substitution_type] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[primary_discount_item] [smallint] NOT NULL,
	[active] [smallint] NOT NULL,
 CONSTRAINT [PK_coupon_rules_items_coupon_rules_item_id] PRIMARY KEY CLUSTERED 
(
	[coupon_rules_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[coupon_rules_items] ADD  DEFAULT (NULL) FOR [coupon_rule_id]
ALTER TABLE [dbo].[coupon_rules_items] ADD  DEFAULT (NULL) FOR [table_id]
ALTER TABLE [dbo].[coupon_rules_items] ADD  DEFAULT (NULL) FOR [value]
ALTER TABLE [dbo].[coupon_rules_items] ADD  DEFAULT ((0)) FOR [has_substitutes]
ALTER TABLE [dbo].[coupon_rules_items] ADD  DEFAULT (NULL) FOR [substitution_type]
ALTER TABLE [dbo].[coupon_rules_items] ADD  DEFAULT ((1)) FOR [primary_discount_item]
ALTER TABLE [dbo].[coupon_rules_items] ADD  DEFAULT ((1)) FOR [active]
GO
