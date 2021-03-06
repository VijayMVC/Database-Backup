/****** Object:  Table [dbo].[GL Database_deletes]    Script Date: 5/15/2018 12:00:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GL Database_deletes](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[DateTime] [datetime] NULL,
	[OrderID] [int] NULL,
	[CustomerID] [int] NULL,
	[RecordID] [int] NULL,
	[AccountCode] [int] NULL,
	[UserID] [int] NULL,
	[Amount] [money] NULL,
	[Description] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Closed] [bit] NULL,
	[ClosedDate] [datetime] NULL,
	[Exported] [bit] NULL,
	[ExportedDate] [datetime] NULL,
	[ExportedBatch] [int] NULL,
	[EnteredByID] [int] NULL,
	[SubAccountCode] [int] NULL,
	[Taxable] [bit] NULL,
	[Consolidated] [bit] NULL,
	[Category] [int] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] NOT NULL,
	[RoyaltyGroupID] [int] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[OrderDetailID] [int] NULL,
	[ProductID] [int] NULL
) ON [PRIMARY]

GO
