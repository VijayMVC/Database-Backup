/****** Object:  Table [dbo].[EventSubsMatches]    Script Date: 5/15/2018 12:05:35 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EventSubsMatches](
	[EventId] [bigint] NOT NULL,
	[SubId] [uniqueidentifier] NOT NULL,
	[LookupFieldPermissionResults] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [EventSubsMatches_EventIdSubId]    Script Date: 5/15/2018 12:05:35 PM ******/
CREATE CLUSTERED INDEX [EventSubsMatches_EventIdSubId] ON [dbo].[EventSubsMatches]
(
	[EventId] ASC,
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
