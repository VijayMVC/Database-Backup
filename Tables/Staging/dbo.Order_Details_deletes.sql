/****** Object:  Table [dbo].[Order_Details_deletes]    Script Date: 5/15/2018 12:06:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Order_Details_deletes](
	[StoreID] [int] NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zw_active] [bit] NULL,
	[zw_pk_id] [int] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[OrderDetailID] [int] NULL,
	[LineItemNumber] [int] NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[ProductCode] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quantity] [float] NULL,
	[Sides] [float] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[ForegroundColor] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BackgroundColor] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Font] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BasePrice] [money] NULL,
	[BasePriceOverriden] [bit] NULL,
	[BasePriceCalculated] [money] NULL,
	[AVTotal] [money] NULL,
	[InstallAmount] [money] NULL,
	[DiscountPercentage] [float] NULL,
	[DiscountAmount] [money] NULL,
	[ItemTotal] [money] NULL,
	[UnitPriceOverridden] [bit] NULL,
	[OverRidden] [bit] NULL,
	[ItemTotalCalculated] [money] NULL,
	[Taxable] [bit] NULL,
	[AllInstallation] [bit] NULL,
	[Description] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SignText] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AVIDS] [binary](100) NULL,
	[AVValues] [binary](25) NULL,
	[AVAdditionalAmt] [money] NULL,
	[AVAdditionalDescription] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AVOverridden] [bit] NULL,
	[AVCalculated] [money] NULL,
	[ProductionLocation] [int] NULL,
	[ShopTime] [float] NULL,
	[FieldTime] [float] NULL,
	[FieldCrewSize] [float] NULL,
	[MaterialCost] [money] NULL,
	[HeightAboveGround] [float] NULL,
	[OtherInstallConsideration] [money] NULL,
	[SpecialEquipment1] [bit] NULL,
	[SpecialEquipment2] [bit] NULL,
	[SpecialEquipment3] [bit] NULL,
	[SpecialEquipmentOther] [bit] NULL,
	[SpecialEquipmentOtherAmou] [money] NULL,
	[EstimatedInstallCharge] [money] NULL,
	[AccountCode] [int] NULL,
	[Hidden] [bit] NULL,
	[PMsAnswered] [bit] NULL,
	[ParentItemNumber] [int] NULL,
	[ChildLevel] [int] NULL,
	[BaseCost] [money] NULL,
	[ProductionNotes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HasChildren] [bit] NULL,
	[BaseSonsPrice] [float] NULL,
	[BaseMeAndSonsPrice] [float] NULL,
	[InstallSonsPrice] [float] NULL,
	[InstallMeAndSonsPrice] [float] NULL,
	[DiscountSonsPrice] [float] NULL,
	[DiscountMeAndSonsPrice] [float] NULL,
	[ItemTotalSonsPrice] [float] NULL,
	[ItemTotalMeAndSonsPrice] [float] NULL,
	[ModifierXML] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoyaltyGroupID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
