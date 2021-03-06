/****** Object:  Table [dbo].[WebTrafficStaging1]    Script Date: 5/15/2018 12:02:48 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[WebTrafficStaging1](
	[WebNumber] [int] NOT NULL,
	[Month] [datetime] NOT NULL,
	[Visits] [int] NOT NULL,
	[PageViews] [int] NOT NULL,
	[UniqueVisits] [int] NOT NULL,
	[AvgTimePerVisit] [decimal](18, 4) NOT NULL,
	[BounceRate] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_WebTrafficStaging1] PRIMARY KEY CLUSTERED 
(
	[WebNumber] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_WebTrafficStaging1]    Script Date: 5/15/2018 12:02:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_WebTrafficStaging1] ON [dbo].[WebTrafficStaging1]
(
	[WebNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_WebTrafficStaging1_1]    Script Date: 5/15/2018 12:02:48 PM ******/
CREATE NONCLUSTERED INDEX [IX_WebTrafficStaging1_1] ON [dbo].[WebTrafficStaging1]
(
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_WebTrafficStaging1_2]    Script Date: 5/15/2018 12:02:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_WebTrafficStaging1_2] ON [dbo].[WebTrafficStaging1]
(
	[WebNumber] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
