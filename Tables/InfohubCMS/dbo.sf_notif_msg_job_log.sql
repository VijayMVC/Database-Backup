/****** Object:  Table [dbo].[sf_notif_msg_job_log]    Script Date: 5/15/2018 12:01:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_notif_msg_job_log](
	[subscription_id] [uniqueidentifier] NOT NULL,
	[message_job_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_notif_msg_job_log] PRIMARY KEY CLUSTERED 
(
	[message_job_id] ASC,
	[subscription_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
