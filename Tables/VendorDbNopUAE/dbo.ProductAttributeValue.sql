/****** Object:  Table [dbo].[ProductAttributeValue]    Script Date: 5/15/2018 12:08:39 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[ProductAttributeValue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductAttributeMappingId] [int] NOT NULL,
	[AttributeValueTypeId] [int] NOT NULL,
	[AssociatedProductId] [int] NOT NULL,
	[Name] [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ColorSquaresRgb] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PriceAdjustment] [decimal](18, 4) NOT NULL,
	[WeightAdjustment] [decimal](18, 4) NOT NULL,
	[Cost] [decimal](18, 4) NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsPreSelected] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[PictureId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_ProductAttributeValue_ProductAttributeMappingId_DisplayOrder]    Script Date: 5/15/2018 12:08:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductAttributeValue_ProductAttributeMappingId_DisplayOrder] ON [dbo].[ProductAttributeValue]
(
	[ProductAttributeMappingId] ASC,
	[DisplayOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 97) ON [PRIMARY]
ALTER TABLE [dbo].[ProductAttributeValue]  WITH CHECK ADD  CONSTRAINT [ProductAttributeValue_ProductAttributeMapping] FOREIGN KEY([ProductAttributeMappingId])
REFERENCES [dbo].[Product_ProductAttribute_Mapping] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[ProductAttributeValue] CHECK CONSTRAINT [ProductAttributeValue_ProductAttributeMapping]
GO
