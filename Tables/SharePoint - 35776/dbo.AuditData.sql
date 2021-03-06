/****** Object:  Table [dbo].[AuditData]    Script Date: 5/15/2018 12:05:33 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[AuditData](
	[SiteId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemType] [smallint] NOT NULL,
	[UserId] [int] NULL,
	[MachineName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[MachineIp] [nvarchar](20) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[DocLocation] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[LocationType] [tinyint] NULL,
	[Occurred] [datetime] NOT NULL,
	[Event] [int] NOT NULL,
	[EventName] [nvarchar](128) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EventSource] [tinyint] NOT NULL,
	[SourceName] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EventData] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [AuditData_OnSiteItem]    Script Date: 5/15/2018 12:05:33 PM ******/
CREATE CLUSTERED INDEX [AuditData_OnSiteItem] ON [dbo].[AuditData]
(
	[SiteId] ASC,
	[ItemId] ASC,
	[Occurred] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
