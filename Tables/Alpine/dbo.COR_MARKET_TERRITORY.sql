/****** Object:  Table [dbo].[COR_MARKET_TERRITORY]    Script Date: 5/15/2018 11:58:35 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[COR_MARKET_TERRITORY](
	[StoreID] [bigint] NOT NULL,
	[PostalCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL
) ON [PRIMARY]

GO
