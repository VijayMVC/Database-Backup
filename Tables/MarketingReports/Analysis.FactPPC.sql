/****** Object:  Table [Analysis].[FactPPC]    Script Date: 5/15/2018 12:02:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[FactPPC](
	[FK_Date] [datetime] NOT NULL,
	[FK_Store] [int] NOT NULL,
	[Impressions] [int] NOT NULL,
	[Clicks] [int] NOT NULL,
	[ClickThroughRate] [decimal](18, 4) NOT NULL,
	[APICPC] [money] NOT NULL,
	[APICost] [money] NOT NULL,
	[MyFastsignsLeads] [int] NOT NULL,
	[SendAFile] [int] NOT NULL,
	[QuoteLeads] [int] NOT NULL,
	[LocateNow] [int] NOT NULL,
	[GetDirections] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_FactPPC]    Script Date: 5/15/2018 12:02:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactPPC] ON [Analysis].[FactPPC]
(
	[FK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_FactPPC_1]    Script Date: 5/15/2018 12:02:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactPPC_1] ON [Analysis].[FactPPC]
(
	[FK_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [Analysis].[FactPPC]  WITH CHECK ADD  CONSTRAINT [FK_FactPPC_DimDate] FOREIGN KEY([FK_Date])
REFERENCES [Analysis].[DimDate] ([PK_Date])
ALTER TABLE [Analysis].[FactPPC] CHECK CONSTRAINT [FK_FactPPC_DimDate]
ALTER TABLE [Analysis].[FactPPC]  WITH CHECK ADD  CONSTRAINT [FK_FactPPC_DimStore] FOREIGN KEY([FK_Store])
REFERENCES [Analysis].[DimStore] ([PK_Store])
ALTER TABLE [Analysis].[FactPPC] CHECK CONSTRAINT [FK_FactPPC_DimStore]
GO
