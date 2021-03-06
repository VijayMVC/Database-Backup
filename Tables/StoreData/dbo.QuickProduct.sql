/****** Object:  Table [dbo].[QuickProduct]    Script Date: 5/15/2018 12:06:53 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[QuickProduct](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[ProductID] [int] NULL,
	[ImageID] [int] NULL,
	[ImageStoreID] [int] NULL,
	[ImageClassTypeID] [int] NULL,
	[ParentID] [int] NULL,
	[LinkIndex] [int] NULL,
	[ProductClassTypeID] [int] NULL,
 CONSTRAINT [QuickProduct_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_QuickProduct_siQuickReport_Image]    Script Date: 5/15/2018 12:06:53 PM ******/
CREATE NONCLUSTERED INDEX [Index_QuickProduct_siQuickReport_Image] ON [dbo].[QuickProduct]
(
	[ImageID] ASC,
	[ImageStoreID] ASC,
	[ImageClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_QuickProduct_siQuickReport_Parent]    Script Date: 5/15/2018 12:06:53 PM ******/
CREATE NONCLUSTERED INDEX [Index_QuickProduct_siQuickReport_Parent] ON [dbo].[QuickProduct]
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_QuickProduct_siQuickReport_Product]    Script Date: 5/15/2018 12:06:53 PM ******/
CREATE NONCLUSTERED INDEX [Index_QuickProduct_siQuickReport_Product] ON [dbo].[QuickProduct]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
