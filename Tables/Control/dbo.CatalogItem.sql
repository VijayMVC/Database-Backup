/****** Object:  Table [dbo].[CatalogItem]    Script Date: 5/15/2018 11:58:48 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CatalogItem](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[PartID] [int] NULL,
	[VendorID] [int] NULL,
	[BarCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cost] [float] NULL,
	[PackageSize] [float] NULL,
	[PackageUnitID] [int] NULL,
	[UnitCost] [float] NULL,
	[VendorPartName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PartNumber] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VendorPriority] [int] NULL,
	[Flags] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BillingNotes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProductionNotes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CatalogItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
