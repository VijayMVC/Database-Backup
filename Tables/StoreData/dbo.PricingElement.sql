/****** Object:  Table [dbo].[PricingElement]    Script Date: 5/15/2018 12:06:52 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PricingElement](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ParentID] [int] NULL,
	[ParentStoreID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[ElementName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortIndex] [float] NULL,
	[LinkID] [int] NULL,
	[LinkStoreID] [int] NULL,
	[LinkClassTypeID] [int] NULL,
	[ItemPrefix] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IncomeID] [int] NULL,
	[IncomeStoreID] [int] NULL,
	[IncomeClassTypeID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[FamilyID] [int] NULL,
	[FamilyStoreID] [int] NULL,
	[FamilyClassTypeID] [int] NULL,
	[GLDepartmentID] [int] NULL,
	[GLDepartmentClassTypeID] [int] NULL,
	[GLDepartmentIDOV] [bit] NULL,
	[DefaultIncomeIDOV] [bit] NULL,
	[ExpenseID] [int] NULL,
	[ExpenseClassTypeID] [int] NULL,
	[PartType] [int] NULL,
	[UseCategoryDefaults] [bit] NULL,
	[DefaultTrackCosts] [bit] NULL,
	[DefaultAccrueCosts] [bit] NULL,
	[DefaultTrackInventory] [bit] NULL,
	[ComputedCostID] [int] NULL,
	[ComputedCostClassTypeID] [int] NULL,
	[UDFLayoutSettings] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LocalTags] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultAssetAccountID] [int] NULL,
	[DefaultAssetAccountClassTypeID] [int] NULL,
	[MaterialExpenseID] [int] NULL,
	[MaterialExpenseClassTypeID] [int] NULL,
	[LaborExpenseID] [int] NULL,
	[LaborExpenseClassTypeID] [int] NULL,
	[EquipmentExpenseID] [int] NULL,
	[EquipmentExpenseClassTypeID] [int] NULL,
	[OutsourceExpenseID] [int] NULL,
	[OutsourceExpenseClassTypeID] [int] NULL,
	[OtherExpenseID] [int] NULL,
	[OtherExpenseClassTypeID] [int] NULL,
	[FreightExpenseID] [int] NULL,
	[FreightExpenseClassTypeID] [int] NULL,
	[LocationExpenseID] [int] NULL,
	[LocationExpenseClassTypeID] [int] NULL,
	[ApplyMaterialTemplate] [bit] NULL,
	[ApplyLaborTemplate] [bit] NULL,
	[ApplyEquipmentTemplate] [bit] NULL,
	[ApplyOutsourceTemplate] [bit] NULL,
	[ApplyOtherTemplate] [bit] NULL,
	[ApplyFreightTemplate] [bit] NULL,
	[ApplyLocationTemplate] [bit] NULL,
	[DivisionID] [int] NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PricingElement_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [Index_PricingElement_ElementName]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Index_PricingElement_ElementName] ON [dbo].[PricingElement]
(
	[ElementName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_PricingElement]    Script Date: 5/15/2018 12:06:52 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_PricingElement] ON [dbo].[PricingElement]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
