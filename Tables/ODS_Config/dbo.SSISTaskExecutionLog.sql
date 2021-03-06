/****** Object:  Table [dbo].[SSISTaskExecutionLog]    Script Date: 5/15/2018 12:04:57 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SSISTaskExecutionLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ExecutionID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SourceID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ParentSourceID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SourceType] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExecutionStartDateTime] [datetime] NOT NULL,
	[ExecutionEndDateTime] [datetime] NULL,
	[TotalErrorCount] [int] NULL,
	[TotalWarningCount] [int] NULL,
	[TotalRecordsExtracted] [bigint] NULL,
	[TotalRecordsLoaded] [bigint] NULL,
	[CPUUtilization] [float] NULL,
	[RAMUtilization] [float] NULL,
	[DiskUtilization] [float] NULL,
	[CustomValue_Num_1] [decimal](10, 2) NULL,
	[CustomValue_Num_2] [decimal](10, 2) NULL,
	[CustomValue_Num_3] [decimal](10, 2) NULL,
	[CustomValue_Dt_1] [datetime] NULL,
	[CustomValue_Dt_2] [datetime] NULL,
	[CustomValue_Dt_3] [datetime] NULL,
	[CustomValue_Str_1] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomValue_Str_2] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomValue_Str_3] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__SSISTask__5E5499A81367E606] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_SSISPackageTaskExecution_ExecutionID_SourceID]    Script Date: 5/15/2018 12:04:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_SSISPackageTaskExecution_ExecutionID_SourceID] ON [dbo].[SSISTaskExecutionLog]
(
	[ExecutionID] ASC,
	[SourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_SSISTaskExecutionLog_COVERING_EXEHISTORY]    Script Date: 5/15/2018 12:04:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_SSISTaskExecutionLog_COVERING_EXEHISTORY] ON [dbo].[SSISTaskExecutionLog]
(
	[ExecutionID] ASC
)
INCLUDE ( 	[SourceID],
	[ParentSourceID],
	[SourceName],
	[SourceType],
	[ExecutionStartDateTime],
	[ExecutionEndDateTime],
	[TotalErrorCount],
	[TotalWarningCount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[SSISTaskExecutionLog] ADD  CONSTRAINT [DF__SSISTaskE__Execu__15502E78]  DEFAULT (getdate()) FOR [ExecutionStartDateTime]
GO
