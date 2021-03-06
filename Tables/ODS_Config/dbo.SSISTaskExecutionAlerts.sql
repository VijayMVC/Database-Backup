/****** Object:  Table [dbo].[SSISTaskExecutionAlerts]    Script Date: 5/15/2018 12:04:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SSISTaskExecutionAlerts](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ExecutionID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SourceID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceType] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LogDate] [datetime] NOT NULL,
	[EventType] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MessageCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MessageDescription] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__SSISTask__5E5499A8182C9B23] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_SSISTaskExecutionAlerts_7_1413580074__K6D_K2_3_4_5_7_8_9]    Script Date: 5/15/2018 12:04:56 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_SSISTaskExecutionAlerts_7_1413580074__K6D_K2_3_4_5_7_8_9] ON [dbo].[SSISTaskExecutionAlerts]
(
	[LogDate] DESC,
	[ExecutionID] ASC
)
INCLUDE ( 	[SourceID],
	[SourceName],
	[SourceType],
	[EventType],
	[MessageCode],
	[MessageDescription]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_SSISTaskExecutionAlerts_ExecutionID_SourceID]    Script Date: 5/15/2018 12:04:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_SSISTaskExecutionAlerts_ExecutionID_SourceID] ON [dbo].[SSISTaskExecutionAlerts]
(
	[ExecutionID] ASC,
	[SourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[SSISTaskExecutionAlerts] ADD  CONSTRAINT [DF__SSISTaskE__LogDa__1A14E395]  DEFAULT (getdate()) FOR [LogDate]
GO
