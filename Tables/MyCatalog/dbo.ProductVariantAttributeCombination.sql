/****** Object:  Table [dbo].[ProductVariantAttributeCombination]    Script Date: 5/15/2018 12:03:31 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProductVariantAttributeCombination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantId] [int] NOT NULL,
	[AttributesXml] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StockQuantity] [int] NOT NULL,
	[AllowOutOfStockOrders] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[ProductVariantAttributeCombination]  WITH CHECK ADD  CONSTRAINT [ProductVariantAttributeCombination_ProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariant] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[ProductVariantAttributeCombination] CHECK CONSTRAINT [ProductVariantAttributeCombination_ProductVariant]
GO
