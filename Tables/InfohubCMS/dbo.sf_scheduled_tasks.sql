/****** Object:  Table [dbo].[sf_scheduled_tasks]    Script Date: 5/15/2018 12:02:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sf_scheduled_tasks](
	[type_of_schedule] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[task_name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[task_data] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subscr_lst_id] [uniqueidentifier] NULL,
	[status_message] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [int] NOT NULL,
	[schedule_data] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[progress] [int] NOT NULL,
	[last_modified] [datetime] NULL,
	[last_executed_time] [datetime] NULL,
	[language] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ky] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[is_running] [tinyint] NOT NULL,
	[is_recurring] [tinyint] NOT NULL,
	[instance_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[id] [uniqueidentifier] NOT NULL,
	[execute_time] [datetime] NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[description] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[application_name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_scheduled_tasks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [appName]    Script Date: 5/15/2018 12:02:02 PM ******/
CREATE NONCLUSTERED INDEX [appName] ON [dbo].[sf_scheduled_tasks]
(
	[application_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [excecutionDate]    Script Date: 5/15/2018 12:02:02 PM ******/
CREATE NONCLUSTERED INDEX [excecutionDate] ON [dbo].[sf_scheduled_tasks]
(
	[execute_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [key]    Script Date: 5/15/2018 12:02:02 PM ******/
CREATE NONCLUSTERED INDEX [key] ON [dbo].[sf_scheduled_tasks]
(
	[ky] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
