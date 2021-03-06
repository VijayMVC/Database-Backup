/****** Object:  Table [dbo].[RoyaltyCheck]    Script Date: 5/15/2018 11:59:26 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[RoyaltyCheck](
	[ZW ID] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Store Number] [bigint] NULL,
	[StoreOpenDate] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Royalty Sales] [money] NULL,
	[ODS Sales] [money] NOT NULL,
	[RS-ODS] [money] NULL,
	[Absolute Diff] [money] NULL,
	[Shipping_Amount] [decimal](38, 6) NULL,
	[Source] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Keystone Begin Date] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Core Begin Date] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LY ODS Sales] [money] NULL,
	[LY Royalty Sales] [money] NULL,
	[PeriodEndDate] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CB_Royalty] [money] NULL
) ON [PRIMARY]

GO
