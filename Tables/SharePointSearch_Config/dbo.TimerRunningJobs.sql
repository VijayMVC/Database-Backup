/****** Object:  Table [dbo].[TimerRunningJobs]    Script Date: 5/15/2018 12:06:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TimerRunningJobs](
	[ServiceId] [uniqueidentifier] NOT NULL,
	[VirtualServerId] [uniqueidentifier] NULL,
	[JobId] [uniqueidentifier] NOT NULL,
	[JobTitle] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ServerName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[Status] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[CurrentTarget] [int] NOT NULL,
	[TargetCount] [int] NOT NULL,
	[CurrentTargetPercentDone] [int] NULL
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_TimerRunningJobs_ServiceId_VirtualServerId_JobId_ServerName]    Script Date: 5/15/2018 12:06:08 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IX_TimerRunningJobs_ServiceId_VirtualServerId_JobId_ServerName] ON [dbo].[TimerRunningJobs]
(
	[ServiceId] ASC,
	[VirtualServerId] ASC,
	[JobId] ASC,
	[ServerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_TimerRunningJobs_ServerName_Status]    Script Date: 5/15/2018 12:06:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_TimerRunningJobs_ServerName_Status] ON [dbo].[TimerRunningJobs]
(
	[ServerName] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
