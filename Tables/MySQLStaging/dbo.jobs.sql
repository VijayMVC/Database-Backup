/****** Object:  Table [dbo].[jobs]    Script Date: 5/15/2018 12:04:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[jobs](
	[job_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sequence] [int] NULL,
	[franchise_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parent_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accounts_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[po_number] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[expires_on] [date] NULL,
	[created_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[created_on] [datetime] NULL,
	[last_modified_by] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_modified_on] [datetime] NULL,
	[ecommerce] [smallint] NULL,
	[royalty_exempt] [smallint] NULL,
	[historical] [smallint] NULL,
	[tracking_number] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[default_delivery_type] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[repeat_job_flag] [smallint] NULL,
	[completed_date] [datetime] NULL,
	[credit_balance] [numeric](11, 2) NULL,
	[default_tax_service] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Hint_sequence_franchise_id]    Script Date: 5/15/2018 12:04:16 PM ******/
CREATE NONCLUSTERED INDEX [Hint_sequence_franchise_id] ON [dbo].[jobs]
(
	[sequence] ASC,
	[franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IDX_JobID_FranchiseID]    Script Date: 5/15/2018 12:04:16 PM ******/
CREATE NONCLUSTERED INDEX [IDX_JobID_FranchiseID] ON [dbo].[jobs]
(
	[job_id] ASC,
	[franchise_id] ASC
)
INCLUDE ( 	[sequence],
	[description],
	[created_on],
	[last_modified_on],
	[ecommerce],
	[repeat_job_flag],
	[completed_date]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [idx_jobs_franchise_id_includes]    Script Date: 5/15/2018 12:04:16 PM ******/
CREATE NONCLUSTERED INDEX [idx_jobs_franchise_id_includes] ON [dbo].[jobs]
(
	[franchise_id] ASC
)
INCLUDE ( 	[job_id],
	[sequence],
	[accounts_id],
	[po_number],
	[description],
	[expires_on],
	[created_on],
	[completed_date]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [jobs_completed_date]    Script Date: 5/15/2018 12:04:16 PM ******/
CREATE NONCLUSTERED INDEX [jobs_completed_date] ON [dbo].[jobs]
(
	[completed_date] ASC
)
INCLUDE ( 	[job_id],
	[sequence],
	[description]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
