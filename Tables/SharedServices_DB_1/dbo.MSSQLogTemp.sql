/****** Object:  Table [dbo].[MSSQLogTemp]    Script Date: 5/15/2018 12:05:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogTemp](
	[clickId] [bigint] NULL,
	[queryString] [nvarchar](1024) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[clickedUrl] [nvarchar](1024) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[resultsUrl] [nvarchar](1024) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[scope] [nvarchar](450) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[bestBet] [nvarchar](100) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[queryServer] [nvarchar](256) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[siteGuid] [uniqueidentifier] NULL,
	[searchTime] [datetime] NULL,
	[clickTime] [datetime] NULL,
	[searchDate] [smalldatetime] NULL,
	[clickedUrlRank] [int] NULL,
	[numResults] [int] NULL,
	[numHighConf] [int] NULL,
	[numBestBets] [int] NULL,
	[numScopes] [int] NULL,
	[resultView] [tinyint] NULL,
	[advancedSearch] [bit] NULL,
	[didYouMean] [bit] NULL,
	[continued] [bit] NULL,
	[contextualScope] [nvarchar](100) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[contextualScopeUrl] [nvarchar](1024) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[clickedUrlHash] [int] NULL,
	[queryStringHash] [int] NULL,
	[resultsUrlHash] [int] NULL,
	[clickedUrlId] [int] NULL,
	[queryId] [int] NULL,
	[scopeId] [int] NULL,
	[bestBetId] [int] NULL,
	[queryServerId] [int] NULL,
	[resultsUrlId] [int] NULL,
	[siteId] [int] NULL,
	[contextualScopeUrlHash] [int] NULL,
	[contextualScopeUrlId] [int] NULL,
	[contextualScopeNameId] [int] NULL,
	[contextualScopeId] [int] NULL,
	[locationId] [int] NULL,
	[location] [nvarchar](60) COLLATE Latin1_General_CI_AS_KS_WS NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSQLogTemp_ClickedUrlHash]    Script Date: 5/15/2018 12:05:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSQLogTemp_ClickedUrlHash] ON [dbo].[MSSQLogTemp]
(
	[clickedUrlHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSQLogTemp_QueryStringHash]    Script Date: 5/15/2018 12:05:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSQLogTemp_QueryStringHash] ON [dbo].[MSSQLogTemp]
(
	[queryStringHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
