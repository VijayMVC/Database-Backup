/****** Object:  Table [dbo].[MSSQLogLocationSummary]    Script Date: 5/15/2018 12:05:16 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogLocationSummary](
	[searchDate] [smalldatetime] NULL,
	[siteId] [int] NULL,
	[locationId] [int] NULL,
	[clickThroughBase] [int] NULL,
	[numClicks] [int] NULL,
	[numQueries] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [PK_MSSQLogLocationSummary]    Script Date: 5/15/2018 12:05:16 PM ******/
CREATE CLUSTERED INDEX [PK_MSSQLogLocationSummary] ON [dbo].[MSSQLogLocationSummary]
(
	[searchDate] ASC,
	[siteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
