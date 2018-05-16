/****** Object:  Table [dbo].[TempKeyStoneFix]    Script Date: 5/15/2018 12:06:30 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TempKeyStoneFix](
	[CustomerID] [int] NULL,
	[ZW_Franchise_ID] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxIDExpDate] [datetime] NULL
) ON [PRIMARY]

GO
