/****** Object:  Table [dbo].[RunningJobs]    Script Date: 5/15/2018 12:05:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RunningJobs](
	[JobID] [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ComputerName] [nvarchar](32) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RequestName] [nvarchar](425) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[RequestPath] [nvarchar](425) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Description] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Timeout] [int] NOT NULL,
	[JobAction] [smallint] NOT NULL,
	[JobType] [smallint] NOT NULL,
	[JobStatus] [smallint] NOT NULL,
 CONSTRAINT [PK_RunningJobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_RunningJobsStatus]    Script Date: 5/15/2018 12:05:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RunningJobsStatus] ON [dbo].[RunningJobs]
(
	[ComputerName] ASC,
	[JobType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
