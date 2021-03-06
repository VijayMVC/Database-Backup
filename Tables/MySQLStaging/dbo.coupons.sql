/****** Object:  Table [dbo].[coupons]    Script Date: 5/15/2018 12:04:01 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[coupons](
	[coupon_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[marketing_campaign_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[code] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[start_date] [date] NULL,
	[expiration_date] [date] NULL,
	[date_created] [datetime] NOT NULL,
	[cannot_be_combined] [smallint] NOT NULL,
	[active] [int] NULL,
	[list_order] [bigint] NULL,
 CONSTRAINT [PK_coupons_coupon_id] PRIMARY KEY CLUSTERED 
(
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:04:01 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[coupons]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [list_order]    Script Date: 5/15/2018 12:04:01 PM ******/
CREATE NONCLUSTERED INDEX [list_order] ON [dbo].[coupons]
(
	[list_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [marketing_campaign_id]    Script Date: 5/15/2018 12:04:01 PM ******/
CREATE NONCLUSTERED INDEX [marketing_campaign_id] ON [dbo].[coupons]
(
	[marketing_campaign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (NULL) FOR [marketing_campaign_id]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (NULL) FOR [name]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (NULL) FOR [description]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (NULL) FOR [code]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (NULL) FOR [start_date]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (NULL) FOR [expiration_date]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (getdate()) FOR [date_created]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT ((0)) FOR [cannot_be_combined]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (NULL) FOR [active]
ALTER TABLE [dbo].[coupons] ADD  DEFAULT ((0)) FOR [list_order]
GO
