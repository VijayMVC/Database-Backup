/****** Object:  Table [Royalty].[FranchiseFact]    Script Date: 5/15/2018 11:59:42 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Royalty].[FranchiseFact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CenterKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[T_StoreNumber] [int] NOT NULL,
	[Sales_Amt] [money] NULL,
	[Receivables_Amt] [money] NULL,
	[WIP_Amt] [money] NULL,
	[Built_Balance_Amt] [money] NULL,
	[WIP_Built_Balance_Amt] [money] NULL,
	[Voids] [int] NULL,
	[Voids_Amt] [money] NULL,
 CONSTRAINT [IX_FranchiseFact] UNIQUE NONCLUSTERED 
(
	[CenterKey] ASC,
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
