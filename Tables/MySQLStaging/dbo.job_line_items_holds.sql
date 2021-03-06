/****** Object:  Table [dbo].[job_line_items_holds]    Script Date: 5/15/2018 12:04:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[job_line_items_holds](
	[job_line_item_hold_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[job_line_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[hold_reason_id] [int] NOT NULL,
	[expected_datetime] [datetime2](0) NULL,
	[set_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[set_on] [datetime2](0) NOT NULL,
	[active] [smallint] NOT NULL,
	[resumed_on] [datetime2](0) NULL,
	[resumed_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_job_line_items_holds_job_line_item_hold_id] PRIMARY KEY CLUSTERED 
(
	[job_line_item_hold_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [hold_reason_id]    Script Date: 5/15/2018 12:04:15 PM ******/
CREATE NONCLUSTERED INDEX [hold_reason_id] ON [dbo].[job_line_items_holds]
(
	[hold_reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [job_line_item_id]    Script Date: 5/15/2018 12:04:15 PM ******/
CREATE NONCLUSTERED INDEX [job_line_item_id] ON [dbo].[job_line_items_holds]
(
	[job_line_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[job_line_items_holds] ADD  DEFAULT (NULL) FOR [expected_datetime]
ALTER TABLE [dbo].[job_line_items_holds] ADD  DEFAULT (NULL) FOR [resumed_on]
ALTER TABLE [dbo].[job_line_items_holds] ADD  DEFAULT (NULL) FOR [resumed_by]
GO
