/****** Object:  Table [dbo].[TaxRate]    Script Date: 5/15/2018 12:08:42 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TaxRate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[TaxCategoryId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateProvinceId] [int] NOT NULL,
	[Zip] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Percentage] [decimal](18, 4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
