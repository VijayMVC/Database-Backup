/****** Object:  Table [dbo].[MSSLocationSystem]    Script Date: 5/15/2018 12:05:13 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSLocationSystem](
	[LastUpdate] [bigint] NOT NULL,
	[UseCrawlProxy] [bit] NOT NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[MSSLocationSystem] ADD  CONSTRAINT [DF_MSSLocationCacheInformation_LastUpdate]  DEFAULT ((0)) FOR [LastUpdate]
GO
