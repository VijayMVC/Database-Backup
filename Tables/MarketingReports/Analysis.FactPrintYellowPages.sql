/****** Object:  Table [Analysis].[FactPrintYellowPages]    Script Date: 5/15/2018 12:02:45 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[FactPrintYellowPages](
	[FK_Date] [datetime] NOT NULL,
	[FK_Store] [int] NOT NULL,
	[Calls] [int] NOT NULL,
	[WebVisitsWithTracking] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_FactPrintYellowPages]    Script Date: 5/15/2018 12:02:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactPrintYellowPages] ON [Analysis].[FactPrintYellowPages]
(
	[FK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_FactPrintYellowPages_1]    Script Date: 5/15/2018 12:02:45 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactPrintYellowPages_1] ON [Analysis].[FactPrintYellowPages]
(
	[FK_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [Analysis].[FactPrintYellowPages]  WITH CHECK ADD  CONSTRAINT [FK_FactPrintYellowPages_DimDate] FOREIGN KEY([FK_Date])
REFERENCES [Analysis].[DimDate] ([PK_Date])
ALTER TABLE [Analysis].[FactPrintYellowPages] CHECK CONSTRAINT [FK_FactPrintYellowPages_DimDate]
ALTER TABLE [Analysis].[FactPrintYellowPages]  WITH CHECK ADD  CONSTRAINT [FK_FactPrintYellowPages_DimStore] FOREIGN KEY([FK_Store])
REFERENCES [Analysis].[DimStore] ([PK_Store])
ALTER TABLE [Analysis].[FactPrintYellowPages] CHECK CONSTRAINT [FK_FactPrintYellowPages_DimStore]
GO
