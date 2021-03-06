/****** Object:  Table [dbo].[restorefilegroup]    Script Date: 5/15/2018 12:03:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[restorefilegroup](
	[restore_history_id] [int] NOT NULL,
	[filegroup_name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[restorefilegroup]  WITH CHECK ADD FOREIGN KEY([restore_history_id])
REFERENCES [dbo].[restorehistory] ([restore_history_id])
GO
