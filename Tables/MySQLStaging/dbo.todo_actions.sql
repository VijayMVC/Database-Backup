/****** Object:  Table [dbo].[todo_actions]    Script Date: 5/15/2018 12:04:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[todo_actions](
	[todo_action_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_todo_actions_todo_action_id] PRIMARY KEY CLUSTERED 
(
	[todo_action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[todo_actions] ADD  DEFAULT (N'') FOR [todo_action_id]
ALTER TABLE [dbo].[todo_actions] ADD  DEFAULT (NULL) FOR [name]
GO
