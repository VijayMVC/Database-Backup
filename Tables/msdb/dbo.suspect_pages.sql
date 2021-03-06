/****** Object:  Table [dbo].[suspect_pages]    Script Date: 5/15/2018 12:03:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[suspect_pages](
	[database_id] [int] NOT NULL,
	[file_id] [int] NOT NULL,
	[page_id] [bigint] NOT NULL,
	[event_type] [int] NOT NULL,
	[error_count] [int] NOT NULL,
	[last_update_date] [datetime] NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[suspect_pages] ADD  DEFAULT (getdate()) FOR [last_update_date]
GO
