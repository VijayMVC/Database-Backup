/****** Object:  Table [dbo].[Order Database_deletes]    Script Date: 5/15/2018 12:06:26 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Order Database_deletes](
	[OrderID] [int] NULL,
	[StoreID] [int] NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[OrderDate] [datetime] NULL
) ON [PRIMARY]

GO
