/****** Object:  Table [dbo].[MSSAnchorTransactions]    Script Date: 5/15/2018 12:05:23 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[MSSAnchorTransactions](
	[DocID] [int] NOT NULL
) ON [PRIMARY]

/****** Object:  Index [IX_MSSAchorTransactions]    Script Date: 5/15/2018 12:05:23 PM ******/
CREATE CLUSTERED INDEX [IX_MSSAchorTransactions] ON [dbo].[MSSAnchorTransactions]
(
	[DocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
