/****** Object:  Table [Staging].[ProductCategories]    Script Date: 5/15/2018 11:59:58 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [Staging].[ProductCategories](
	[WebNumber]  AS (case when ascii(substring([ZW_FRANCHISE_ID],(4),(1)))<(58) then CONVERT([smallint],right([ZW_FRANCHISE_ID],(4)),(0)) else CONVERT([smallint],(-1),(0)) end),
	[ProductCategoryID] [int] NULL,
	[StoreID] [int] NULL,
	[ProductCategory] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActiveCategory] [bit] NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_franchise_id] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

GO
