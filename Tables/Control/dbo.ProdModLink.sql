/****** Object:  Table [dbo].[ProdModLink]    Script Date: 5/15/2018 11:58:54 AM ******/
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
	[DisplayFormula] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseDefault] [int] NULL,
	[DefaultValue] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UseAlternateList] [bit] NULL,
	[SelectionListID] [int] NULL,
	[UseAltList] [bit] NULL,
	[AltListParamID] [int] NULL,
	[AltListParamStoreID] [int] NULL,
	[AltListParamClassTypeID] [int] NULL,
	[ShowInGrid] [bit] NULL,
	[DefaultPartConsumptionFx] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPart2ConsumptionFx] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AltDependentListName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartConsumptionFormulas] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartConsumptionUnitIDs] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProdModLink] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
