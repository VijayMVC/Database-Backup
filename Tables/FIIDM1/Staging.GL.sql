/****** Object:  Table [Staging].[GL]    Script Date: 5/15/2018 11:59:57 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Staging].[GL](
	[DateTime] [datetime] NULL,
	[OrderID] [int] NULL,
	[CustomerID] [int] NULL,
	[AccountCode] [int] NULL,
	[Amount] [money] NULL,
	[Closed] [bit] NULL,
	[ClosedDate] [datetime] NULL,
	[SubAccountCode] [int] NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WebNumber] [smallint] NULL
) ON [PRIMARY]

GO
