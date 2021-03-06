/****** Object:  Table [dbo].[PartGL]    Script Date: 5/15/2018 11:58:52 AM ******/
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
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PartGL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
