/****** Object:  Table [dbo].[SelectionListItem]    Script Date: 5/15/2018 12:06:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SelectionListItem](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[SelectionListID] [int] NULL,
	[ItemText] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ListValue] [decimal](18, 4) NULL,
	[CostValue] [float] NULL,
	[SortIndex] [int] NULL,
	[SecondaryListID] [int] NULL,
	[SecondaryListStoreID] [int] NULL,
	[SecondaryListClassTypeID] [int] NULL,
	[PriceFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartID] [int] NULL,
	[PartStoreID] [int] NULL,
	[PartClassTypeID] [int] NULL,
	[PartConsumptionFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseDefaultPart] [bit] NULL,
	[ItemProperties] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecondaryListDefault] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Part2ID] [int] NULL,
	[Part2StoreID] [int] NULL,
	[Part2ClassTypeID] [int] NULL,
	[Part2ConsumptionFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseDefaultPart2] [bit] NULL,
	[PriceFormulaType] [int] NULL,
	[CostFormulaType] [int] NULL,
	[ItemColor] [int] NULL,
	[PartDescription] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Part2Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartLinksXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DependentLinksXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemFilters] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemImageLinks] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DynamicLinkID] [int] NULL,
	[DynamicLinkClassTypeID] [int] NULL,
	[ProducedInventoryValueFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GLAdjustmentAccountID] [int] NULL,
	[GLAdjustmentAccountClassTypeID] [int] NULL,
 CONSTRAINT [SelectionListItem_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_SelectionListItem_SelectionListID]    Script Date: 5/15/2018 12:06:56 PM ******/
CREATE NONCLUSTERED INDEX [Index_SelectionListItem_SelectionListID] ON [dbo].[SelectionListItem]
(
	[SelectionListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
