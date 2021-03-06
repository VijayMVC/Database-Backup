/****** Object:  Table [dbo].[RoyaltySalesExtract]    Script Date: 5/15/2018 12:06:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RoyaltySalesExtract](
	[id] [bigint] NULL,
	[StoreNumber] [bigint] NULL,
	[WebNumber] [bigint] NULL,
	[StoreType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Owner] [varchar](101) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[WebsiteUrl] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Alert] [bit] NULL,
	[LimitedServices] [bit] NULL,
	[COD] [bit] NULL,
	[Operational] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Pacesetter] [bit] NULL,
	[EndDate] [datetime] NULL,
	[TotalSales] [numeric](18, 2) NULL,
	[OperatingMonth] [bigint] NULL,
	[StoreOpenDate] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StoreOpenByYear] [int] NULL,
	[StoreResaleDate] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[VanityName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
