/****** Object:  Table [dbo].[TransVariation]    Script Date: 5/15/2018 12:07:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TransVariation](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[TransactionType] [int] NULL,
	[ParentID] [int] NULL,
	[ParentClassTypeID] [int] NULL,
	[VariationName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortIndex] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[PricingLevel] [float] NULL,
	[PricingLevelOverridden] [bit] NULL,
	[DiscountLevel] [float] NULL,
	[DiscountLevelOverridden] [bit] NULL,
	[HTMLShortFormat] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTMLLongFormat] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BasePrice] [decimal](18, 4) NULL,
	[DiscountPrice] [decimal](18, 4) NULL,
	[ModifierPrice] [decimal](18, 4) NULL,
	[RawSubTotalPrice] [decimal](18, 4) NULL,
	[RoundingPrice] [decimal](18, 4) NULL,
	[SubTotalPrice] [decimal](18, 4) NULL,
	[TaxesPrice] [decimal](18, 4) NULL,
	[TotalPrice] [decimal](18, 4) NULL,
	[SonsBasePrice] [decimal](18, 4) NULL,
	[SonsDiscountPrice] [decimal](18, 4) NULL,
	[SonsModifierPrice] [decimal](18, 4) NULL,
	[SonsRawSubTotalPrice] [decimal](18, 4) NULL,
	[SonsRoundingPrice] [decimal](18, 4) NULL,
	[SonsSubTotalPrice] [decimal](18, 4) NULL,
	[SonsTaxesPrice] [decimal](18, 4) NULL,
	[SonsTotalPrice] [decimal](18, 4) NULL,
	[TaxablePrice] [float] NULL,
	[SonsTaxablePrice] [float] NULL,
 CONSTRAINT [TransVariation_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [TransHeaderParentIDIndex]    Script Date: 5/15/2018 12:07:02 PM ******/
CREATE NONCLUSTERED INDEX [TransHeaderParentIDIndex] ON [dbo].[TransVariation]
(
	[ParentID] ASC,
	[StoreID] ASC,
	[ParentClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [TransVariationSortIndexIndex]    Script Date: 5/15/2018 12:07:02 PM ******/
CREATE NONCLUSTERED INDEX [TransVariationSortIndexIndex] ON [dbo].[TransVariation]
(
	[SortIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
