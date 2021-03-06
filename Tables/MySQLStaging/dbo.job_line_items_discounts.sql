/****** Object:  Table [dbo].[job_line_items_discounts]    Script Date: 5/15/2018 12:04:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[job_line_items_discounts](
	[job_line_item_discount_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[job_line_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[discount_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coupon_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[order] [int] NOT NULL,
	[value] [numeric](5, 2) NOT NULL,
	[dollar_value] [decimal](12, 2) NOT NULL,
	[active] [smallint] NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NOT NULL,
	[last_modified_on] [datetime2](0) NOT NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_job_line_items_discounts_job_line_item_discount_id] PRIMARY KEY CLUSTERED 
(
	[job_line_item_discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [coupon_id]    Script Date: 5/15/2018 12:04:14 PM ******/
CREATE NONCLUSTERED INDEX [coupon_id] ON [dbo].[job_line_items_discounts]
(
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [discount_id]    Script Date: 5/15/2018 12:04:14 PM ******/
CREATE NONCLUSTERED INDEX [discount_id] ON [dbo].[job_line_items_discounts]
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [job_line_item_id]    Script Date: 5/15/2018 12:04:14 PM ******/
CREATE NONCLUSTERED INDEX [job_line_item_id] ON [dbo].[job_line_items_discounts]
(
	[job_line_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[job_line_items_discounts] ADD  DEFAULT (NULL) FOR [coupon_id]
ALTER TABLE [dbo].[job_line_items_discounts] ADD  DEFAULT ((1)) FOR [active]
GO
