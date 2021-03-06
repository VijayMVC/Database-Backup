/****** Object:  Table [dbo].[GLFactUpdate]    Script Date: 5/15/2018 12:06:25 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GLFactUpdate](
	[GLFactKey] [int] NOT NULL,
	[ID] [int] NULL,
	[ZW_Franchise_ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TransactionDateTime] [datetime] NULL,
	[OrderID] [int] NULL,
	[OrderKey] [int] NULL,
	[CustomerID] [int] NULL,
	[CustomerKey] [int] NULL,
	[AccountCode] [int] NULL,
	[UserID] [int] NULL,
	[UserKey] [int] NULL,
	[Amount] [money] NULL,
	[DescriptionKey] [int] NULL,
	[Closed] [bit] NULL,
	[ClosedDate] [date] NULL,
	[Exported] [bit] NULL,
	[ExportedDate] [date] NULL,
	[ExportedBatch] [int] NULL,
	[EnteredByID] [int] NULL,
	[EnteredByKey] [int] NULL,
	[SubAccountCode] [int] NULL,
	[Taxable] [bit] NULL,
	[Consolidated] [bit] NULL,
	[Category] [int] NULL,
	[RoyaltyGroupID] [int] NULL,
	[ModifiedByComputerKey] [int] NULL,
	[OrderDetailID] [int] NULL,
	[OrderDetailKey] [int] NULL,
	[ProductID] [int] NULL,
	[ProductKey] [int] NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[UpdateCheckSum] [int] NULL,
	[CenterKey] [int] NOT NULL,
	[KeystoneGLFactKey] [varchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
