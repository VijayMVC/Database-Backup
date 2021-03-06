/****** Object:  Table [dbo].[OrderConsolidated_Hold]    Script Date: 5/15/2018 11:59:04 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderConsolidated_Hold](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyLocationId] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[FranchiseName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderId] [int] NULL,
	[LocationId] [int] NULL,
	[ProductionFacilityId] [int] NULL,
	[AccountId] [int] NULL,
	[ShippingContactId] [int] NULL,
	[InvoiceContactId] [int] NULL,
	[OrderContactId] [int] NULL,
	[ShippingAddressId] [int] NULL,
	[InvoiceAddressId] [int] NULL,
	[IsUpdate] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL
) ON [PRIMARY]

GO
