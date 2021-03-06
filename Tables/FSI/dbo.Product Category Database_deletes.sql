/****** Object:  Table [dbo].[Product Category Database_deletes]    Script Date: 5/15/2018 12:00:55 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Product Category Database_deletes](
	[ProductCategoryID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[ProductCategory] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActiveCategory] [bit] NULL,
	[zw_franchise_id] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[sys_di] [datetime] NULL,
	[sys_du] [datetime] NULL,
	[zw_active] [bit] NOT NULL,
	[zw_pk_id] [int] NOT NULL,
	[ModifiedByComputer] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
