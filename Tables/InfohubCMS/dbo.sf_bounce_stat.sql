/****** Object:  Table [dbo].[sf_bounce_stat]    Script Date: 5/15/2018 12:01:24 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_bounce_stat](
	[sf_subscriber_id] [uniqueidentifier] NULL,
	[smtp_status] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[retry_count] [int] NOT NULL,
	[message_status] [int] NULL,
	[last_modified] [datetime] NOT NULL,
	[is_processing] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[sf_campaign_id] [uniqueidentifier] NULL,
	[bounce_status] [int] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[additional_info] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_bounce_stat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_sf_bounce_stat_camp_subscr]    Script Date: 5/15/2018 12:01:24 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_bounce_stat_camp_subscr] ON [dbo].[sf_bounce_stat]
(
	[sf_campaign_id] ASC,
	[sf_subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
