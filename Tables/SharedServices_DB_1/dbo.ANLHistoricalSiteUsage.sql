/****** Object:  Table [dbo].[ANLHistoricalSiteUsage]    Script Date: 5/15/2018 12:05:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ANLHistoricalSiteUsage](
	[DayId] [int] NOT NULL,
	[SiteGuid] [uniqueidentifier] NOT NULL,
	[Hits] [int] NOT NULL,
	[UniqueUsers] [int] NOT NULL,
 CONSTRAINT [PK_ANLHistoricalSiteUsage] PRIMARY KEY CLUSTERED 
(
	[SiteGuid] ASC,
	[DayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
