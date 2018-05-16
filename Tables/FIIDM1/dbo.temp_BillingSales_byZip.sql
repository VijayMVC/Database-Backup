/****** Object:  Table [dbo].[temp_BillingSales_byZip]    Script Date: 5/15/2018 11:59:55 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[temp_BillingSales_byZip](
	[StoreNumber] [bigint] NULL,
	[BillingZip] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sales] [decimal](38, 6) NULL
) ON [PRIMARY]

GO
