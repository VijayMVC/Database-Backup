/****** Object:  Table [dbo].[Promotion Database_deletes]    Script Date: 5/15/2018 12:00:56 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Promotion Database_deletes](
	[ID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[Promotion] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DiscountPercent] [float] NULL,
	[DiscountAmount] [money] NULL,
	[MinimumPurchase] [money] NULL,
	[ActivePromotion] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] NOT NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
