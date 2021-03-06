/****** Object:  Table [dbo].[MSSQLogHistorical]    Script Date: 5/15/2018 12:05:15 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogHistorical](
	[searchDate] [smalldatetime] NULL,
	[siteId] [int] NULL,
	[numQueries] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [PK_MSSQLogHistorical]    Script Date: 5/15/2018 12:05:15 PM ******/
CREATE CLUSTERED INDEX [PK_MSSQLogHistorical] ON [dbo].[MSSQLogHistorical]
(
	[searchDate] ASC,
	[siteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
