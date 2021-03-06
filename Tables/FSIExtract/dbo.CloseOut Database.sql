/****** Object:  Table [dbo].[CloseOut Database]    Script Date: 5/15/2018 12:01:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CloseOut Database](
	[Date] [datetime] NOT NULL,
	[StoreID] [int] NOT NULL,
	[CloseOutType] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SignSales] [money] NULL,
	[AVISales] [money] NULL,
	[InstallSales] [money] NULL,
	[ProductionCat1Sales] [money] NULL,
	[ProductionCat2Sales] [money] NULL,
	[ProductionCat3Sales] [money] NULL,
	[SalesSubtotal] [money] NULL,
	[TaxExemptAmount] [money] NULL,
	[CountySalesTax] [money] NULL,
	[StateSalesTax] [money] NULL,
	[TaxTotal] [money] NULL,
	[DiscountAmount] [money] NULL,
	[ShippingCharge] [money] NULL,
	[InterestAmount] [money] NULL,
	[SalesTotal] [money] NULL,
	[WriteOffAmount] [money] NULL,
	[OrderPayments] [money] NULL,
	[OtherPayments] [money] NULL,
	[CloseOutPersonID] [int] NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
