/****** Object:  Table [dbo].[coupon_rules]    Script Date: 5/15/2018 12:04:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[coupon_rules](
	[coupon_rule_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coupon_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_set_wide_requirement] [smallint] NOT NULL,
	[is_tiered] [smallint] NOT NULL,
	[coupon_rule_type_id] [int] NOT NULL,
	[discount_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[compound_type] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active] [smallint] NOT NULL,
 CONSTRAINT [PK_coupon_rules_coupon_rule_id] PRIMARY KEY CLUSTERED 
(
	[coupon_rule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[coupon_rules] ADD  DEFAULT (NULL) FOR [coupon_id]
ALTER TABLE [dbo].[coupon_rules] ADD  DEFAULT ((0)) FOR [is_set_wide_requirement]
ALTER TABLE [dbo].[coupon_rules] ADD  DEFAULT ((0)) FOR [is_tiered]
ALTER TABLE [dbo].[coupon_rules] ADD  DEFAULT (NULL) FOR [discount_id]
ALTER TABLE [dbo].[coupon_rules] ADD  DEFAULT (NULL) FOR [compound_type]
ALTER TABLE [dbo].[coupon_rules] ADD  DEFAULT ((1)) FOR [active]
GO
