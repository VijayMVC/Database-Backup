/****** Object:  Table [dbo].[Estimate Modifiers Database_deletes]    Script Date: 5/15/2018 12:00:50 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Estimate Modifiers Database_deletes](
	[ID] [int] NOT NULL,
	[OrderDetailID] [int] NULL,
	[AVID] [int] NULL,
	[OrderID] [int] NULL,
	[Answer] [int] NULL,
	[Price] [float] NULL,
	[PriceOverridden] [bit] NULL,
	[CalcPrice] [float] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NOT NULL,
	[sys_du] [datetime] NOT NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] NOT NULL
) ON [PRIMARY]

GO
