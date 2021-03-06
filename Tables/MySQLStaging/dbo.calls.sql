/****** Object:  Table [dbo].[calls]    Script Date: 5/15/2018 12:03:59 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[calls](
	[call_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[call_type_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[entity_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[call_date] [date] NULL,
	[call_time] [time](7) NULL,
	[duration] [int] NULL,
	[notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[employee_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime2](0) NULL,
	[modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[modified_on] [datetime2](0) NULL,
 CONSTRAINT [PK_calls_call_id] PRIMARY KEY CLUSTERED 
(
	[call_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [employee_id]    Script Date: 5/15/2018 12:03:59 PM ******/
CREATE NONCLUSTERED INDEX [employee_id] ON [dbo].[calls]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [entity_id]    Script Date: 5/15/2018 12:03:59 PM ******/
CREATE NONCLUSTERED INDEX [entity_id] ON [dbo].[calls]
(
	[entity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [franchise_id]    Script Date: 5/15/2018 12:03:59 PM ******/
CREATE NONCLUSTERED INDEX [franchise_id] ON [dbo].[calls]
(
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (N'') FOR [call_id]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [call_type_id]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [entity_id]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [call_date]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [call_time]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [duration]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [employee_id]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [created_by]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [created_on]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [modified_by]
ALTER TABLE [dbo].[calls] ADD  DEFAULT (NULL) FOR [modified_on]
GO
