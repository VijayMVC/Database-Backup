/****** Object:  Table [dbo].[SiteQuota]    Script Date: 5/15/2018 12:05:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SiteQuota](
	[SiteId] [uniqueidentifier] NOT NULL,
	[DiskUsed] [bigint] NOT NULL,
	[UpdateTimeStamp] [bit] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [SiteQuota_SiteId]    Script Date: 5/15/2018 12:05:44 PM ******/
CREATE CLUSTERED INDEX [SiteQuota_SiteId] ON [dbo].[SiteQuota]
(
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
