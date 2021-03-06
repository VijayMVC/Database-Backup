/****** Object:  Table [dbo].[job_offers]    Script Date: 5/15/2018 12:04:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[job_offers](
	[job_offer_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[job_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[coupon_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[marketing_campaign_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[active] [smallint] NOT NULL,
 CONSTRAINT [PK_job_offers_job_offer_id] PRIMARY KEY CLUSTERED 
(
	[job_offer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [coupon_id]    Script Date: 5/15/2018 12:04:15 PM ******/
CREATE NONCLUSTERED INDEX [coupon_id] ON [dbo].[job_offers]
(
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [job_id]    Script Date: 5/15/2018 12:04:15 PM ******/
CREATE NONCLUSTERED INDEX [job_id] ON [dbo].[job_offers]
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [marketing_campaign_id]    Script Date: 5/15/2018 12:04:15 PM ******/
CREATE NONCLUSTERED INDEX [marketing_campaign_id] ON [dbo].[job_offers]
(
	[marketing_campaign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[job_offers] ADD  DEFAULT (NULL) FOR [coupon_id]
ALTER TABLE [dbo].[job_offers] ADD  DEFAULT (NULL) FOR [marketing_campaign_id]
GO
