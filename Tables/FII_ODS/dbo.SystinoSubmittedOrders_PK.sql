/****** Object:  Table [dbo].[SystinoSubmittedOrders_PK]    Script Date: 5/15/2018 11:59:27 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SystinoSubmittedOrders_PK](
	[OrderID] [int] NOT NULL,
	[FranchiseID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Submitted] [bit] NULL,
	[DateSubmitted] [datetime] NULL,
	[StoreID] [int] NULL
) ON [PRIMARY]

GO
