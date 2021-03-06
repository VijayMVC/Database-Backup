/****** Object:  Table [dbo].[sf_link_click_stat]    Script Date: 5/15/2018 12:01:43 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_link_click_stat](
	[sf_link_click_stat_id] [int] NOT NULL,
	[url] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subscriber_id] [uniqueidentifier] NULL,
	[date_time_clicked] [datetime] NOT NULL,
	[campaign_id] [uniqueidentifier] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_link_click_stat] PRIMARY KEY CLUSTERED 
(
	[sf_link_click_stat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_click_stat_camp_subscr]    Script Date: 5/15/2018 12:01:43 PM ******/
CREATE NONCLUSTERED INDEX [idx_click_stat_camp_subscr] ON [dbo].[sf_link_click_stat]
(
	[campaign_id] ASC,
	[subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
