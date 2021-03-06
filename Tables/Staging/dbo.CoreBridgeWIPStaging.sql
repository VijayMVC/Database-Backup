/****** Object:  Table [dbo].[CoreBridgeWIPStaging]    Script Date: 5/15/2018 12:06:19 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[CoreBridgeWIPStaging](
	[StoreNumber] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FranchiseId] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CompanyLocationId] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastUpdate] [date] NULL,
	[LastUpdate_yyyymm] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[# of Orders in BUILT] [decimal](38, 6) NULL,
	[# of Orders in Receivables] [decimal](38, 6) NULL,
	[# of Orders in WIP] [decimal](38, 6) NULL,
	[# of Voided (Pre-Completed)] [decimal](38, 6) NULL,
	[$ in Orders in BUILT] [decimal](38, 6) NULL,
	[$ in Orders in WIP] [decimal](38, 6) NULL,
	[$ in Voided (Pre-Completed)] [decimal](38, 6) NULL,
	[Total $ in Receivables] [decimal](38, 6) NULL
) ON [PRIMARY]

GO
