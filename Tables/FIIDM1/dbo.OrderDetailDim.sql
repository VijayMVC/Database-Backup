/****** Object:  Table [dbo].[OrderDetailDim]    Script Date: 5/15/2018 11:59:53 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderDetailDim](
	[DiscountAmount] [money] NULL,
	[Quantity] [float] NULL,
	[BasePrice] [money] NULL,
	[BasePriceOverriden] [bit] NULL,
	[BasePriceCalculated] [money] NULL,
	[AVTotal] [money] NULL,
	[InstallAmount] [money] NULL,
	[DiscountPercentage] [float] NULL,
	[ItemTotal] [money] NULL,
	[UnitPriceOverridden] [bit] NULL,
	[OverRidden] [bit] NULL,
	[ItemTotalCalculated] [money] NULL,
	[Taxable] [bit] NULL,
	[ShopTime] [float] NULL,
	[FieldTime] [float] NULL,
	[FieldCrewSize] [float] NULL,
	[MaterialCost] [money] NULL,
	[AccountCode] [int] NULL,
	[BaseCost] [money] NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[T_WebNumber] [smallint] NULL,
	[T_OrderID] [int] NULL,
	[T_OrderDetailID] [int] NULL,
	[T_StoreID] [int] NULL,
	[T_LineItemNumber] [int] NULL,
	[T_ProductID] [int] NULL,
	[T_ProductCode] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[T_ZW_Franchise_ID] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
