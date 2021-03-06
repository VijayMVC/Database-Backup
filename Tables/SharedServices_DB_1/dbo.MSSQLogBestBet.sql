/****** Object:  Table [dbo].[MSSQLogBestBet]    Script Date: 5/15/2018 12:05:14 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSQLogBestBet](
	[bestBetId] [int] IDENTITY(1,1) NOT NULL,
	[bestBet] [nvarchar](100) COLLATE Latin1_General_CI_AS_KS_WS NULL,
	[lastReference] [smalldatetime] NULL
) ON [PRIMARY]

/****** Object:  Index [PK_MSSQLogBestBet]    Script Date: 5/15/2018 12:05:14 PM ******/
CREATE CLUSTERED INDEX [PK_MSSQLogBestBet] ON [dbo].[MSSQLogBestBet]
(
	[bestBetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [IX_MSSQLogBestBet]    Script Date: 5/15/2018 12:05:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_MSSQLogBestBet] ON [dbo].[MSSQLogBestBet]
(
	[bestBet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
