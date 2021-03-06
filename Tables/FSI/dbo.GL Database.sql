/****** Object:  Table [dbo].[GL Database]    Script Date: 5/15/2018 12:00:51 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GL Database](
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
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] IDENTITY(1,1) NOT NULL,
	[RoyaltyGroupID] [int] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[OrderDetailID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_GL Database] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[StoreID] ASC,
	[zw_franchise_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_GL Database_15_930102354__K23_K1_K2_K3_7_9_17]    Script Date: 5/15/2018 12:00:51 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_GL Database_15_930102354__K23_K1_K2_K3_7_9_17] ON [dbo].[GL Database]
(
	[zw_franchise_id] ASC,
	[ID] ASC,
	[StoreID] ASC,
	[DateTime] ASC
)
INCLUDE ( 	[AccountCode],
	[Amount],
	[SubAccountCode]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [_dta_index_GL Database_15_930102354__K7_K3_K23_K1_K2_9]    Script Date: 5/15/2018 12:00:51 PM ******/
CREATE NONCLUSTERED INDEX [_dta_index_GL Database_15_930102354__K7_K3_K23_K1_K2_9] ON [dbo].[GL Database]
(
	[AccountCode] ASC,
	[DateTime] ASC,
	[zw_franchise_id] ASC,
	[ID] ASC,
	[StoreID] ASC
)
INCLUDE ( 	[Amount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

/****** Object:  Index [NCIDX_GLDatabase_multiple2]    Script Date: 5/15/2018 12:00:51 PM ******/
CREATE NONCLUSTERED INDEX [NCIDX_GLDatabase_multiple2] ON [dbo].[GL Database]
(
	[zw_franchise_id] ASC,
	[AccountCode] ASC,
	[DateTime] ASC,
	[OrderID] ASC
)
INCLUDE ( 	[Amount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
