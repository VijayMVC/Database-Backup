/****** Object:  Table [dbo].[packages_products]    Script Date: 5/15/2018 12:04:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[packages_products](
	[package_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[product_id] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[quantity] [int] NOT NULL,
	[discount] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_packages_products_package_id] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
