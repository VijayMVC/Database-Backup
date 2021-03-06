/****** Object:  Table [dbo].[Part]    Script Date: 5/15/2018 12:06:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Part](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[CategoryID] [int] NULL,
	[CategoryStoreID] [int] NULL,
	[CategoryClassTypeID] [int] NULL,
	[ItemName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HelpText] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InternalNotes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BarCode] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SKU] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssetAccountID] [int] NULL,
	[ExpenseAccountID] [int] NULL,
	[InventoryUnitType] [int] NULL,
	[PartType] [int] NULL,
	[TrackInventory] [bit] NULL,
	[QuantityOnHand] [float] NULL,
	[QuantityReserved] [float] NULL,
	[QuantityAvailable] [float] NULL,
	[QuantityOnOrder] [float] NULL,
	[QuantityExpected] [float] NULL,
	[ReOrderPoint] [float] NULL,
	[ReOrderQuantity] [float] NULL,
	[YellowNotificationPoint] [float] NULL,
	[RedNotificationPoint] [float] NULL,
	[NotificationAddresses] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NotifyOtherContacts] [bit] NULL,
	[UnitID] [int] NULL,
	[RoundingOption] [int] NULL,
	[ScrapFactor] [float] NULL,
	[UnitCost] [float] NULL,
	[TrackCosts] [bit] NULL,
	[UnitCostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseFixedCost] [bit] NULL,
	[CostMultiplier] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CostMultiplierType] [int] NULL,
	[FixedCostMultiplier] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShowOnProductionSchedule] [bit] NULL,
	[InstancesAllowedType] [int] NULL,
	[InstancesAllowed] [int] NULL,
	[Vendor] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VendorPartNumber] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoundingFactor] [float] NULL,
	[StationID] [int] NULL,
	[StationClassTypeID] [int] NULL,
	[GLDepartmentID] [int] NULL,
	[GLDepartmentClassTypeID] [int] NULL,
	[InventoryID] [int] NULL,
	[AccrueCosts] [bit] NULL,
	[ExpenseAccountClassTypeID] [int] NULL,
	[AssetAccountClassTypeID] [int] NULL,
	[UseCategoryDefaults] [bit] NULL,
	[ComputedCostAccountID] [int] NULL,
	[ComputedCostAccountClassTypeID] [int] NULL,
	[LastModifiedDate] [datetime] NULL,
	[UDFLayoutSettings] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LocalTags] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UDFXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseInvUnitsForDisplay] [bit] NULL,
	[DisplayUnitID] [int] NULL,
	[DisplayUnitType] [int] NULL,
	[DisplayUnitText] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayConversionFormula] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [Part_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_Part_AssetAccountID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_Part_AssetAccountID] ON [dbo].[Part]
(
	[AssetAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Part_ExpenseAccountID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_Part_ExpenseAccountID] ON [dbo].[Part]
(
	[ExpenseAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Index_Part_ItemName]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_Part_ItemName] ON [dbo].[Part]
(
	[ItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_Part_PartType]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_Part_PartType] ON [dbo].[Part]
(
	[PartType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_Part]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_Part] ON [dbo].[Part]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
