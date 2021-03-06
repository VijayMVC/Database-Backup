/****** Object:  Table [dbo].[EventCache]    Script Date: 5/15/2018 12:05:34 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EventCache](
	[EventTime] [datetime] NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SiteId] [uniqueidentifier] NOT NULL,
	[WebId] [uniqueidentifier] NULL,
	[ListId] [uniqueidentifier] NULL,
	[ItemId] [int] NULL,
	[DocId] [uniqueidentifier] NULL,
	[Guid0] [uniqueidentifier] NULL,
	[Int0] [int] NULL,
	[Int1] [int] NULL,
	[ContentTypeId] [dbo].[tContentTypeId] NULL,
	[ItemName] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[ItemFullUrl] [nvarchar](260) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[EventType] [int] NOT NULL,
	[ObjectType] [int] NOT NULL,
	[ModifiedBy] [nvarchar](255) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[TimeLastModified] [datetime] NOT NULL,
	[EventData] [image] NULL,
	[ACL] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [EventCache_Id]    Script Date: 5/15/2018 12:05:34 PM ******/
CREATE CLUSTERED INDEX [EventCache_Id] ON [dbo].[EventCache]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [EventCache_ListId]    Script Date: 5/15/2018 12:05:34 PM ******/
CREATE NONCLUSTERED INDEX [EventCache_ListId] ON [dbo].[EventCache]
(
	[ListId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [EventCache_SiteId]    Script Date: 5/15/2018 12:05:34 PM ******/
CREATE NONCLUSTERED INDEX [EventCache_SiteId] ON [dbo].[EventCache]
(
	[SiteId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [EventCache_Time]    Script Date: 5/15/2018 12:05:34 PM ******/
CREATE NONCLUSTERED INDEX [EventCache_Time] ON [dbo].[EventCache]
(
	[EventTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
