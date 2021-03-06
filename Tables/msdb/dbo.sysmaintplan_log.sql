/****** Object:  Table [dbo].[sysmaintplan_log]    Script Date: 5/15/2018 12:03:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmaintplan_log](
	[task_detail_id] [uniqueidentifier] NOT NULL,
	[plan_id] [uniqueidentifier] NULL,
	[subplan_id] [uniqueidentifier] NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[succeeded] [bit] NULL,
	[logged_remotely] [bit] NOT NULL,
	[source_server_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[plan_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subplan_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_sysmaintplan_taskdetail_id] PRIMARY KEY CLUSTERED 
(
	[task_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysmaintplan_log] ADD  DEFAULT ((0)) FOR [logged_remotely]
ALTER TABLE [dbo].[sysmaintplan_log]  WITH CHECK ADD  CONSTRAINT [FK_sysmaintplan_log_subplan_id] FOREIGN KEY([subplan_id])
REFERENCES [dbo].[sysmaintplan_subplans] ([subplan_id])
ALTER TABLE [dbo].[sysmaintplan_log] CHECK CONSTRAINT [FK_sysmaintplan_log_subplan_id]
GO
