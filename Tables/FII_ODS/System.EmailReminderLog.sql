/****** Object:  Table [System].[EmailReminderLog]    Script Date: 5/15/2018 11:59:47 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [System].[EmailReminderLog](
	[LogKey] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Recipient] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NumberOfDaysToChange] [int] NOT NULL,
 CONSTRAINT [PK_EmailReminderLog] PRIMARY KEY CLUSTERED 
(
	[LogKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [System].[EmailReminderLog] ADD  CONSTRAINT [DF_EmailReminderLog_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
