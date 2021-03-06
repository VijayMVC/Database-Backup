/****** Object:  Table [Analysis].[FactFastMail]    Script Date: 5/15/2018 12:02:44 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Analysis].[FactFastMail](
	[FK_Date] [datetime] NOT NULL,
	[FK_Store] [int] NOT NULL,
	[FK_FastMailType] [int] NOT NULL,
	[Emails] [int] NOT NULL,
	[DeliveryRate] [decimal](18, 4) NOT NULL,
	[OpenRate] [decimal](18, 4) NOT NULL,
	[OptOutRate] [decimal](18, 4) NOT NULL,
	[UniqueClicks] [int] NOT NULL,
	[UniqueOpens] [int] NOT NULL,
	[ClickThroughRate] [decimal](18, 4) NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_FactFastMail]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactFastMail] ON [Analysis].[FactFastMail]
(
	[FK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_FactFastMail_1]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactFastMail_1] ON [Analysis].[FactFastMail]
(
	[FK_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
/****** Object:  Index [IX_FactFastMail_2]    Script Date: 5/15/2018 12:02:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_FactFastMail_2] ON [Analysis].[FactFastMail]
(
	[FK_FastMailType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [Analysis].[FactFastMail]  WITH CHECK ADD  CONSTRAINT [FK_FactFastMail_DimDate] FOREIGN KEY([FK_Date])
REFERENCES [Analysis].[DimDate] ([PK_Date])
ALTER TABLE [Analysis].[FactFastMail] CHECK CONSTRAINT [FK_FactFastMail_DimDate]
ALTER TABLE [Analysis].[FactFastMail]  WITH CHECK ADD  CONSTRAINT [FK_FactFastMail_DimFastMailType] FOREIGN KEY([FK_FastMailType])
REFERENCES [Analysis].[DimFastMailType] ([PK_FastMailType])
ALTER TABLE [Analysis].[FactFastMail] CHECK CONSTRAINT [FK_FactFastMail_DimFastMailType]
ALTER TABLE [Analysis].[FactFastMail]  WITH CHECK ADD  CONSTRAINT [FK_FactFastMail_DimStore] FOREIGN KEY([FK_Store])
REFERENCES [Analysis].[DimStore] ([PK_Store])
ALTER TABLE [Analysis].[FactFastMail] CHECK CONSTRAINT [FK_FactFastMail_DimStore]
GO
