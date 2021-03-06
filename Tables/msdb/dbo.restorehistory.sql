/****** Object:  Table [dbo].[restorehistory]    Script Date: 5/15/2018 12:03:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[restorehistory](
	[restore_history_id] [int] IDENTITY(1,1) NOT NULL,
	[restore_date] [datetime] NULL,
	[destination_database_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[user_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backup_set_id] [int] NOT NULL,
	[restore_type] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[replace] [bit] NULL,
	[recovery] [bit] NULL,
	[restart] [bit] NULL,
	[stop_at] [datetime] NULL,
	[device_count] [tinyint] NULL,
	[stop_at_mark_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stop_before] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[restore_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [restorehistorybackupset]    Script Date: 5/15/2018 12:03:00 PM ******/
CREATE NONCLUSTERED INDEX [restorehistorybackupset] ON [dbo].[restorehistory]
(
	[backup_set_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[restorehistory]  WITH CHECK ADD FOREIGN KEY([backup_set_id])
REFERENCES [dbo].[backupset] ([backup_set_id])
GO
