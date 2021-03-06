/****** Object:  Table [dbo].[sysjobstepslogs]    Script Date: 5/15/2018 12:03:04 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysjobstepslogs](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[log] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[date_created] [datetime] NOT NULL,
	[date_modified] [datetime] NOT NULL,
	[log_size] [bigint] NULL,
	[step_uid] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[sysjobstepslogs] ADD  DEFAULT (getdate()) FOR [date_created]
ALTER TABLE [dbo].[sysjobstepslogs] ADD  DEFAULT (getdate()) FOR [date_modified]
ALTER TABLE [dbo].[sysjobstepslogs]  WITH CHECK ADD FOREIGN KEY([step_uid])
REFERENCES [dbo].[sysjobsteps] ([step_uid])
ON DELETE CASCADE
GO
