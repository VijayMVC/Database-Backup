/****** Object:  Table [dbo].[todos]    Script Date: 5/15/2018 12:04:32 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[todos](
	[todo_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[todo_action_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[entity_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[entity_type] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[employee_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[due_date] [datetime2](0) NULL,
	[notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[deleted] [smallint] NOT NULL,
	[completed] [smallint] NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NULL,
	[modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[modified_on] [datetime2](0) NULL,
 CONSTRAINT [PK_todos_todo_id] PRIMARY KEY CLUSTERED 
(
	[todo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [employee_id]    Script Date: 5/15/2018 12:04:32 PM ******/
CREATE NONCLUSTERED INDEX [employee_id] ON [dbo].[todos]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [entity_id]    Script Date: 5/15/2018 12:04:32 PM ******/
CREATE NONCLUSTERED INDEX [entity_id] ON [dbo].[todos]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:04:32 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[todos]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (N'') FOR [todo_id]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (NULL) FOR [todo_action_id]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (NULL) FOR [franchise_id]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (NULL) FOR [entity_id]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (N'entity') FOR [entity_type]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (NULL) FOR [due_date]
ALTER TABLE [dbo].[todos] ADD  DEFAULT ((0)) FOR [deleted]
ALTER TABLE [dbo].[todos] ADD  DEFAULT ((0)) FOR [completed]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (NULL) FOR [created_by]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (NULL) FOR [created_on]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (NULL) FOR [modified_by]
ALTER TABLE [dbo].[todos] ADD  DEFAULT (NULL) FOR [modified_on]
GO
