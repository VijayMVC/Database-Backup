/****** Object:  Table [dbo].[PartGL]    Script Date: 5/15/2018 12:06:49 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PartGL](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [smalldatetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[EntryDateTime] [smalldatetime] NULL,
	[Cost] [numeric](18, 4) NULL,
	[UnitCost] [numeric](18, 4) NULL,
	[GroupID] [int] NULL,
	[GLAccountID] [int] NULL,
	[GLAccountClassTypeID] [int] NULL,
	[CustomerID] [int] NULL,
	[CustomerClassTypeID] [int] NULL,
	[VendorID] [int] NULL,
	[VendorClassTypeID] [int] NULL,
	[PartID] [int] NULL,
	[PartClassTypeID] [int] NULL,
	[ProductID] [int] NULL,
	[ProductClassTypeID] [int] NULL,
	[ModifierID] [int] NULL,
	[ModifierClassTypeID] [int] NULL,
	[TransHeaderID] [int] NULL,
	[TransHeaderClassTypeID] [int] NULL,
	[TransDetailID] [int] NULL,
	[TransDetailClassTypeID] [int] NULL,
	[TransModID] [int] NULL,
	[TransModClassTypeID] [int] NULL,
	[TransPartID] [int] NULL,
	[TransPartClassTypeID] [int] NULL,
	[Quantity] [numeric](18, 4) NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Reserved] [bit] NULL,
 CONSTRAINT [PK_PartGL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [Index_PartGL]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL] ON [dbo].[PartGL]
(
	[Cost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_CustomerID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_CustomerID] ON [dbo].[PartGL]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_GLAccountID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_GLAccountID] ON [dbo].[PartGL]
(
	[GLAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_ModifierID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_ModifierID] ON [dbo].[PartGL]
(
	[ModifierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_PartID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_PartID] ON [dbo].[PartGL]
(
	[PartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_ProductID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_ProductID] ON [dbo].[PartGL]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_TransDetailID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_TransDetailID] ON [dbo].[PartGL]
(
	[TransDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_TransHeaderID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_TransHeaderID] ON [dbo].[PartGL]
(
	[TransHeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_TransModID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_TransModID] ON [dbo].[PartGL]
(
	[TransModID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_TransPartID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_TransPartID] ON [dbo].[PartGL]
(
	[TransPartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [Index_PartGL_VendorID]    Script Date: 5/15/2018 12:06:49 PM ******/
CREATE NONCLUSTERED INDEX [Index_PartGL_VendorID] ON [dbo].[PartGL]
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
