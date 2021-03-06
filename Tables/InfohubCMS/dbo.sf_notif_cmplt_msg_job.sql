/****** Object:  Table [dbo].[sf_notif_cmplt_msg_job]    Script Date: 5/15/2018 12:01:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_notif_cmplt_msg_job](
	[sf_notif_cmplt_msg_job_id] [int] NOT NULL,
	[total_delivery_subscribers] [int] NULL,
	[timeStarted] [datetime] NOT NULL,
	[timeCompleted] [datetime] NOT NULL,
	[module_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NULL,
	[description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[account_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [pk_sf_notif_cmplt_msg_job] PRIMARY KEY CLUSTERED 
(
	[sf_notif_cmplt_msg_job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
