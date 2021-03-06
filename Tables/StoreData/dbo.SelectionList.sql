/****** Object:  Table [dbo].[SelectionList]    Script Date: 5/15/2018 12:06:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[SelectionList](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ListName] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CategoryID] [int] NULL,
	[Format] [int] NULL,
	[DefaultListValue] [decimal](18, 4) NULL,
	[DefaultListCost] [float] NULL,
	[DefaultSecondaryListID] [int] NULL,
	[DefaultSecondaryListStoreID] [int] NULL,
	[DefaultSecondaryListClassTypeID] [int] NULL,
	[DefaultPriceFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultCostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPartID] [int] NULL,
	[DefaultPartStoreID] [int] NULL,
	[DefaultPartClassTypeID] [int] NULL,
	[DefaultPartConsumptionFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultProperties] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultSecondaryListDefault] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPart2ID] [int] NULL,
	[DefaultPart2StoreID] [int] NULL,
	[DefaultPart2ClassTypeID] [int] NULL,
	[DefaultPart2ConsumptionFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankListValue] [float] NULL,
	[BlankListCost] [float] NULL,
	[BlankSecondaryListID] [int] NULL,
	[BlankSecondaryListStoreID] [int] NULL,
	[BlankSecondaryListClassTypeID] [int] NULL,
	[BlankPriceFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankCostFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankPartID] [int] NULL,
	[BlankPartStoreID] [int] NULL,
	[BlankPartClassTypeID] [int] NULL,
	[BlankPartConsumptionFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankProperties] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankSecondaryListBlank] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankPart2ID] [int] NULL,
	[BlankPart2StoreID] [int] NULL,
	[BlankPart2ClassTypeID] [int] NULL,
	[BlankPart2ConsumptionFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankUseDefaultPart] [bit] NULL,
	[BlankUseDefaultPart2] [bit] NULL,
	[DefaultPriceFormulaType] [int] NULL,
	[DefaultCostFormulaType] [int] NULL,
	[BlankPriceFormulaType] [int] NULL,
	[BlankCostFormulaType] [int] NULL,
	[DefaultItemColor] [int] NULL,
	[BlankItemColor] [int] NULL,
	[DefaultPartDescription] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPart2Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankPartDescription] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankPart2Description] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPartLinksXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankPartLinksXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultDependentLinksXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankDependentLinksXML] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultFilters] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankFilters] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultImageLinks] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlankImageLinks] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AutoSort] [bit] NULL,
	[AutoSortType] [int] NULL,
	[IncludeNewListItem] [bit] NULL,
	[IncludeNewListItemType] [int] NULL,
	[NewItemTemplateID] [int] NULL,
	[NewItemTemplateClassTypeID] [int] NULL,
	[IsReplenishingParts] [bit] NULL,
	[DefaultProducedInvValueFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultGLAdjAccountID] [int] NULL,
	[DefaultGLAdjAccountClassTypeID] [int] NULL,
 CONSTRAINT [SelectionList_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_SelectionList_CategoryID]    Script Date: 5/15/2018 12:06:56 PM ******/
CREATE NONCLUSTERED INDEX [Index_SelectionList_CategoryID] ON [dbo].[SelectionList]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Index_SelectionList_ListName]    Script Date: 5/15/2018 12:06:56 PM ******/
CREATE NONCLUSTERED INDEX [Index_SelectionList_ListName] ON [dbo].[SelectionList]
(
	[ListName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
