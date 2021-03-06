/****** Object:  Table [dbo].[sysdbmaintplan_jobs]    Script Date: 5/15/2018 12:03:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysdbmaintplan_jobs](
	[plan_id] [uniqueidentifier] NOT NULL,
	[job_id] [uniqueidentifier] NOT NULL,
UNIQUE CLUSTERED 
(
	[plan_id] ASC,
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysdbmaintplan_jobs]  WITH CHECK ADD FOREIGN KEY([plan_id])
REFERENCES [dbo].[sysdbmaintplans] ([plan_id])
GO
