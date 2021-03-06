/****** Object:  Table [Analysis].[Fact800Calls]    Script Date: 5/15/2018 12:02:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[Fact800Calls](
	[FK_Date] [datetime] NOT NULL,
	[FK_Store] [int] NOT NULL,
	[ConnectedCalls] [int] NOT NULL,
	[ConnectedMinutes] [int] NOT NULL,
	[MissedCalls] [int] NOT NULL,
	[BusyCalls] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_Fact800Calls]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_Fact800Calls] ON [Analysis].[Fact800Calls]
(
	[FK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_Fact800Calls_1]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_Fact800Calls_1] ON [Analysis].[Fact800Calls]
(
	[FK_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [Analysis].[Fact800Calls]  WITH CHECK ADD  CONSTRAINT [FK_Fact800Calls_DimDate] FOREIGN KEY([FK_Date])
REFERENCES [Analysis].[DimDate] ([PK_Date])
ALTER TABLE [Analysis].[Fact800Calls] CHECK CONSTRAINT [FK_Fact800Calls_DimDate]
ALTER TABLE [Analysis].[Fact800Calls]  WITH CHECK ADD  CONSTRAINT [FK_Fact800Calls_DimStore] FOREIGN KEY([FK_Store])
REFERENCES [Analysis].[DimStore] ([PK_Store])
ALTER TABLE [Analysis].[Fact800Calls] CHECK CONSTRAINT [FK_Fact800Calls_DimStore]
GO
