/****** Object:  Table [dbo].[MSSCrawlContent]    Script Date: 5/15/2018 12:09:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSCrawlContent](
	[CrawlID] [int] NOT NULL,
	[CatalogID] [int] NOT NULL,
	[ContentSourceID] [int] NOT NULL,
	[StartAddressID] [int] NOT NULL,
	[DocID] [int] NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSCrawlContent]    Script Date: 5/15/2018 12:09:06 PM ******/
CREATE CLUSTERED INDEX [IX_MSSCrawlContent] ON [dbo].[MSSCrawlContent]
(
	[CrawlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSCrawlContent] ADD  CONSTRAINT [DF_MSSCrawlContent_CrawlID]  DEFAULT ((0)) FOR [CrawlID]
ALTER TABLE [dbo].[MSSCrawlContent] ADD  CONSTRAINT [DF_MSSCrawlContent_CatalogID]  DEFAULT ((1)) FOR [CatalogID]
ALTER TABLE [dbo].[MSSCrawlContent] ADD  CONSTRAINT [DF_MSSCrawlContent_DocID]  DEFAULT ((0)) FOR [DocID]
ALTER TABLE [dbo].[MSSCrawlContent]  WITH CHECK ADD  CONSTRAINT [FK_MSSCrawlContent_MSSCrawlHistory] FOREIGN KEY([CrawlID])
REFERENCES [dbo].[MSSCrawlHistory] ([CrawlID])
ALTER TABLE [dbo].[MSSCrawlContent] CHECK CONSTRAINT [FK_MSSCrawlContent_MSSCrawlHistory]
GO
