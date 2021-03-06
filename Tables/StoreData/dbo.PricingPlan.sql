/****** Object:  Table [dbo].[PricingPlan]    Script Date: 5/15/2018 12:06:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PricingPlan](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[PricingPlanTypeID] [int] NULL,
	[GoodsItemID] [int] NULL,
	[GoodsItemClassTypeID] [int] NULL,
	[SetUpFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BaseMinimum] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OverallMinimum] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RoundingFactor] [decimal](18, 4) NULL,
	[CommissionPlanID] [int] NULL,
	[RoyaltyPlanID] [int] NULL,
	[ScreenTemplateID] [int] NULL,
	[WebInputTemplateID] [int] NULL,
	[InvoiceTemplateID] [int] NULL,
	[EstimateTemplateID] [int] NULL,
	[WorkOrderTemplateID] [int] NULL,
	[EmployeeWebOutputTemplateID] [int] NULL,
	[CustomerWebOutputTemplateID] [int] NULL,
	[QtyDiscountTableID] [int] NULL,
	[OverallDiscountTableID] [int] NULL,
	[PerPieceMinimum] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseCustomPriceMethod] [bit] NULL,
	[UnitPriceParameterID] [int] NULL,
	[UnitPriceParameterClassTypeID] [int] NULL,
	[OverheadFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaterialCostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LaborCostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EquipmentCostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OutsourceCostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OtherCostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IncludeModifierCost] [bit] NULL,
	[CostMultiplierType] [int] NULL,
	[AccountCodeID] [int] NULL,
	[FamilyID] [int] NULL,
	[FamilyStoreID] [int] NULL,
	[FamilyClassTypeID] [int] NULL,
	[UnitPriceVariableID] [int] NULL,
	[UnitPriceVariableStoreID] [int] NULL,
	[UnitPriceVariableClassTypeID] [int] NULL,
	[PreDiscountFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BuiltInDiscountFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultDiscountFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FreightFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WarningFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ErrorFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PreDiscountType] [int] NULL,
	[EvaluateOnSaveFormulas] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingPlanTypeName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AccountCodeIDOV] [bit] NULL,
	[GLDepartmentID] [int] NULL,
	[GLDepartmentIDOV] [bit] NULL,
	[MaterialExpenseID] [int] NULL,
	[LaborExpenseID] [int] NULL,
	[EquipmentExpenseID] [int] NULL,
	[OutsourceExpenseID] [int] NULL,
	[OtherExpenseID] [int] NULL,
	[FreightExpenseID] [int] NULL,
	[LocationExpenseID] [int] NULL,
	[UseCategoryDefaults] [bit] NULL,
	[UseParentItemSettings] [bit] NULL,
 CONSTRAINT [PricingPlan_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_PricingPlan_ComissionPlanID]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Index_PricingPlan_ComissionPlanID] ON [dbo].[PricingPlan]
(
	[CommissionPlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PricingPlan_GoodsItemID]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Index_PricingPlan_GoodsItemID] ON [dbo].[PricingPlan]
(
	[GoodsItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PricingPlan_InvoiceTemplateID]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Index_PricingPlan_InvoiceTemplateID] ON [dbo].[PricingPlan]
(
	[InvoiceTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PricingPlan_OverallDiscountTableID]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Index_PricingPlan_OverallDiscountTableID] ON [dbo].[PricingPlan]
(
	[OverallDiscountTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PricingPlan_QtyDiscountTableID]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Index_PricingPlan_QtyDiscountTableID] ON [dbo].[PricingPlan]
(
	[QtyDiscountTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PricingPlan_RoyalityPlanID]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Index_PricingPlan_RoyalityPlanID] ON [dbo].[PricingPlan]
(
	[RoyaltyPlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PricingPlan_ScreenTemplateID]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Index_PricingPlan_ScreenTemplateID] ON [dbo].[PricingPlan]
(
	[ScreenTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_PricingPlan]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_PricingPlan] ON [dbo].[PricingPlan]
(
	[PricingPlanTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
