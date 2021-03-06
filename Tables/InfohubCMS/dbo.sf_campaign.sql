/****** Object:  Table [dbo].[sf_campaign]    Script Date: 5/15/2018 12:01:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_campaign](
	[use_google_tracking] [tinyint] NULL,
	[short_id] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[rootCampaign_id] [uniqueidentifier] NULL,
	[reply_to_email] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[related_notification_job] [uniqueidentifier] NULL,
	[nme] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[message_subject] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id3] [uniqueidentifier] NULL,
	[id2] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[is_ready_for_sending] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[from_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[delivery_date] [datetime] NULL,
	[campaign_state] [int] NOT NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_campaign] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
