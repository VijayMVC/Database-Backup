/****** Object:  Table [dbo].[Inventory]    Script Date: 5/15/2018 12:06:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Inventory](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ItemName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartID] [int] NULL,
	[AverageCost] [float] NULL,
	[QuantityAvailable] [float] NULL,
	[QuantityBilled] [float] NULL,
	[QuantityExpected] [float] NULL,
	[QuantityOnHand] [float] NULL,
	[QuantityOnOrder] [float] NULL,
	[QuantityReceivedOnly] [float] NULL,
	[QuantityReserved] [float] NULL,
	[AssetAccountID] [int] NULL,
	[UnitType] [int] NULL,
	[UnitID] [int] NULL,
	[YellowNotificationPoint] [float] NULL,
	[RedNotificationPoint] [float] NULL,
	[ReorderPoint] [float] NULL,
	[ReOrderQuantity] [float] NULL,
	[AssetAccountClassTypeID] [int] NULL,
	[UseCategoryDefaults] [bit] NULL,
	[WarehouseID] [int] NULL,
	[DivisionID] [int] NULL,
 CONSTRAINT [Inventory_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_Inventory_DivisionID]    Script Date: 5/15/2018 12:06:47 PM ******/
CREATE NONCLUSTERED INDEX [Index_Inventory_DivisionID] ON [dbo].[Inventory]
(
	[DivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Inventory_PartID]    Script Date: 5/15/2018 12:06:47 PM ******/
CREATE NONCLUSTERED INDEX [Index_Inventory_PartID] ON [dbo].[Inventory]
(
	[PartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Inventory_WarehouseID]    Script Date: 5/15/2018 12:06:47 PM ******/
CREATE NONCLUSTERED INDEX [Index_Inventory_WarehouseID] ON [dbo].[Inventory]
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
