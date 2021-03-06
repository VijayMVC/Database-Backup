/****** Object:  Table [dbo].[MSSBestBetsLink]    Script Date: 5/15/2018 12:09:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSBestBetsLink](
	[SpecialTermID] [int] NOT NULL,
	[BestBetID] [int] NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [U_BestBetLink] UNIQUE NONCLUSTERED 
(
	[SpecialTermID] ASC,
	[BestBetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_TERM_SpecialTermID]    Script Date: 5/15/2018 12:09:05 PM ******/
CREATE CLUSTERED INDEX [IX_TERM_SpecialTermID] ON [dbo].[MSSBestBetsLink]
(
	[SpecialTermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
ALTER TABLE [dbo].[MSSBestBetsLink]  WITH NOCHECK ADD  CONSTRAINT [FK_MSSBestBetsLink_BESTBETID] FOREIGN KEY([BestBetID])
REFERENCES [dbo].[MSSBestBets] ([BestBetID])
ALTER TABLE [dbo].[MSSBestBetsLink] CHECK CONSTRAINT [FK_MSSBestBetsLink_BESTBETID]
ALTER TABLE [dbo].[MSSBestBetsLink]  WITH NOCHECK ADD  CONSTRAINT [FK_MSSBestBetsLink_SpecialTermID] FOREIGN KEY([SpecialTermID])
REFERENCES [dbo].[MSSSpecialTerms] ([SpecialTermID])
ON DELETE CASCADE
ALTER TABLE [dbo].[MSSBestBetsLink] CHECK CONSTRAINT [FK_MSSBestBetsLink_SpecialTermID]
/****** Object:  Trigger [dbo].[trigger_BestBetDeleteTrig]    Script Date: 5/15/2018 12:09:05 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TRIGGER trigger_BestBetDeleteTrig 
ON MSSBestBetsLink AFTER DELETE
AS
DELETE FROM MSSBestBets WHERE BestBetId IN 
(SELECT bestbetid FROM deleted WHERE bestbetid not in 
(SELECT DISTINCT BestBetId FROM MSSBestbetsLink ))

GO
