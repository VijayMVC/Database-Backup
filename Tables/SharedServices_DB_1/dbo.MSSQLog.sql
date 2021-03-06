/****** Object:  Table [dbo].[MSSQLog]    Script Date: 5/15/2018 12:05:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLog](
	[clickId] [bigint] NULL,
	[queryId] [int] NULL,
	[siteId] [int] NULL,
	[clickedUrlId] [int] NULL,
	[numResults] [int] NULL,
	[numBestBets] [int] NULL,
	[bestBetId] [int] NULL,
	[scopeId] [int] NULL,
	[clickedUrlRank] [int] NULL,
	[searchTime] [datetime] NULL,
	[clickTime] [datetime] NULL,
	[advancedSearch] [bit] NULL,
	[continued] [bit] NULL,
	[didYouMean] [bit] NULL,
	[resultView] [tinyint] NULL,
	[numHighConf] [int] NULL,
	[resultsUrlId] [int] NULL,
	[queryServerId] [int] NULL,
	[contextualScopeId] [int] NULL,
	[locationId] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSQLog_SearchTime]    Script Date: 5/15/2018 12:05:14 PM ******/
CREATE CLUSTERED INDEX [IX_MSSQLog_SearchTime] ON [dbo].[MSSQLog]
(
	[searchTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
