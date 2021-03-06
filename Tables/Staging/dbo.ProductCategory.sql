/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/15/2018 12:06:29 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [int] NULL,
	[StoreID] [int] NULL,
	[ProductCategory] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActiveCategory] [bit] NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zw_active] [bit] NULL,
	[zw_pk_id] [int] NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
