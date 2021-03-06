/****** Object:  Table [dbo].[sysdbmaintplan_history]    Script Date: 5/15/2018 12:03:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysdbmaintplan_history](
	[sequence_id] [int] IDENTITY(1,1) NOT NULL,
	[plan_id] [uniqueidentifier] NOT NULL,
	[plan_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[database_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[server_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[activity] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[succeeded] [bit] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[duration] [int] NULL,
	[start_time]  AS (dateadd(second, -[duration],[end_time])),
	[error_number] [int] NOT NULL,
	[message] [nvarchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
UNIQUE NONCLUSTERED 
(
	[sequence_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [clust]    Script Date: 5/15/2018 12:03:03 PM ******/
CREATE CLUSTERED INDEX [clust] ON [dbo].[sysdbmaintplan_history]
(
	[plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[sysdbmaintplan_history] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [plan_id]
ALTER TABLE [dbo].[sysdbmaintplan_history] ADD  DEFAULT ('All ad-hoc plans') FOR [plan_name]
ALTER TABLE [dbo].[sysdbmaintplan_history] ADD  DEFAULT (CONVERT([sysname],serverproperty('ServerName'))) FOR [server_name]
ALTER TABLE [dbo].[sysdbmaintplan_history] ADD  DEFAULT ((1)) FOR [succeeded]
ALTER TABLE [dbo].[sysdbmaintplan_history] ADD  DEFAULT (getdate()) FOR [end_time]
ALTER TABLE [dbo].[sysdbmaintplan_history] ADD  DEFAULT ((0)) FOR [duration]
ALTER TABLE [dbo].[sysdbmaintplan_history] ADD  DEFAULT ((0)) FOR [error_number]
GO
