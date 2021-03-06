/****** Object:  Table [dbo].[Product_Category_Mapping]    Script Date: 5/15/2018 12:08:22 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Product_Category_Mapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsFeaturedProduct] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_PCM_Product_and_Category]    Script Date: 5/15/2018 12:08:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_PCM_Product_and_Category] ON [dbo].[Product_Category_Mapping]
(
	[CategoryId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[Product_Category_Mapping]  WITH CHECK ADD  CONSTRAINT [ProductCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Product_Category_Mapping] CHECK CONSTRAINT [ProductCategory_Category]
ALTER TABLE [dbo].[Product_Category_Mapping]  WITH CHECK ADD  CONSTRAINT [ProductCategory_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[Product_Category_Mapping] CHECK CONSTRAINT [ProductCategory_Product]
GO
