/****** Object:  Table [dbo].[Staging XML]    Script Date: 5/15/2018 12:06:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Staging XML](
	[ID] [int] NULL,
	[OrderDetailID] [int] NULL,
	[AVID] [int] NULL,
	[OrderID] [int] NULL,
	[Answer] [int] NULL,
	[Price] [float] NULL,
	[PriceOverridden] [int] NULL,
	[CalcPrice] [int] NULL,
	[DetailKey] [int] NULL,
	[XMLLineNumber] [int] NULL
) ON [PRIMARY]

GO
