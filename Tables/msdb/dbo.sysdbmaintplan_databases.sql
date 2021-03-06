/****** Object:  Table [dbo].[sysdbmaintplan_databases]    Script Date: 5/15/2018 12:03:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysdbmaintplan_databases](
	[plan_id] [uniqueidentifier] NOT NULL,
	[database_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
UNIQUE CLUSTERED 
(
	[plan_id] ASC,
	[database_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysdbmaintplan_databases]  WITH CHECK ADD FOREIGN KEY([plan_id])
REFERENCES [dbo].[sysdbmaintplans] ([plan_id])
GO
