/****** Object:  Table [dbo].[UserFieldLayout]    Script Date: 5/15/2018 12:07:02 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[UserFieldLayout](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[LayoutName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AssociatedClassTypeID] [int] NULL,
	[Layout] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortIndex] [int] NULL,
	[ShowOrder] [bit] NULL,
	[ShowEstimate] [bit] NULL,
	[ShowTemplate] [bit] NULL,
	[ShowService] [bit] NULL,
	[ShowClient] [bit] NULL,
	[ShowProspect] [bit] NULL,
	[ShowFullContact] [bit] NULL,
	[ShowLimitedContact] [bit] NULL,
	[ShowVendor] [bit] NULL,
	[ShowPersonal] [bit] NULL,
	[ShowMaterialPart] [bit] NULL,
	[ShowLaborPart] [bit] NULL,
	[ShowEquipmentPart] [bit] NULL,
	[ShowOutsourcePart] [bit] NULL,
	[ShowOtherPart] [bit] NULL,
	[ShowFreightPart] [bit] NULL,
	[ShowLocationPart] [bit] NULL,
 CONSTRAINT [UserFieldLayout_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [Index_UserFieldLayout_AssociatedClassTypeID]    Script Date: 5/15/2018 12:07:02 PM ******/
CREATE NONCLUSTERED INDEX [Index_UserFieldLayout_AssociatedClassTypeID] ON [dbo].[UserFieldLayout]
(
	[AssociatedClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [Index_UserFieldLayout_LayoutName]    Script Date: 5/15/2018 12:07:02 PM ******/
CREATE NONCLUSTERED INDEX [Index_UserFieldLayout_LayoutName] ON [dbo].[UserFieldLayout]
(
	[LayoutName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
