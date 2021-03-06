/****** Object:  Table [dbo].[sysmaintplan_subplans]    Script Date: 5/15/2018 12:03:07 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysmaintplan_subplans](
	[subplan_id] [uniqueidentifier] NOT NULL,
	[subplan_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[subplan_description] [nvarchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[plan_id] [uniqueidentifier] NOT NULL,
	[job_id] [uniqueidentifier] NOT NULL,
	[msx_job_id] [uniqueidentifier] NULL,
	[schedule_id] [int] NULL,
	[msx_plan] [bit] NOT NULL,
 CONSTRAINT [PK_sysmaintplan_subplan] PRIMARY KEY CLUSTERED 
(
	[subplan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysmaintplan_subplans] ADD  DEFAULT (NULL) FOR [msx_job_id]
ALTER TABLE [dbo].[sysmaintplan_subplans] ADD  DEFAULT ((0)) FOR [msx_plan]
ALTER TABLE [dbo].[sysmaintplan_subplans]  WITH CHECK ADD  CONSTRAINT [FK_subplan_job_id] FOREIGN KEY([job_id])
REFERENCES [dbo].[sysjobs] ([job_id])
ALTER TABLE [dbo].[sysmaintplan_subplans] CHECK CONSTRAINT [FK_subplan_job_id]
ALTER TABLE [dbo].[sysmaintplan_subplans]  WITH CHECK ADD  CONSTRAINT [FK_subplan_msx_job_id] FOREIGN KEY([msx_job_id])
REFERENCES [dbo].[sysjobs] ([job_id])
ALTER TABLE [dbo].[sysmaintplan_subplans] CHECK CONSTRAINT [FK_subplan_msx_job_id]
ALTER TABLE [dbo].[sysmaintplan_subplans]  WITH CHECK ADD  CONSTRAINT [FK_subplan_schedule_id] FOREIGN KEY([schedule_id])
REFERENCES [dbo].[sysschedules] ([schedule_id])
ALTER TABLE [dbo].[sysmaintplan_subplans] CHECK CONSTRAINT [FK_subplan_schedule_id]
GO
