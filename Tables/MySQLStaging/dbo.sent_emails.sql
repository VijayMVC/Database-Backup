/****** Object:  Table [dbo].[sent_emails]    Script Date: 5/15/2018 12:04:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sent_emails](
	[sent_email_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mail_from] [nvarchar](254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mail_to] [nvarchar](254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[mail_subject] [nvarchar](78) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sent_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sent_on] [datetime] NULL,
	[state] [int] NULL,
	[message] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_sent_emails] PRIMARY KEY CLUSTERED 
(
	[sent_email_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT ('') FOR [sent_email_id]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT (NULL) FOR [franchise_id]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT (NULL) FOR [mail_from]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT (NULL) FOR [mail_to]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT (NULL) FOR [mail_subject]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT (NULL) FOR [sent_by]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT (NULL) FOR [sent_on]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT (NULL) FOR [state]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT ('') FOR [message]
ALTER TABLE [dbo].[sent_emails] ADD  DEFAULT (NULL) FOR [updated_on]
GO
