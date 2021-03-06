/****** Object:  Table [dbo].[PaymentFactUpdate]    Script Date: 5/15/2018 12:06:28 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PaymentFactUpdate](
	[PaymentFactKey] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerID] [int] NULL,
	[CustomerKey] [int] NULL,
	[OrderID] [int] NULL,
	[OrderKey] [int] NULL,
	[PaymentAmount] [money] NULL,
	[EnteredByID] [int] NULL,
	[EnteredByKey] [int] NULL,
	[PaymentDate] [date] NULL,
	[PaymentMethodKey] [int] NULL,
	[PaymentMethodType] [int] NULL,
	[TrackingNumberKey] [int] NULL,
	[Voided] [bit] NULL,
	[VoidDate] [date] NULL,
	[VoidAmount] [money] NULL,
	[ReasonKey] [int] NULL,
	[PaymentOnOrder] [bit] NULL,
	[Refund] [bit] NULL,
	[TakenForStoreID] [int] NULL,
	[TakenForOrderID] [int] NULL,
	[TakenForCustomerInfoKey] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL
) ON [PRIMARY]

GO
