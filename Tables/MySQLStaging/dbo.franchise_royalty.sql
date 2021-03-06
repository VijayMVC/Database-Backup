/****** Object:  Table [dbo].[franchise_royalty]    Script Date: 5/15/2018 12:04:10 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[franchise_royalty](
	[franchise_royalty_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[period_name] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nac_royalty_rate] [decimal](6, 2) NULL,
	[franchise_royalty_rate] [decimal](6, 2) NULL,
	[sales_total] [decimal](10, 2) NULL,
	[royalty_sales_total] [decimal](10, 2) NULL,
	[royalty_subtotal] [decimal](10, 2) NULL,
	[adjustment_amount] [decimal](10, 2) NULL,
	[royalty_total] [decimal](10, 2) NULL,
	[period_start_date] [date] NULL,
	[created_on] [datetime2](0) NULL,
	[nac_adjustment_amount] [decimal](10, 2) NULL,
	[wip_total] [decimal](10, 2) NULL,
	[rejected_total] [decimal](10, 2) NULL,
	[ar_total] [decimal](10, 2) NULL,
 CONSTRAINT [PK_franchise_royalty_franchise_royalty_id] PRIMARY KEY CLUSTERED 
(
	[franchise_royalty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:04:10 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[franchise_royalty]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [period_name]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [nac_royalty_rate]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [franchise_royalty_rate]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [sales_total]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [royalty_sales_total]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [royalty_subtotal]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [adjustment_amount]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [royalty_total]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [period_start_date]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [created_on]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [nac_adjustment_amount]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [wip_total]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [rejected_total]
ALTER TABLE [dbo].[franchise_royalty] ADD  DEFAULT (NULL) FOR [ar_total]
GO
