/****** Object:  Table [dbo].[log_shipping_monitor_alert]    Script Date: 5/15/2018 12:02:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[log_shipping_monitor_alert](
	[alert_job_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[alert_job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
