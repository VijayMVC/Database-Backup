/****** Object:  Table [dbo].[GLBackup122005]    Script Date: 5/15/2018 12:06:46 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GLBackup122005](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ClassTypeID] [int] NOT NULL,
	[ModifiedByUser] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedByComputer] [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[SeqID] [int] NULL,
	[IsSystem] [bit] NULL,
	[IsActive] [bit] NULL,
	[EntryDateTime] [datetime] NULL,
	[Amount] [decimal](18, 4) NULL,
	[Classification] [int] NULL,
	[IsTaxable] [bit] NULL,
	[GroupID] [int] NULL,
	[GLAccountID] [int] NULL,
	[GLAccountClassTypeID] [int] NULL,
	[AccountID] [int] NULL,
	[AccountClassTypeID] [int] NULL,
	[TransactionID] [int] NULL,
	[TransactionClassTypeID] [int] NULL,
	[TransDetailID] [int] NULL,
	[TransDetailClassTypeID] [int] NULL,
	[GoodsItemID] [int] NULL,
	[GoodsItemClassTypeID] [int] NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DivisionID] [int] NULL
) ON [PRIMARY]

GO
