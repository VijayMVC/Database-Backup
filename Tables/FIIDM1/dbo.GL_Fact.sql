/****** Object:  Table [dbo].[GL_Fact]    Script Date: 5/15/2018 11:59:52 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GL_Fact](
	[DateKey] [int] NULL,
	[StoreKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[AccountCode] [int] NULL,
	[RoyaltyAmt] [money] NULL,
	[Closed] [bit] NULL
) ON [PRIMARY]

GO
