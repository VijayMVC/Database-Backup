/****** Object:  Table [dbo].[SyncTaskLock]    Script Date: 5/15/2018 12:02:11 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SyncTaskLock](
	[TaskId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_SyncTaskLock] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
