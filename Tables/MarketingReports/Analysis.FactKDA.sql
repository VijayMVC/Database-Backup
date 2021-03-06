/****** Object:  Table [Analysis].[FactKDA]    Script Date: 5/15/2018 12:02:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[FactKDA](
	[FK_Date] [datetime] NOT NULL,
	[FK_Store] [int] NOT NULL,
	[NationalMailings] [int] NOT NULL,
	[ScheduledMailings] [int] NOT NULL,
	[OnDemandMailings] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_FactKDA]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactKDA] ON [Analysis].[FactKDA]
(
	[FK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_FactKDA_1]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactKDA_1] ON [Analysis].[FactKDA]
(
	[FK_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Analysis].[FactKDA]  WITH CHECK ADD  CONSTRAINT [FK_FactKDA_DimDate] FOREIGN KEY([FK_Date])
REFERENCES [Analysis].[DimDate] ([PK_Date])
ALTER TABLE [Analysis].[FactKDA] CHECK CONSTRAINT [FK_FactKDA_DimDate]
ALTER TABLE [Analysis].[FactKDA]  WITH CHECK ADD  CONSTRAINT [FK_FactKDA_DimStore] FOREIGN KEY([FK_Store])
REFERENCES [Analysis].[DimStore] ([PK_Store])
ALTER TABLE [Analysis].[FactKDA] CHECK CONSTRAINT [FK_FactKDA_DimStore]
GO
