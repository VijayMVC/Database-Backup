/****** Object:  Table [dbo].[OrderProductVariant]    Script Date: 5/15/2018 12:03:47 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[OrderProductVariant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderProductVariantGuid] [uniqueidentifier] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductVariantId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPriceInclTax] [decimal](18, 4) NOT NULL,
	[UnitPriceExclTax] [decimal](18, 4) NOT NULL,
	[PriceInclTax] [decimal](18, 4) NOT NULL,
	[PriceExclTax] [decimal](18, 4) NOT NULL,
	[DiscountAmountInclTax] [decimal](18, 4) NOT NULL,
	[DiscountAmountExclTax] [decimal](18, 4) NOT NULL,
	[AttributeDescription] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AttributesXml] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DownloadCount] [int] NOT NULL,
	[IsDownloadActivated] [bit] NOT NULL,
	[LicenseDownloadId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

/****** Object:  Index [idx_OrderProductVariant_ProductVariantId_includes]    Script Date: 5/15/2018 12:03:47 PM ******/
CREATE NONCLUSTERED INDEX [idx_OrderProductVariant_ProductVariantId_includes] ON [dbo].[OrderProductVariant]
(
	[ProductVariantId] ASC
)
INCLUDE ( 	[OrderId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
/****** Object:  Index [IX_OrderProductVariant_OrderId]    Script Date: 5/15/2018 12:03:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderProductVariant_OrderId] ON [dbo].[OrderProductVariant]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[OrderProductVariant]  WITH CHECK ADD  CONSTRAINT [OrderProductVariant_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[OrderProductVariant] CHECK CONSTRAINT [OrderProductVariant_Order]
ALTER TABLE [dbo].[OrderProductVariant]  WITH CHECK ADD  CONSTRAINT [OrderProductVariant_ProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariant] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[OrderProductVariant] CHECK CONSTRAINT [OrderProductVariant_ProductVariant]
GO
