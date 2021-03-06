/****** Object:  Table [dbo].[Variable]    Script Date: 5/15/2018 12:07:03 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Variable](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[VariableName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentID] [int] NULL,
	[ParentStoreID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[VariableType] [int] NULL,
	[InputUnitID] [int] NULL,
	[OutputUnitID] [int] NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsRequired] [bit] NULL,
	[TextValue] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NumberValue] [float] NULL,
	[UseFormula] [bit] NULL,
	[Formula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MaxValue] [float] NULL,
	[MinValue] [float] NULL,
	[SelectionListID] [int] NULL,
	[SelectionListStoreID] [int] NULL,
	[SelectionListClassTypeID] [int] NULL,
	[UseSecondaryList] [bit] NULL,
	[SecondaryListVariableID] [int] NULL,
	[SecondaryListVariableStoreID] [int] NULL,
	[SecondaryListVariableClassTypeID] [int] NULL,
	[IsLimitedToList] [bit] NULL,
	[Part2ConsumptionFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartConsumptionFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsModifierVariable] [bit] NULL,
	[SaveTransRecord] [bit] NULL,
	[SystemListType] [int] NULL,
	[UnitType] [int] NULL,
	[PricingPlanID] [int] NULL,
	[PricingPlanStoreID] [int] NULL,
	[PricingPlanClassTypeID] [int] NULL,
	[PricingTableID] [int] NULL,
	[PricingTableStoreID] [int] NULL,
	[PricingTableClassTypeID] [int] NULL,
	[PartDescription] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Part2Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AltDependentListName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseRequiredFormula] [bit] NULL,
	[IsRequiredFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SelectionListFilterName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartConsumptionFormulas] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseMaxValueFormula] [bit] NULL,
	[MaxValueFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseMinValueFormula] [bit] NULL,
	[MinValueFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImageLinkName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImageSaveType] [int] NULL,
	[ResetOnClone] [bit] NULL,
	[PartConsumptionUnitIDs] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SaveOption] [int] NULL,
	[IsProductionVar] [bit] NULL,
 CONSTRAINT [Variable_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_Variable_ParentIDIndex]    Script Date: 5/15/2018 12:07:03 PM ******/
CREATE NONCLUSTERED INDEX [Index_Variable_ParentIDIndex] ON [dbo].[Variable]
(
	[ParentID] ASC,
	[ParentStoreID] ASC,
	[ParentClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
