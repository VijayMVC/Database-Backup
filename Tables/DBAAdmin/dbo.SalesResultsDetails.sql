/****** Object:  Table [dbo].[SalesResultsDetails]    Script Date: 5/15/2018 11:59:10 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SalesResultsDetails](
	[DatabaseId] [int] NULL,
	[FranchiseName] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LocationId] [int] NULL,
	[LocationName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderId] [int] NULL,
	[OrderActive] [int] NULL,
	[OrderStatusId] [int] NULL,
	[InvoiceNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderCompletionDate] [datetime] NULL,
	[OrderClosedDate] [datetime] NULL,
	[OrderBuiltDate] [datetime] NULL,
	[OrderCreatedDate] [datetime] NULL,
	[AccountId] [int] NULL,
	[CompanyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IndustryType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CustomerType] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReferredByTypeId] [int] NULL,
	[CustomerOrigin] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalesPersonId] [int] NULL,
	[SalesPersonName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EnteredByUserId] [int] NULL,
	[CostOfGoodsSold] [decimal](18, 6) NULL,
	[AdditionalCosts] [decimal](18, 6) NULL,
	[Amount] [decimal](18, 6) NULL,
	[NewSubtotal] [decimal](18, 6) NULL,
	[ShippingAmount] [decimal](18, 6) NULL,
	[PostageAmount] [decimal](18, 6) NULL,
	[TaxesPrice] [decimal](18, 6) NULL,
	[MasterAccountId] [int] NULL,
	[MasterAccountName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
