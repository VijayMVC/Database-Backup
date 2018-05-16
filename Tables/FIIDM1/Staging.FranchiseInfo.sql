/****** Object:  Table [Staging].[FranchiseInfo]    Script Date: 5/15/2018 11:59:57 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Staging].[FranchiseInfo](
	[DateKey] [int] NULL,
	[FS Center] [int] NULL,
	[Sales] [money] NULL,
	[Receivables] [money] NULL,
	[WIP ] [money] NULL,
	[Built Balance] [money] NULL,
	[WIP & Built Bal] [money] NULL,
	[# of Voids] [int] NULL,
	[Amount of Voids] [money] NULL,
	[Type] [int] NULL
) ON [PRIMARY]

GO
