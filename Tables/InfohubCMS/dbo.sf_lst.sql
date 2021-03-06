/****** Object:  Table [dbo].[sf_lst]    Script Date: 5/15/2018 12:01:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_lst](
	[wlcme_template_id] [uniqueidentifier] NULL,
	[welcome_message_subject] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[welcome_message_email_address] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[unsubscribe_page_id] [uniqueidentifier] NULL,
	[total_unsubscriptions] [int] NOT NULL,
	[title_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subscription_reminder_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[send_welcome_message] [tinyint] NOT NULL,
	[send_good_bye_message] [tinyint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[gd_by_template_id] [uniqueidentifier] NULL,
	[good_bye_message_subject] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[good_bye_message_email_address] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_subject_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_reply_to_email_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_from_name_] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_lst] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
