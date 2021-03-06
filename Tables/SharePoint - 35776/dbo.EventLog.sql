/****** Object:  Table [dbo].[EventLog]    Script Date: 5/15/2018 12:05:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EventLog](
	[Id] [bigint] NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[ListId] [uniqueidentifier] NOT NULL,
	[ItemId] [int] NOT NULL,
	[ItemName] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ItemFullUrl] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EventType] [int] NOT NULL,
	[ModifiedBy] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[TimeLastModified] [datetime] NOT NULL,
	[EventData] [image] NULL,
	[FormattedFragment] [ntext] COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [EventLog_Id]    Script Date: 5/15/2018 12:05:34 PM ******/
CREATE CLUSTERED INDEX [EventLog_Id] ON [dbo].[EventLog]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [EventLog_SiteIdEventTime]    Script Date: 5/15/2018 12:05:34 PM ******/
CREATE NONCLUSTERED INDEX [EventLog_SiteIdEventTime] ON [dbo].[EventLog]
(
	[SiteId] ASC,
	[EventTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
