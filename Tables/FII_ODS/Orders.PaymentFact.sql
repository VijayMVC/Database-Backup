/****** Object:  Table [Orders].[PaymentFact]    Script Date: 5/15/2018 11:59:37 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Orders].[PaymentFact](
	[PaymentFactKey] [int] IDENTITY(1,1) NOT NULL,
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
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NULL,
 CONSTRAINT [PK_PaymentFact] PRIMARY KEY CLUSTERED 
(
	[PaymentFactKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
