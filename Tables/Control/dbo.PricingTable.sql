/****** Object:  Table [dbo].[PricingTable]    Script Date: 5/15/2018 11:58:54 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[PricingTable](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[RowCount] [int] NULL,
	[ColCount] [int] NULL,
	[IsSymmetricTable] [bit] NULL,
	[RowParam1ID] [int] NULL,
	[RowParam1ClassTypeID] [int] NULL,
	[RowParam2ID] [int] NULL,
	[RowParam2ClassTypeID] [int] NULL,
	[ColParamID] [int] NULL,
	[ColParamClassTypeID] [int] NULL,
	[OnRowNotFound] [int] NULL,
	[OnRowOutOfBounds] [int] NULL,
	[OnColNotFound] [int] NULL,
	[TableElementStr] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PricingTableName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CategoryID] [int] NULL,
	[CategoryStoreID] [int] NULL,
	[CategoryClassTypeID] [int] NULL,
	[Row1UnitID] [int] NULL,
	[Row2UnitID] [int] NULL,
	[ColUnitID] [int] NULL,
	[Notes] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PricingTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[ClassTypeID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
