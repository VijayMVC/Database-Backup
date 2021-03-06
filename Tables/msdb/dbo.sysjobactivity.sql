/****** Object:  Table [dbo].[sysjobactivity]    Script Date: 5/15/2018 12:03:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysjobactivity](
	[session_id] [int] NOT NULL,
	[job_id] [uniqueidentifier] NOT NULL,
	[run_requested_date] [datetime] NULL,
	[run_requested_source] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[queued_date] [datetime] NULL,
	[start_execution_date] [datetime] NULL,
	[last_executed_step_id] [int] NULL,
	[last_executed_step_date] [datetime] NULL,
	[stop_execution_date] [datetime] NULL,
	[job_history_id] [int] NULL,
	[next_scheduled_run_date] [datetime] NULL
) ON [PRIMARY]

/****** Object:  Index [clust]    Script Date: 5/15/2018 12:03:03 PM ******/
CREATE UNIQUE CLUSTERED INDEX [clust] ON [dbo].[sysjobactivity]
(
	[session_id] ASC,
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[sysjobactivity]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[sysjobs] ([job_id])
ON DELETE CASCADE
ALTER TABLE [dbo].[sysjobactivity]  WITH CHECK ADD FOREIGN KEY([session_id])
REFERENCES [dbo].[syssessions] ([session_id])
GO
