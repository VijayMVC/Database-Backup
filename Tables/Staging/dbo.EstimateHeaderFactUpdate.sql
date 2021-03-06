/****** Object:  Table [dbo].[EstimateHeaderFactUpdate]    Script Date: 5/15/2018 12:06:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EstimateHeaderFactUpdate](
	[EstimateHeaderKey] [int] NOT NULL,
	[OrderID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingRatio] [float] NULL,
	[DescriptionKey] [int] NULL,
	[NumberItems] [int] NULL,
	[CustomerID] [int] NULL,
	[CustomerKey] [int] NULL,
	[ContactID] [int] NULL,
	[ContactKey] [int] NULL,
	[OrdererFirstNameKey] [int] NULL,
	[OrdererLastNameKey] [int] NULL,
	[OrdererTitleKey] [int] NULL,
	[OrdererPareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererPhoneNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererPhoneExtention] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererFareaCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererFaxNumber] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrdererEmailAddress] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SalePersonID] [int] NULL,
	[SalePersonKey] [int] NULL,
	[EnteredByID] [int] NULL,
	[EnteredByKey] [int] NULL,
	[StatusKey] [int] NULL,
	[OnHold] [bit] NULL,
	[EstimateDate] [date] NULL,
	[OrderDate] [date] NULL,
	[DueDate] [date] NULL,
	[BuiltDate] [date] NULL,
	[VoidDate] [date] NULL,
	[PickedUpDate] [date] NULL,
	[WriteoffDate] [date] NULL,
	[HoldDate] [date] NULL,
	[LastInterestDate] [date] NULL,
	[ClosedDate] [date] NULL,
	[SignSales] [money] NULL,
	[AVISales] [money] NULL,
	[InstallSales] [money] NULL,
	[ProductionCat1Sales] [money] NULL,
	[ProductionCat2Sales] [money] NULL,
	[ProductionCat3Sales] [money] NULL,
	[ItemsTotal] [money] NULL,
	[SalesSubtotal] [money] NULL,
	[TaxableAmount] [money] NULL,
	[TaxExemptAmount] [money] NULL,
	[TaxExemptAmountCalculated] [money] NULL,
	[TaxExemptAmountOverridden] [bit] NULL,
	[TaxExempt] [bit] NULL,
	[TaxIDNumber] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TaxRegionID] [int] NULL,
	[CountySalesTax] [money] NULL,
	[CountySalesTaxRate] [float] NULL,
	[StateSalesTax] [money] NULL,
	[StateSalesTaxRate] [float] NULL,
	[TaxTotal] [money] NULL,
	[PromotionID] [int] NULL,
	[DiscountAmount] [money] NULL,
	[DiscountPercent] [float] NULL,
	[ShippingCharge] [money] NULL,
	[InterestAmount] [money] NULL,
	[SalesTotal] [money] NULL,
	[TotalPayments] [money] NULL,
	[BalanceOutstanding] [money] NULL,
	[WriteoffAmount] [money] NULL,
	[PurchaseOrderNumberKey] [int] NULL,
	[ShippingAddressKey] [int] NULL,
	[DispositionOnCompletionKey] [int] NULL,
	[OrderNotesKey] [int] NULL,
	[InstallNotesKey] [int] NULL,
	[EstimateNumber] [int] NULL,
	[ItemsDiscountTotal] [money] NULL,
	[DiscountTotal] [money] NULL,
	[DispositionOnCompletionID] [int] NULL,
	[CustomerNameKey] [int] NULL,
	[ShippingTaxable] [bit] NULL,
	[RoyaltyRate] [float] NULL,
	[JobBoxKey] [int] NULL,
	[ProofDate] [date] NULL,
	[LineItemsOverriden] [bit] NULL,
	[OrderOriginID] [int] NULL,
	[IsLocked] [bit] NULL,
	[LockedDate] [date] NULL,
	[LockedUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [date] NULL,
	[ModifiedUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InvoiceID] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NULL
) ON [PRIMARY]

GO
