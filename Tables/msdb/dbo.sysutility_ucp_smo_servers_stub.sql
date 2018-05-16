/****** Object:  Table [dbo].[sysutility_ucp_smo_servers_stub]    Script Date: 5/15/2018 12:03:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[sysutility_ucp_smo_servers_stub](
	[urn] [nvarchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[powershell_path] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[processing_time] [datetimeoffset](7) NULL,
	[batch_time] [datetimeoffset](7) NULL,
	[AuditLevel] [smallint] NULL,
	[BackupDirectory] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BrowserServiceAccount] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BrowserStartMode] [smallint] NULL,
	[BuildClrVersionString] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BuildNumber] [int] NULL,
	[Collation] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CollationID] [int] NULL,
	[ComparisonStyle] [int] NULL,
	[ComputerNamePhysicalNetBIOS] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultFile] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultLog] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Edition] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EngineEdition] [smallint] NULL,
	[ErrorLogPath] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FilestreamShareName] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstallDataDirectory] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstallSharedDirectory] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InstanceName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsCaseSensitive] [bit] NULL,
	[IsClustered] [bit] NULL,
	[IsFullTextInstalled] [bit] NULL,
	[IsSingleUser] [bit] NULL,
	[Language] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MailProfile] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MasterDBLogPath] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MasterDBPath] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxPrecision] [tinyint] NULL,
	[Name] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NamedPipesEnabled] [bit] NULL,
	[NetName] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumberOfLogFiles] [int] NULL,
	[OSVersion] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PerfMonMode] [smallint] NULL,
	[PhysicalMemory] [int] NULL,
	[Platform] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Processors] [smallint] NULL,
	[ProcessorUsage] [int] NULL,
	[Product] [nvarchar](48) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductLevel] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ResourceVersionString] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RootDirectory] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ServerType] [smallint] NULL,
	[ServiceAccount] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ServiceInstanceId] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ServiceName] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ServiceStartMode] [smallint] NULL,
	[SqlCharSet] [smallint] NULL,
	[SqlCharSetName] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SqlDomainGroup] [nvarchar](260) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SqlSortOrder] [smallint] NULL,
	[SqlSortOrderName] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [smallint] NULL,
	[TapeLoadWaitTime] [int] NULL,
	[TcpEnabled] [bit] NULL,
	[VersionMajor] [int] NULL,
	[VersionMinor] [int] NULL,
	[VersionString] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
