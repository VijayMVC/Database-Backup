/****** Object:  Table [dbo].[tmp_LastPickedUpCB]    Script Date: 5/15/2018 11:59:28 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[tmp_LastPickedUpCB](
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerKey] [int] NOT NULL,
	[CompanyNameKey] [int] NULL,
	[CompanyNameName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Max_OrderCompletionDate] [datetimeoffset](7) NULL,
	[LastSaleAmount] [numeric](2, 2) NOT NULL
) ON [PRIMARY]

GO
