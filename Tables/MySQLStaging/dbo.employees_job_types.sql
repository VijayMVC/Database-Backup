/****** Object:  Table [dbo].[employees_job_types]    Script Date: 5/15/2018 12:04:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[employees_job_types](
	[employee_job_type_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[users_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[job_type_id] [smallint] NOT NULL,
	[active] [smallint] NOT NULL,
 CONSTRAINT [PK_employees_job_types_employee_job_type_id] PRIMARY KEY CLUSTERED 
(
	[employee_job_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [users_id]    Script Date: 5/15/2018 12:04:05 PM ******/
CREATE NONCLUSTERED INDEX [users_id] ON [dbo].[employees_job_types]
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[employees_job_types] ADD  DEFAULT ((1)) FOR [active]
GO
