/****** Object:  Table [dbo].[SLS_ROYALTY_PAYMENT]    Script Date: 5/15/2018 11:58:39 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SLS_ROYALTY_PAYMENT](
	[RoyaltyPaymentID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RoyaltyPaymentType] [bigint] NULL,
	[PaymentAmount] [numeric](18, 2) NOT NULL,
	[ReferenceNo] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoyaltyCurrencyType] [bigint] NULL,
	[ExchangeRate] [numeric](18, 10) NULL,
	[StoreID] [bigint] NULL,
	[AuditID] [bigint] NULL,
	[Status] [bigint] NULL,
	[RoyaltyPaymentReceived] [datetime] NULL,
 CONSTRAINT [PK_SLS_ROYALTY_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[RoyaltyPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
) ON [PRIMARY]

GO
