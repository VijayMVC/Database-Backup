/****** Object:  Table [dbo].[MSSDocDeleteList]    Script Date: 5/15/2018 12:09:08 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSDocDeleteList](
	[DocID] [int] NOT NULL,
	[CrawlId] [int] NOT NULL,
	[Available] [tinyint] NOT NULL,
 CONSTRAINT [PK_MSSDocDeleteList] PRIMARY KEY CLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_MSSDocDeleteList]    Script Date: 5/15/2018 12:09:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSDocDeleteList] ON [dbo].[MSSDocDeleteList]
(
	[Available] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_MSSDocDeleteListCrawlIdAvailable]    Script Date: 5/15/2018 12:09:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSDocDeleteListCrawlIdAvailable] ON [dbo].[MSSDocDeleteList]
(
	[CrawlId] ASC,
	[Available] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSDocDeleteList] ADD  CONSTRAINT [DF_MSSDocDeleteList_Available]  DEFAULT ((0)) FOR [Available]
GO
