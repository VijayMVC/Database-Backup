/****** Object:  Table [dbo].[job_line_items_services]    Script Date: 5/15/2018 12:04:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[job_line_items_services](
	[job_line_item_service_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[job_line_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[service_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[invoice_line_item_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[delivery_method] [smallint] NOT NULL,
	[duration] [decimal](5, 2) NOT NULL,
	[quantity] [smallint] NOT NULL,
	[unit_cost] [decimal](8, 2) NOT NULL,
	[due_date] [datetime2](0) NULL,
	[desc] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[created_on] [datetime2](0) NOT NULL,
	[last_modified_on] [datetime2](0) NOT NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_job_line_items_services_job_line_item_service_id] PRIMARY KEY CLUSTERED 
(
	[job_line_item_service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [invoice_line_item_id]    Script Date: 5/15/2018 12:04:15 PM ******/
CREATE NONCLUSTERED INDEX [invoice_line_item_id] ON [dbo].[job_line_items_services]
(
	[invoice_line_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [job_line_item_id]    Script Date: 5/15/2018 12:04:15 PM ******/
CREATE NONCLUSTERED INDEX [job_line_item_id] ON [dbo].[job_line_items_services]
(
	[job_line_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [service_id]    Script Date: 5/15/2018 12:04:15 PM ******/
CREATE NONCLUSTERED INDEX [service_id] ON [dbo].[job_line_items_services]
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[job_line_items_services] ADD  DEFAULT ((0)) FOR [delivery_method]
ALTER TABLE [dbo].[job_line_items_services] ADD  DEFAULT (NULL) FOR [due_date]
GO
