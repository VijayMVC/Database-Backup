/****** Object:  Table [dbo].[MSSConsumerGpLink]    Script Date: 5/15/2018 12:09:06 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSConsumerGpLink](
	[SpecialTermID] [int] NOT NULL,
	[ConsumerGpId] [nvarchar](50) COLLATE Latin1_General_CI_AS_KS_WS NULL,
 CONSTRAINT [U_ConsumerGp] UNIQUE NONCLUSTERED 
(
	[SpecialTermID] ASC,
	[ConsumerGpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [IX_SpecialTerm_ConsumerGp]    Script Date: 5/15/2018 12:09:06 PM ******/
CREATE CLUSTERED INDEX [IX_SpecialTerm_ConsumerGp] ON [dbo].[MSSConsumerGpLink]
(
	[ConsumerGpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSConsumerGpLink]  WITH CHECK ADD  CONSTRAINT [FK_MSSConsumerGpLink_SpecialTermID] FOREIGN KEY([SpecialTermID])
REFERENCES [dbo].[MSSSpecialTerms] ([SpecialTermID])
ON DELETE CASCADE
ALTER TABLE [dbo].[MSSConsumerGpLink] CHECK CONSTRAINT [FK_MSSConsumerGpLink_SpecialTermID]
GO
