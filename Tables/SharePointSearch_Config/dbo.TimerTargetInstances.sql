/****** Object:  Table [dbo].[TimerTargetInstances]    Script Date: 5/15/2018 12:06:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TimerTargetInstances](
	[JobId] [uniqueidentifier] NOT NULL,
	[TargetInstanceId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_TimerTargetInstances_JobId_TargetInstanceId]    Script Date: 5/15/2018 12:06:08 PM ******/
CREATE CLUSTERED INDEX [IX_TimerTargetInstances_JobId_TargetInstanceId] ON [dbo].[TimerTargetInstances]
(
	[JobId] ASC,
	[TargetInstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
