/****** Object:  Table [dbo].[TierPrice]    Script Date: 5/15/2018 12:03:37 PM ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[TierPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantId] [int] NOT NULL,
	[CustomerRoleId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Index [IX_TierPrice_ProductVariantId]    Script Date: 5/15/2018 12:03:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_TierPrice_ProductVariantId] ON [dbo].[TierPrice]
(
	[ProductVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[TierPrice]  WITH CHECK ADD  CONSTRAINT [TierPrice_CustomerRole] FOREIGN KEY([CustomerRoleId])
REFERENCES [dbo].[CustomerRole] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[TierPrice] CHECK CONSTRAINT [TierPrice_CustomerRole]
ALTER TABLE [dbo].[TierPrice]  WITH CHECK ADD  CONSTRAINT [TierPrice_ProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariant] ([Id])
ON DELETE CASCADE
ALTER TABLE [dbo].[TierPrice] CHECK CONSTRAINT [TierPrice_ProductVariant]
GO
