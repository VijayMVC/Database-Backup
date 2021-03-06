/****** Object:  Table [dbo].[sysdbmaintplans]    Script Date: 5/15/2018 12:03:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysdbmaintplans](
	[plan_id] [uniqueidentifier] NOT NULL,
	[plan_name] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[date_created] [datetime] NOT NULL,
	[owner] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[max_history_rows] [int] NOT NULL,
	[remote_history_server] [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[max_remote_history_rows] [int] NOT NULL,
	[user_defined_1] [int] NULL,
	[user_defined_2] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_defined_3] [datetime] NULL,
	[user_defined_4] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[sysdbmaintplans] ADD  DEFAULT (getdate()) FOR [date_created]
ALTER TABLE [dbo].[sysdbmaintplans] ADD  DEFAULT (isnull(nt_client(),suser_sname())) FOR [owner]
ALTER TABLE [dbo].[sysdbmaintplans] ADD  DEFAULT ((0)) FOR [max_history_rows]
ALTER TABLE [dbo].[sysdbmaintplans] ADD  DEFAULT ('') FOR [remote_history_server]
ALTER TABLE [dbo].[sysdbmaintplans] ADD  DEFAULT ((0)) FOR [max_remote_history_rows]
GO
