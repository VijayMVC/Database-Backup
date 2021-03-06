/****** Object:  Table [Analysis].[FactSuperPagesCom]    Script Date: 5/15/2018 12:02:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[FactSuperPagesCom](
	[FK_Date] [datetime] NOT NULL,
	[FK_Store] [int] NOT NULL,
	[Clicks] [int] NOT NULL,
	[CPC] [money] NOT NULL,
	[CostByMonth] [money] NOT NULL,
	[Calls] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_FactSuperPagesCom]    Script Date: 5/15/2018 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactSuperPagesCom] ON [Analysis].[FactSuperPagesCom]
(
	[FK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_FactSuperPagesCom_1]    Script Date: 5/15/2018 12:02:46 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactSuperPagesCom_1] ON [Analysis].[FactSuperPagesCom]
(
	[FK_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [Analysis].[FactSuperPagesCom]  WITH CHECK ADD  CONSTRAINT [FK_FactSuperPagesCom_DimDate] FOREIGN KEY([FK_Date])
REFERENCES [Analysis].[DimDate] ([PK_Date])
ALTER TABLE [Analysis].[FactSuperPagesCom] CHECK CONSTRAINT [FK_FactSuperPagesCom_DimDate]
ALTER TABLE [Analysis].[FactSuperPagesCom]  WITH CHECK ADD  CONSTRAINT [FK_FactSuperPagesCom_DimStore] FOREIGN KEY([FK_Store])
REFERENCES [Analysis].[DimStore] ([PK_Store])
ALTER TABLE [Analysis].[FactSuperPagesCom] CHECK CONSTRAINT [FK_FactSuperPagesCom_DimStore]
GO
