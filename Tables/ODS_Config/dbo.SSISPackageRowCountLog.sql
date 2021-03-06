/****** Object:  Table [dbo].[SSISPackageRowCountLog]    Script Date: 5/15/2018 12:04:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SSISPackageRowCountLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ExecutionID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SourceID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SourceName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ComponentTypeCode] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ComponentUniqueID] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ComponentTypeName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ComponentName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataObjectType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataObjectName] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataObjectQuery] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataObjectConnectionString] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataObjectConnectionName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataObjectDataSource] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataObjectUserName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataObjectCatalog] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RecordCount] [bigint] NULL,
	[LogDate] [datetime] NOT NULL,
	[ParentLogID] [int] NULL,
 CONSTRAINT [PK__SSISPack__5E5499A81CF15040] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Hint_SourceID_ComponentTypeCode_LogDate]    Script Date: 5/15/2018 12:04:56 PM ******/
CREATE NONCLUSTERED INDEX [Hint_SourceID_ComponentTypeCode_LogDate] ON [dbo].[SSISPackageRowCountLog]
(
	[SourceID] ASC,
	[ComponentTypeCode] ASC,
	[LogDate] ASC
)
INCLUDE ( 	[SourceName],
	[RecordCount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_SSISPackageRowCountLog_ExecutionID_SourceID]    Script Date: 5/15/2018 12:04:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_SSISPackageRowCountLog_ExecutionID_SourceID] ON [dbo].[SSISPackageRowCountLog]
(
	[ExecutionID] ASC,
	[SourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_SSISPackageRowCountLog_ParentLogID]    Script Date: 5/15/2018 12:04:56 PM ******/
CREATE NONCLUSTERED INDEX [IX_SSISPackageRowCountLog_ParentLogID] ON [dbo].[SSISPackageRowCountLog]
(
	[ParentLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[SSISPackageRowCountLog] ADD  CONSTRAINT [DF__SSISPacka__LogDa__1ED998B2]  DEFAULT (getdate()) FOR [LogDate]
GO
