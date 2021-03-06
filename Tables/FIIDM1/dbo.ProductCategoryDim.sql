/****** Object:  Table [dbo].[ProductCategoryDim]    Script Date: 5/15/2018 11:59:54 AM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProductCategoryDim](
	[ProductCategoryKey] [int] NULL,
	[ProductCategory] [varchar](35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ActiveCategory] [bit] NULL,
	[ZW_Franchise_ID] [varchar](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OLTP_InsertDate] [datetime] NULL,
	[OLTP_UpdateDate] [datetime] NULL,
	[t_WebNumber] [smallint] NULL,
	[t_ProductCategoryID] [int] NULL,
	[t_StoreID] [int] NULL
) ON [PRIMARY]

GO
