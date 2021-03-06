/****** Object:  Table [dbo].[MSSQLogQuerySummary]    Script Date: 5/15/2018 12:05:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogQuerySummary](
	[searchDate] [smalldatetime] NULL,
	[siteId] [int] NULL,
	[queryId] [int] NULL,
	[scopeId] [int] NULL,
	[numQueries] [int] NULL,
	[clickthroughBase] [int] NULL,
	[numClicks] [int] NULL,
	[numZeroResults] [int] NULL,
	[numZeroBestBets] [int] NULL,
	[contextualScopeId] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [PK_MSSQLogQuerySummary]    Script Date: 5/15/2018 12:05:17 PM ******/
CREATE CLUSTERED INDEX [PK_MSSQLogQuerySummary] ON [dbo].[MSSQLogQuerySummary]
(
	[searchDate] ASC,
	[siteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
