/****** Object:  Table [dbo].[ProdModLink]    Script Date: 5/15/2018 12:06:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProdModLink](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ProductID] [int] NULL,
	[ModifierID] [int] NULL,
	[IsDisplayed] [int] NULL,
	[DisplayFormula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseDefault] [int] NULL,
	[DefaultValue] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseAlternateList] [bit] NULL,
	[SelectionListID] [int] NULL,
	[UseAltList] [bit] NULL,
	[AltListParamID] [int] NULL,
	[AltListParamStoreID] [int] NULL,
	[AltListParamClassTypeID] [int] NULL,
	[ShowInGrid] [bit] NULL,
	[DefaultPartConsumptionFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPart2ConsumptionFx] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AltDependentListName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartConsumptionFormulas] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartConsumptionUnitIDs] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductClassTypeID] [int] NULL,
	[StationID] [int] NULL,
	[StationClassTypeID] [int] NULL,
	[Formula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseFormula] [bit] NULL,
 CONSTRAINT [ProdModLink_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_ProdModLink_ModID]    Script Date: 5/15/2018 12:06:53 PM ******/
CREATE NONCLUSTERED INDEX [Index_ProdModLink_ModID] ON [dbo].[ProdModLink]
(
	[ModifierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_ProdModLink]    Script Date: 5/15/2018 12:06:53 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_ProdModLink] ON [dbo].[ProdModLink]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
