/****** Object:  Table [dbo].[ExecutionLogStorage]    Script Date: 5/15/2018 12:05:00 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ExecutionLogStorage](
	[LogEntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[InstanceName] [nvarchar](38) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ReportID] [uniqueidentifier] NULL,
	[UserName] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ExecutionId] [nvarchar](64) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[RequestType] [tinyint] NOT NULL,
	[Format] [nvarchar](26) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[Parameters] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ReportAction] [tinyint] NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeEnd] [datetime] NOT NULL,
	[TimeDataRetrieval] [int] NOT NULL,
	[TimeProcessing] [int] NOT NULL,
	[TimeRendering] [int] NOT NULL,
	[Source] [tinyint] NOT NULL,
	[Status] [nvarchar](40) COLLATE Latin1_General_CI_AS_KS_WS NOT NULL,
	[ByteCount] [bigint] NOT NULL,
	[RowCount] [bigint] NOT NULL,
	[AdditionalInfo] [xml] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [IX_ExecutionLog]    Script Date: 5/15/2018 12:05:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExecutionLog] ON [dbo].[ExecutionLogStorage]
(
	[TimeStart] ASC,
	[LogEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
