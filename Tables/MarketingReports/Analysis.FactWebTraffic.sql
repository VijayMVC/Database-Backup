/****** Object:  Table [Analysis].[FactWebTraffic]    Script Date: 5/15/2018 12:02:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[FactWebTraffic](
	[FK_Store] [int] NOT NULL,
	[FK_Date] [datetime] NOT NULL,
	[Visits] [int] NOT NULL,
	[UniqueVisits] [int] NOT NULL,
	[PageViews] [int] NOT NULL,
	[BounceRate] [decimal](18, 4) NOT NULL,
	[AverageTime] [decimal](18, 4) NOT NULL,
	[ReferringSite] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SendAFile] [int] NOT NULL,
	[RFQ] [int] NOT NULL,
	[MTMFS] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_FactWebTraffic]    Script Date: 5/15/2018 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactWebTraffic] ON [Analysis].[FactWebTraffic]
(
	[FK_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_FactWebTraffic_2]    Script Date: 5/15/2018 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactWebTraffic_2] ON [Analysis].[FactWebTraffic]
(
	[FK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Analysis].[FactWebTraffic]  WITH CHECK ADD  CONSTRAINT [FK_FactWebTraffic_DimDate] FOREIGN KEY([FK_Date])
REFERENCES [Analysis].[DimDate] ([PK_Date])
ALTER TABLE [Analysis].[FactWebTraffic] CHECK CONSTRAINT [FK_FactWebTraffic_DimDate]
ALTER TABLE [Analysis].[FactWebTraffic]  WITH CHECK ADD  CONSTRAINT [FK_FactWebTraffic_DimStore] FOREIGN KEY([FK_Store])
REFERENCES [Analysis].[DimStore] ([PK_Store])
ALTER TABLE [Analysis].[FactWebTraffic] CHECK CONSTRAINT [FK_FactWebTraffic_DimStore]
GO
