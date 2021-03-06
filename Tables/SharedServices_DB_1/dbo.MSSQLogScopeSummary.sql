/****** Object:  Table [dbo].[MSSQLogScopeSummary]    Script Date: 5/15/2018 12:05:18 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogScopeSummary](
	[searchDate] [smalldatetime] NULL,
	[siteId] [int] NULL,
	[scopeId] [int] NULL,
	[numQueries] [int] NULL,
	[contextualScopeId] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [PK_MSSQLogScopeSummary]    Script Date: 5/15/2018 12:05:18 PM ******/
CREATE CLUSTERED INDEX [PK_MSSQLogScopeSummary] ON [dbo].[MSSQLogScopeSummary]
(
	[searchDate] ASC,
	[siteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
