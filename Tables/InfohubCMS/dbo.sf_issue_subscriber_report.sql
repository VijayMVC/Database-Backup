/****** Object:  Table [dbo].[sf_issue_subscriber_report]    Script Date: 5/15/2018 12:01:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_issue_subscriber_report](
	[sf_subscriber_id] [uniqueidentifier] NULL,
	[message_status] [int] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[sf_campaign_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[has_unsubscribed] [tinyint] NOT NULL,
	[has_clicked] [tinyint] NOT NULL,
	[delivery_status] [int] NOT NULL,
	[date_opened] [datetime] NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_issue_subscriber_report] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [idx_iss_sub_rprt_issue_subscr]    Script Date: 5/15/2018 12:01:42 PM ******/
CREATE NONCLUSTERED INDEX [idx_iss_sub_rprt_issue_subscr] ON [dbo].[sf_issue_subscriber_report]
(
	[sf_campaign_id] ASC,
	[sf_subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
