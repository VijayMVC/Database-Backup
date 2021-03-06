/****** Object:  Table [dbo].[MSSQLogResultsUrlSummary]    Script Date: 5/15/2018 12:05:17 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogResultsUrlSummary](
	[searchDate] [smalldatetime] NULL,
	[siteId] [int] NULL,
	[queryIdX] [int] NULL,
	[resultsUrlId] [int] NULL,
	[numQueries] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [PK_MSSQLogResultsUrlSummary]    Script Date: 5/15/2018 12:05:17 PM ******/
CREATE CLUSTERED INDEX [PK_MSSQLogResultsUrlSummary] ON [dbo].[MSSQLogResultsUrlSummary]
(
	[searchDate] ASC,
	[siteId] ASC,
	[queryIdX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSQLogResultsUrlSummary]    Script Date: 5/15/2018 12:05:17 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSQLogResultsUrlSummary] ON [dbo].[MSSQLogResultsUrlSummary]
(
	[queryIdX] ASC,
	[resultsUrlId] ASC,
	[numQueries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
