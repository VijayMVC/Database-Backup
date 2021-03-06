/****** Object:  Table [dbo].[xf_user_upgrade_log]    Script Date: 5/15/2018 12:00:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[xf_user_upgrade_log](
	[user_upgrade_log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_upgrade_record_id] [bigint] NOT NULL,
	[processor] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[transaction_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[transaction_type] [nvarchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[message] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[transaction_details] [varbinary](max) NOT NULL,
	[log_date] [bigint] NOT NULL,
	[subscriber_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_xf_user_upgrade_log_user_upgrade_log_id] PRIMARY KEY CLUSTERED 
(
	[user_upgrade_log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [log_date]    Script Date: 5/15/2018 12:00:42 PM ******/
CREATE NONCLUSTERED INDEX [log_date] ON [dbo].[xf_user_upgrade_log]
(
	[log_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [subscriber_id]    Script Date: 5/15/2018 12:00:42 PM ******/
CREATE NONCLUSTERED INDEX [subscriber_id] ON [dbo].[xf_user_upgrade_log]
(
	[subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [transaction_id]    Script Date: 5/15/2018 12:00:42 PM ******/
CREATE NONCLUSTERED INDEX [transaction_id] ON [dbo].[xf_user_upgrade_log]
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[xf_user_upgrade_log] ADD  DEFAULT (N'') FOR [message]
ALTER TABLE [dbo].[xf_user_upgrade_log] ADD  DEFAULT ((0)) FOR [log_date]
ALTER TABLE [dbo].[xf_user_upgrade_log] ADD  DEFAULT (N'') FOR [subscriber_id]
GO
