/****** Object:  Table [dbo].[coupon_rule_types]    Script Date: 5/15/2018 12:04:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[coupon_rule_types](
	[coupon_rule_type_id] [int] IDENTITY(3,1) NOT NULL,
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[label] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[active] [smallint] NOT NULL,
 CONSTRAINT [PK_coupon_rule_types_coupon_rule_type_id] PRIMARY KEY CLUSTERED 
(
	[coupon_rule_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[coupon_rule_types] ADD  DEFAULT ((1)) FOR [active]
GO
