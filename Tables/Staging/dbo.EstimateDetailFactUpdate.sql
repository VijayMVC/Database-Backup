/****** Object:  Table [dbo].[EstimateDetailFactUpdate]    Script Date: 5/15/2018 12:06:20 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[EstimateDetailFactUpdate](
	[EstimateDetailKey] [int] NOT NULL,
	[OrderDetailID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrderID] [int] NULL,
	[OrderHeaderKey] [int] NULL,
	[LineItemNumber] [int] NULL,
	[ProductID] [int] NULL,
	[ProductKey] [int] NULL,
	[ProductCodeKey] [int] NULL,
	[Quantity] [float] NULL,
	[Sides] [float] NULL,
	[Height] [float] NULL,
	[Width] [float] NULL,
	[ForegroundColorKey] [int] NULL,
	[BackgroundColorKey] [int] NULL,
	[FontKey] [int] NULL,
	[BasePrice] [money] NULL,
	[BasePriceOverriden] [bit] NULL,
	[BasePriceCalculated] [money] NULL,
	[AVTotal] [money] NULL,
	[InstallAmount] [money] NULL,
	[DiscountAmount] [money] NULL,
	[DiscountPercentage] [float] NULL,
	[ItemTotal] [money] NULL,
	[UnitPriceOverridden] [bit] NULL,
	[OverRidden] [bit] NULL,
	[ItemTotalCalculated] [money] NULL,
	[Taxable] [bit] NULL,
	[AllInstallation] [bit] NULL,
	[DescriptionKey] [int] NULL,
	[SignTextKey] [int] NULL,
	[AVAdditionalAmt] [money] NULL,
	[AVAdditionalDescriptionKey] [int] NULL,
	[AVOverridden] [bit] NULL,
	[AVCalculated] [money] NULL,
	[ProductionLocation] [int] NULL,
	[ShopTime] [float] NULL,
	[FieldTime] [float] NULL,
	[FieldCrewSize] [float] NULL,
	[MaterialCost] [money] NULL,
	[HeightAboveGround] [float] NULL,
	[ProductionCat3Sales] [money] NULL,
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
	[StateSalesTax] [money] NULL,
	[StateSalesTaxRate] [float] NULL,
	[ChildLevel] [int] NULL,
	[BaseCost] [money] NULL,
	[ProductionNotesKey] [int] NULL,
	[HasChildren] [bit] NULL,
	[BaseSonsPrice] [float] NULL,
	[BaseMeAndSonsPrice] [float] NULL,
	[InstallSonsPrice] [float] NULL,
	[InstallMeAndSonsPrice] [float] NULL,
	[DiscountSonsPrice] [float] NULL,
	[DiscountMeAndSonsPrice] [float] NULL,
	[ItemTotalSonsPrice] [float] NULL,
	[ItemTotalMeAndSonsPrice] [float] NULL,
	[RoyaltyGroupID] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[EstimateDetailFactUpdate] ADD  CONSTRAINT [DF_EstimateDetailFactUpdate_CenterKey]  DEFAULT ((-255)) FOR [CenterKey]
GO
