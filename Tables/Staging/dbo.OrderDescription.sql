/****** Object:  Table [dbo].[OrderDescription]    Script Date: 5/15/2018 12:06:27 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderDescription](
	[OrderDetailID] [int] NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SignText] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderID] [int] NULL,
	[OrderDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
