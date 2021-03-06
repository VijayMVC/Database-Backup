/****** Object:  Table [dbo].[_Parameter]    Script Date: 5/15/2018 12:06:40 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[_Parameter](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ParameterName] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParameterType] [int] NULL,
	[ParameterCategoryID] [int] NULL,
	[UnitType] [int] NULL,
	[DefaultFormatMask] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultInputMask] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultPricingType] [int] NULL,
	[Formula] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsModifierParam] [bit] NULL,
	[DefaultUnitID] [int] NULL,
	[DefaultNumberValue] [float] NULL,
	[DefaultTextValue] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DefaultMinValue] [float] NULL,
	[DefaultMaxValue] [float] NULL,
	[IsEnteredParam] [bit] NULL,
 CONSTRAINT [Parameter_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_Parameter_DefaultUnitID]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [Index_Parameter_DefaultUnitID] ON [dbo].[_Parameter]
(
	[DefaultUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Index_Parameter_ParameterName]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [Index_Parameter_ParameterName] ON [dbo].[_Parameter]
(
	[ParameterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Indexes_Parameter]    Script Date: 5/15/2018 12:06:40 PM ******/
CREATE NONCLUSTERED INDEX [Indexes_Parameter] ON [dbo].[_Parameter]
(
	[ParameterCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
